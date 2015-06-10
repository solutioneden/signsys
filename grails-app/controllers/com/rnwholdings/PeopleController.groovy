package com.rnwholdings

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import sun.misc.BASE64Decoder

class PeopleController {

    def grailsApplication

    def index() {
        [
                'serverUrl': grailsApplication.config.grails.serverURL
        ]
    }

    def deletePeople() {
        int id = Integer.parseInt(params.id)
        def aPeople = People.get(id)
        aPeople.delete(flush: true)
        if (request.xhr) {
            render("Successfully updated")
        } else {
            redirect(controller: 'people', action: 'index', params: [resultMsg: 'Successfully updated'])
        }
    }

    def updatePeople(long id,
                     String firstName,
                     String lastName,
                     String email,
                     String mobile,
                     String company,
                     String vehicleReg) {
        def aPeople = People.get(id)

        String headImageName = new StringBuilder().append(email).append(".png").toString()
        String photoPath = servletContext.getRealPath("/images/photo")
//        println(photoPath)

        //picedit.js is modified for this decoding.
        if (params.headImage) {
//            println(params.headImage)
            def photoFile = params.headImage.toString().substring((params.headImage.toString().indexOf(",") + 1), params.headImage.toString().size())
//            println(photoFile)
            byte[] decodedBytes = new BASE64Decoder().decodeBuffer(photoFile)
            File image = new File(photoPath + "/" + headImageName)
            image.setBytes(decodedBytes)
        }

        aPeople.firstName = firstName
        aPeople.lastName = lastName
        aPeople.email = email
        aPeople.mobile = mobile
        aPeople.company = company
        aPeople.vehicleReg = vehicleReg
        aPeople.headImage = headImageName
        aPeople.signIn = new Date()
        aPeople.save()

        if (request.xhr) {
            render("Successfully updated")
        } else {
            redirect(controller: 'people', action: 'index', params: [resultMsg: 'Successfully updated'])
        }
    }

    def signIn(String firstName,
               String lastName,
               String email,
               String mobile,
               String company,
               String vehicleReg) {
        def today = new Date().clearTime()
        def now = new Date()
        def aPeople = People.withCriteria {
            eq("email", email)
            between("signIn", today, now)
        }

        if (aPeople.size() == 0) {
            String headImageName = new StringBuilder().append(email).append(".png").toString()
            String photoPath = servletContext.getRealPath("/images/photo")

            //picedit.js is modified for this decoding.
            if (params.headImage.toString().length()>200) {
                def photoFile = params.headImage.toString().substring((params.headImage.toString().indexOf(",") + 1), params.headImage.toString().size())
                byte[] decodedBytes = new BASE64Decoder().decodeBuffer(photoFile)
                File image = new File(photoPath + "/" + headImageName)
                image.setBytes(decodedBytes)
            }

            def newPeople = new People()
            newPeople.firstName = firstName
            newPeople.lastName = lastName
            newPeople.email = email
            newPeople.mobile = mobile
            newPeople.company = company
            newPeople.vehicleReg = vehicleReg
            newPeople.headImage = headImageName
            newPeople.signIn = new Date()
            newPeople.save()
        }

        if (request.xhr) {
            render("Successfully signed in")
        } else {
            redirect(controller: 'people', action: 'index', params: [resultMsg: 'Successfully Signed in'])
        }
    }

    def signOut(long id) {
        def today = new Date().clearTime()
        def now = new Date()
        def aPeople = People.withCriteria {
            eq("id", id)
            between("signIn", today, now)
        }

        if (aPeople.size() > 0) {
            def signoutPeople = People.get(aPeople.last().id)
            signoutPeople.signOut = new Date()
            signoutPeople.save()
        }

        render("Successfully signed out")
    }

    def clearSignOut(long id) {
        def today = new Date().clearTime()
        def now = new Date()
        def aPeople = People.withCriteria {
            eq("id", id)
            between("signIn", today, now)
        }

        if (aPeople.size() > 0) {
            def signoutPeople = People.get(aPeople.last().id)
            signoutPeople.signOut = null
            signoutPeople.save()
            println("Sign In Successfully")
        }

        render("Notice: sign in again")
    }

    def listSignIn() {
        def dateFrom = new Date().clearTime()
        def dateTo = new Date()

        def allPeople = People.withCriteria {
            between("signIn", dateFrom, dateTo)
        }
        def stillInPeopleCount = allPeople.findAll { it.signOut == null }.size()

        def jsonBindSignInResult = new JSONObject();
        jsonBindSignInResult.put("stillInPeopleCount", stillInPeopleCount)
        jsonBindSignInResult.put("allPeople", allPeople)

        if(params.isMobile) {
            render jsonBindSignInResult as JSON
        }

        if (request.xhr) {
            render(template: "listSignIn", model: ['jsonBindSignInResult': jsonBindSignInResult, 'serverUrl': grailsApplication.config.grails.serverURL])
        }
    }

    def listStaffs() {
        def staffs = People.withCriteria {
            eq("company", "RNW Holdings")
            order("signIn", "desc")
        }

        if(params.isMobile) {
            render staffs as JSON
        }

        if (request.xhr) {
            render(template: "listStaffs", model: ['staffs': staffs.unique{it.email}, 'serverUrl': grailsApplication.config.grails.serverURL])
        }
    }

}
