<%--
  User: zhimenghuang
  Date: 02/06/15
  Time: 09:22
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>RNW SIGNAPP</title>
</head>

<body class="no-skin">

<div id="navbar" class="navbar navbar-default">
    <div class="navbar-container" id="navbar-container">

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header align-center">
            <!-- #section:basics/navbar.layout.brand -->
            <asset:image src="apple-touch-icon.png"/>&nbsp;
            RNW Holdings SignApp
        </div>
        <!-- /section:basics/navbar.dropdown -->
    </div><!-- /.navbar-container -->
</div>

<content tag="mainContent">

    <div class="row">
        <div class="col-xs-12 align-center">
            <div class="btn-group">
                <button class="btn btn-app btn-success btn-xs" data-toggle="modal"
                        data-target="#newVisitorCheckInModal">
                    <i class="ace-icon fa fa-sign-in bigger-175"></i>
                    Check In
                </button>

                <button data-toggle="dropdown" class="btn btn-app btn-success btn-xs dropdown-toggle">
                    <span class="bigger-110 ace-icon fa fa-caret-down icon-only"></span>
                </button>

                <ul class="dropdown-menu">
                    <li>
                        <a data-toggle="modal" data-target="#staffCheckInModal">Staff</a>
                    </li>
                </ul>
            </div>

            <div class="btn-group">
                <a class="btn btn-app btn-success btn-xs" href="${serverUrl}">
                    <i class="ace-icon fa fa-refresh bigger-175"></i>
                    Refresh
                </a>
            </div>

            %{--<div class="btn-group">--}%
                %{--<div class="row">--}%
                    %{--<div class="col-xs-8 col-sm-11">--}%
                        %{--<div class="input-daterange input-group">--}%
                            %{--<input type="text" class="input-sm form-control" name="dateFrom" />--}%
                            %{--<span class="input-group-addon">--}%
                                %{--<i class="fa fa-exchange"></i>--}%
                            %{--</span>--}%
                            %{--<input type="text" class="input-sm form-control" name="dateTo" />--}%
                        %{--</div>--}%
                        %{--<!-- /section:plugins/date-time.datepicker -->--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%
        </div>

        <div class="clearfix">
            <div class="pull-right tableTools-container"></div>
        </div>
    </div>

    <div id="alertRow" class="row">
        <div class="col-xs-12 align-center">
            <g:if test="${params.resultMsg}">
                <div class="alert alert-block alert-success">
                    ${params.resultMsg}
                </div>
            </g:if>
        </div>
    </div>

    <div id="listSignInDiv">
    </div>

    <script type="text/javascript">
        setTimeout(function() {
            $.post("${serverUrl}/people/listSignIn")
                    .done(function (data) {
                        $("#listSignInDiv").html(data);
                    });
        }, 318);
    </script>

</content>

<div class="modal fade" id="newVisitorCheckInModal" tabindex="-1" role="dialog"
     aria-labelledby="newVisitorCheckInModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="newVisitorCheckInModalLabel">New Visitor Check in</h4>
            </div>

            <div class="modal-body">
                <form id="formVisitorCheckIn" class="form-horizontal"
                      action="${createLink(controller: 'people', action: 'signIn')}" method="post">
                    <div class="form-group">
                        <div class="col-sm-12">
                            Upload Photo / Take Photo:
                            <input type="file" name="headImageCanvas" id="headImageCanvas"/>
                            <input type="hidden" name="headImage" id="headImage"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" name="firstName" placeholder="First name" class="col-sm-12"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" name="lastName" placeholder="Last name" class="col-sm-12"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" name="company" placeholder="Company" class="col-sm-12"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" name="mobile" placeholder="Mobile" class="col-sm-12"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" name="email" placeholder="Email" class="col-sm-12"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" name="vehicleReg" placeholder="Vehicle Registration" class="col-sm-12"/>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <script type="text/javascript">
                    function formVisitorCheckInSubmit() {
                        $("#formVisitorCheckIn").submit();
                    }
                </script>
                <a class="btn btn-success" onclick="formVisitorCheckInSubmit()">Check in</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="staffCheckInModal" tabindex="-1" role="dialog" aria-labelledby="staffCheckInModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="staffCheckInModalLabel">Staff Check in</h4>
            </div>

            <div class="modal-body">
                <div id="listStaffs">
                </div>
                <script type="text/javascript">
                    setTimeout(function() {
                        $.post("${serverUrl}/people/listStaffs")
                                .done(function (data) {
                                    $("#listStaffs").html(data);
                                });
                    }, 318);
                </script>
            </div>
        </div>
    </div>
</div>
<content tag="footScript">
    <script type="text/javascript">
        //or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true});

        $(function() {
            $('#headImageCanvas').picEdit({
                imageUpdated: function(img){
                },
                formSubmitted: function(){
                },
                redirectUrl: "${serverUrl+'?resultMsg=Updated'}",
                defaultImage: false
            });
        });

        setTimeout(function () {
            $("#alertRow").hide()
        }, 3180);
    </script>
</content>
</body>
</html>