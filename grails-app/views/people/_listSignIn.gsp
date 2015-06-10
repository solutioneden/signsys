<div class="row">
    <div class="col-xs-12">
        <div class="table-header">
            ${jsonBindSignInResult.stillInPeopleCount} people still in the building.
        </div>

        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>Company</th>
                <th>Photo</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Vehicle Reg</th>
                <th>Check in</th>
                <th>Check out</th>
                <th>Status</th>
            </tr>
            </thead>

            <tbody>
            <g:each var="signin" in="${jsonBindSignInResult.allPeople}">
                <tr>
                    <td>${signin.company}</td>
                    <td>
                        <a data-toggle="modal" data-target="#${"photo" + signin.id}">
                            <img src="${serverUrl + "/images/photo/" + signin.headImage}" alt="no photo taken"
                                 height="60px"/>
                        </a>

                        <div class="modal fade align-center" id="${"photo" + signin.id}" tabindex="-1" role="dialog"
                             aria-labelledby="imageLabel${signin.id}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title"
                                            id="imageLabel${signin.id}">${signin.firstName}&nbsp;${signin.lastName}</h4>
                                    </div>

                                    <div class="modal-body">
                                        <img src="${serverUrl + "/images/photo/" + signin.headImage}" width="480px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>${signin.firstName}&nbsp;${signin.lastName}</td>
                    <td>${signin.mobile}</td>
                    <td>${signin.email}</td>
                    <td>${signin.vehicleReg}</td>
                    <td>${signin.signIn?signin.signIn.format("hh:mm:ss a"):""}</td>
                    <td>${signin.signOut?signin.signOut.format("hh:mm:ss a"):""}</td>
                    <td>
                        <label class="pull-right inline">
                            <g:if test="${signin.signOut == null}">
                                <input id="switchSignIn${signin.id}" checked="" type="checkbox" class="ace ace-switch"/>
                            </g:if>
                            <g:else>
                                <input id="switchSignIn${signin.id}" type="checkbox" class="ace ace-switch"/>
                            </g:else>
                            <span class="lbl middle"></span>
                            <script type="text/javascript">
                                $("#${"switchSignIn"+signin.id}").on(ace.click_event, function () {
                                    if ($("#${"switchSignIn"+signin.id}").is(':checked')) {
                                        $.post("${serverUrl}/people/clearSignOut", {id: "${signin.id}"})
                                                .done(function () {
                                                    setTimeout(function () {
                                                        $.post("${serverUrl}/people/listSignIn")
                                                                .done(function (data) {
                                                                    $("#listSignInDiv").html(data);
                                                                });
                                                        $.post("${serverUrl}/people/listStaffs")
                                                                .done(function (data) {
                                                                    $("#listStaffs").html(data);
                                                                });
                                                    }, 318);
                                                });
                                    } else {
                                        $.post("${serverUrl}/people/signOut", {id: "${signin.id}"})
                                                .done(function () {
                                                    setTimeout(function () {
                                                        $.post("${serverUrl}/people/listSignIn")
                                                                .done(function (data) {
                                                                    $("#listSignInDiv").html(data);
                                                                });
                                                        $.post("${serverUrl}/people/listStaffs")
                                                                .done(function (data) {
                                                                    $("#listStaffs").html(data);
                                                                });
                                                    }, 318);
                                                });
                                    }
                                });
                            </script>
                        </label>

                        <div class="hidden-sm hidden-xs btn-group">
                            <button class="btn btn-success btn-xs" data-toggle="modal"
                                    data-target="#updatePeopleModal${signin.id}">
                                <i class="ace-icon fa fa-update bigger-175"></i>
                                Update
                            </button>
                            <a class="btn btn-danger btn-xs" href="${serverUrl + '/people/deletePeople/?id='}${signin.id}">
                                <i class="ace-icon fa fa-update bigger-175"></i>
                                Delete
                            </a>
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <g:each var="signin" in="${jsonBindSignInResult.allPeople}">
            <div class="modal fade" id="updatePeopleModal${signin.id}" tabindex="-1" role="dialog"
                 aria-labelledby="updatePeopleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="updatePeopleModalLabel">Update signin profile</h4>
                        </div>

                        <div class="modal-body">
                            <form id="formUpdatePeople${signin.id}" class="form-horizontal"
                                  action="${createLink(controller: 'people', action: 'updatePeople')}" method="post">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        Upload Photo / Take Photo:
                                        <input type="file" name="headImageCanvas" id="headImageCanvas${signin.id}"/>
                                        <input type="hidden" name="headImage" id="headImage${signin.id}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="text" name="firstName" placeholder="First name"
                                               value="${signin.firstName}" class="col-sm-12"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="text" name="lastName" placeholder="Last name"
                                               value="${signin.lastName}" class="col-sm-12"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="text" name="company" placeholder="Company"
                                               value="${signin.company}" class="col-sm-12"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="text" name="mobile" placeholder="Mobile" value="${signin.mobile}"
                                               class="col-sm-12"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="text" name="email" placeholder="Email" value="${signin.email}"
                                               class="col-sm-12"/>
                                        <input type="hidden" name="id" value="${signin.id}" class="col-sm-12"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="text" name="vehicleReg" placeholder="Vehicle Registration"
                                               value="${signin.vehicleReg}" class="col-sm-12"/>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="modal-footer">
                            <script type="text/javascript">
                                $(function() {
                                    $('#headImageCanvas${signin.id}').picEdit({
                                        imageUpdated: function(img){
                                        },
                                        formSubmitted: function(){
                                        },
                                        redirectUrl: "${serverUrl+'?resultMsg=Updated'}",
                                        defaultImage: false
                                    });
                                });

                                function formUpdatePeopleSubmit${signin.id}() {
                                    $("#formUpdatePeople${signin.id}").submit();
                                }
                            </script>
                            <a class="btn btn-success" onclick="formUpdatePeopleSubmit${signin.id}()">Update</a>
                        </div>
                    </div>
                </div>
            </div>
        </g:each>
        <script type="text/javascript">
            var oTable1 =
                    $('#dynamic-table')
                        //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
                            .dataTable({
                                bAutoWidth: false,
                                "aoColumns": [
                                    {"bSortable": true},
                                    {"bSortable": false},
                                    null, null, null, null, null, null,
                                    {"bSortable": false}
                                ],
                                "aaSorting": [],

                                //,
                                //"sScrollY": "200px",
                                //"bPaginate": false,

                                //"sScrollX": "100%",
                                //"sScrollXInner": "120%",
                                //"bScrollCollapse": true,
                                //Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
                                //you may want to wrap the table inside a "div.dataTables_borderWrap" element
                                "iDisplayLength": 100
                            });
        </script>
    </div>
</div>
