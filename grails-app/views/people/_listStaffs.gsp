<div class="row">
    <div class="col-xs-12">
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>Photo</th>
                <th>Name</th>
                <th>Status</th>
            </tr>
            </thead>

            <tbody>
            <g:each var="signin" in="${staffs}">
                <tr>
                    <td>
                        <img src="${serverUrl + "/images/photo/"}${signin.headImage}" height="40px"/>
                    </td>
                    <td>${signin.firstName}&nbsp;${signin.lastName}</td>
                    <td>
                        <label class="pull-right inline">
                            <g:if test="${signin.signOut == null && signin.signIn > new Date().clearTime()}">
                                <input id="staffSwitchSignIn${signin.id}" checked="" type="checkbox"
                                       class="ace ace-switch"/>
                            </g:if>
                            <g:else>
                                <input id="staffSwitchSignIn${signin.id}" type="checkbox" class="ace ace-switch"/>
                            </g:else>
                            <span class="lbl middle"></span>
                            <input type="hidden" id="${signin.id}firstName" value="${signin.firstName}"/>
                            <input type="hidden" id="${signin.id}lastName" value="${signin.lastName}"/>
                            <input type="hidden" id="${signin.id}company" value="${signin.company}"/>
                            <input type="hidden" id="${signin.id}mobile" value="${signin.mobile}"/>
                            <input type="hidden" id="${signin.id}email" value="${signin.email}"/>
                            <input type="hidden" id="${signin.id}vehicleReg" value="${signin.vehicleReg}"/>
                            <input type="hidden" id="${signin.id}headImage" value="${signin.headImage}"/>
                            <script type="text/javascript">
                                $("#${"staffSwitchSignIn"+signin.id}").on(ace.click_event, function () {
                                    if ($("#${"staffSwitchSignIn"+signin.id}").is(':checked')) {
                                        if (${signin.signIn > new Date().clearTime()}) {
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
                                            $.post("${serverUrl}/people/signIn", {
                                                firstName: $("#${signin.id}firstName").val(),
                                                lastName: $("#${signin.id}lastName").val(),
                                                company: $("#${signin.id}company").val(),
                                                mobile: $("#${signin.id}mobile").val(),
                                                email: $("#${signin.id}email").val(),
                                                vehicleReg: $("#${signin.id}vehicleReg").val(),
                                                headImage: $("#${signin.id}headImage").val()
                                            })
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
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
