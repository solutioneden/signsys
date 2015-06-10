<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>RNW SIGNAPP</title>

    <meta name="description" content="RNW SIGNAPP"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <asset:stylesheet src="jquery-ui.custom.css" />
    <asset:stylesheet src="chosen.css" />
    <asset:stylesheet src="datepicker.css" />
    <asset:stylesheet src="bootstrap-timepicker.css" />
    <asset:stylesheet src="bootstrap-datetimepicker.css" />
    <asset:stylesheet src="colorpicker.css" />
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="font-awesome.css"/>
    <asset:stylesheet src="dropzone.css"/>
    <asset:stylesheet src="jquery.gritter.css"/>
    <asset:stylesheet src="select2.css"/>
    <asset:stylesheet src="picedit.css"/>
    <asset:stylesheet src="bootstrap-editable.css"/>
    <asset:stylesheet src="daterangepicker.css"/>
    %{--<asset:stylesheet href="uploadr.manifest.css"/>--}%

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <asset:stylesheet src="ace-fonts.css"/>

    <!-- ace styles -->
    <asset:stylesheet src="ace.css"/>

    <!--[if lte IE 9]>
    <asset:stylesheet src="ace-part2.css"/>
    <![endif]-->

    <!--[if lte IE 9]>
    <asset:stylesheet src="ace-ie.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->
    <!-- ace settings handler -->
    <!--[if !IE]> -->
    <asset:javascript src="jquery.js"/>
    <!-- <![endif]-->

    <!--[if IE]>
    <asset:javascript src="jquery1x.js"/>
    <![endif]-->

    <asset:javascript src="jquery.mobile.custom.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="jquery.ui.touch-punch.js"/>
    <asset:javascript src="jquery.gritter.js"/>
    <asset:javascript src="bootbox.js"/>
    <asset:javascript src="jquery.easypiechart.js"/>
    <asset:javascript src="bootstrap-datepicker.js"/>
    <asset:javascript src="jquery.hotkeys.js"/>
    <asset:javascript src="bootstrap-wysiwyg.js"/>
    <asset:javascript src="bootstrap-datapicker.js"/>
    <asset:javascript src="select2.js"/>
    <asset:javascript src="jquery.maskedinput.js"/>
    <asset:javascript src="jquery.dataTables.js"/>
    <asset:javascript src="jquery.dataTables.bootstrap.js"/>
    <asset:javascript src="daterangepicker.js"/>
    <!-- page specific plugin scripts -->
    <asset:javascript src="ace-extra.js"/>
    %{--<asset:javascript src="uploadr.manifest.js"/>--}%

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
    <asset:javascript src="html5shiv.js"/>
    <asset:javascript src="respond.js"/>
    <![endif]-->

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon" />
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}" />
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}" />
    <g:layoutHead/>
</head>

<body>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <g:layoutBody/>
            <g:pageProperty name="page.mainContent"></g:pageProperty>
        </div>
    </div><!-- /.main-content -->

    <div class="footer">
        <div class="footer-inner">
            <!-- #section:basics/footer -->
            <div class="footer-content">
                <span class="bigger-120">
                    <span class="blue bolder">RNW Holdings</span>
                &copy; 2015
                </span>
            </div>

            <!-- /section:basics/footer -->
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div>

<!-- ace scripts -->
<asset:javascript src="elements.scroller.js"/>
<asset:javascript src="elements.colorpicker.js"/>
<asset:javascript src="elements.fileinput.js"/>
<asset:javascript src="elements.typeahead.js"/>
<asset:javascript src="elements.wysiwyg.js"/>
<asset:javascript src="elements.spinner.js"/>
<asset:javascript src="elements.treeview.js"/>
<asset:javascript src="elements.wizard.js"/>
<asset:javascript src="elements.aside.js"/>
<asset:javascript src="ace.js"/>
<asset:javascript src="ace.ajax-content.js"/>
<asset:javascript src="ace.touch-drag.js"/>
<asset:javascript src="ace.sidebar.js"/>
<asset:javascript src="ace.sidebar-scroll-1.js"/>
<asset:javascript src="ace.submenu-hover.js"/>
<asset:javascript src="ace.widget-box.js"/>
<asset:javascript src="ace.settings.js"/>
<asset:javascript src="ace.settings-rtl.js"/>
<asset:javascript src="ace.settings-skin.js"/>
<asset:javascript src="ace.widget-on-reload.js"/>
<asset:javascript src="ace.searchbox-autocomplete.js"/>
<asset:javascript src="ace-elements.js"/>
<asset:javascript src="dropzone.js"/>
<asset:javascript src="x-editable/bootstrap-editable.js"/>
<asset:javascript src="x-editable/ace-editable.js"/>
<asset:javascript src="picedit.js"/>
<!-- inline scripts related to this page -->

<g:pageProperty name="page.footScript" />
</body>
</html>
