package com.rnwholdings

class People {

    String firstName
    String lastName
    String email
    String mobile
    String company
    String vehicleReg
    String headImage
    Date signIn
    Date signOut

    static constraints = {
        email email: true
    }

    static mapping = {
        table name: 'People'
    }
}
