<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>添加课程</title>

        <link rel="stylesheet" href="css/jquery.tagsinput.css" />
        <link href="css/style.default.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>
        <section>
            <div class="leftpanel">
                <div class="logopanel">
                    <h3>后台管理</h3>
                </div><!-- logopanel -->

                <div class="leftpanelinner">

                    <!-- This is only visible to small devices -->
                    <div class="visible-xs hidden-sm hidden-md hidden-lg">   
                        <div class="media userlogged">
                            <img alt="" src="images/loggeduser.png" class="media-object">
                            <div class="media-body">
                                <h4>${sessionScope.teacher_info.getTeacherName()}</h4>
                                <span>${sessionScope.teacher_info.getDepartmentName()}</span>
                            </div>
                        </div>

                        <h5 class="sidebartitle actitle">账号</h5>
                        <ul class="nav nav-pills nav-stacked nav-bracket mb30">
                            <li><a href=""><i class="fa fa-cog"></i> <span>账号设置</span></a></li>
                            <li><a href=""><i class="fa fa-question-circle"></i> <span>帮助</span></a></li>
                            <li><a href="video-show.html"><i class="fa fa-sign-out"></i> <span>退出登录</span></a></li>
                        </ul>
                    </div>
                    <ul class="nav nav-pills nav-stacked nav-bracket">
                        <li class="nav-parent"><a href=""><i class="fa fa-edit"></i> <span>个人中心</span></a>
                            <ul class="children">
                                <li><a href="teacher-info.jsp"><i class="fa fa-caret-right"></i>个人信息</a></li>
                                <li><a href="modify-info.jsp"><i class="fa fa-caret-right"></i>修改信息</a></li>
                            </ul>
                        </li>
                        <li class="nav-parent nav-hover"><a href=""><i class="fa fa-suitcase"></i> <span>课程管理</span></a>
                            <ul class="children" style="display: block;">
                                <li><a href="course-list.jsp"><i class="fa fa-caret-right"></i> 查看课程</a></li>
                                <li class="active"><a href="course-add.jsp"><i class="fa fa-caret-right"></i> 添加课程</a></li>
                                <li><a href="course-modify.jsp"><i class="fa fa-caret-right"></i> 修改课程</a></li>
                                <li><a href="course-delete.jsp"><i class="fa fa-caret-right"></i> 删除课程</a></li>
                            </ul>
                        </li>
                        </ul>
                    </div><!-- infosummary -->
                </div><!-- leftpanelinner -->
            </div><!-- leftpanel -->

            <div class="mainpanel">

                <div class="headerbar">

                    <a class="menutoggle"><i class="fa fa-bars"></i></a>

                    <form class="searchform" method="post">
                        <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
                    </form>

                    <div class="header-right">
                        <ul class="headermenu">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <img src="images/loggeduser.png" alt="" />
                                        ${sessionScope.teacher_info.getTeacherName()}
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                        <li><a href="#"><i class="glyphicon glyphicon-cog"></i>账号设置</a></li>
                                        <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i>帮助</a></li>
                                        <li><a href="video-show.html"><i class="glyphicon glyphicon-log-out"></i>退出登录</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div><!-- header-right -->
                </div><!-- headerbar -->

        <div style="margin: 10px;">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">添加课程</h4>
              <p>按照下面的步骤即可创建并发布一门课程</p>
            </div>
            <div class="panel-body panel-body-nopadding">
              
              <!-- BASIC WIZARD -->
              <div id="progressWizard" class="basic-wizard">
                
                <ul class="nav nav-pills nav-justified">
                  <li><a href="#ptab1" data-toggle="tab"><span>第一步:</span> 添加课程信息</a></li>
                  <li class=""><a href="#ptab2" data-toggle="tab"><span>第二步:</span> 添加课程章</a></li>
                  <li class=""><a href="#ptab3" data-toggle="tab"><span>第三步:</span> 添加课程节及附件</a></li>
                </ul>
                  
                <div class="tab-content">
                  
                  <div class="progress progress-striped">
                    <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                  </div>
                  
                  <div class="tab-pane active" id="ptab1">
                    <form class="form" id="firstForm" method="post">
                      <div class="form-group" style="display:none;">
                        <label class="col-sm-4">index<span class="asterisk">*</span></label>
                        <div class="col-sm-8">
                          <input type="text" name="form_index" class="form-control" value="1">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4">课程名称<span class="asterisk">*</span></label>
                        <div class="col-sm-8">
                          <input type="text" name="course_name" class="form-control" required="required">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-4">课程简介<span class="asterisk">*</span></label>
                        <div class="col-sm-8">
                          <input type="text" name="course_introduction" class="form-control" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4 control-label">课程标签<span class="asterisk">*</span></label>
                        <div class="col-sm-8">
                          <input name="course_label" id="tags" class="form-control" value="foo,bar,baz" />
                        </div>
                      </div>
                      <div class="form-group">
                          <label class="col-sm-4 control-label">课程类别<span class="asterisk">*</span></label>
                          <div class="col-sm-8">
                            <select class="select2" data-placeholder="请选择课程类别" required name="course_category">
                                    <option></option>
                                    <option value="1">人文社科</option>
                                    <option value="2">英语</option>
                            </select>
                          </div>
                        </div>
                      <div class="form-group">
                        <label class="col-sm-4">参考资料<span class="asterisk">*</span></label>
                        <div class="col-sm-8">
                          <textarea style="height: 250px;width: 100%;" name="course_reference"></textarea>
                        </div>
                      </div>
					  <div class="form-group">
                        <label class="col-sm-4">课程封面<span class="asterisk">*</span></label>
                        <div class="col-sm-7">
                          <input type="file" name="course_img_path" class="form-control">
                          <input type="hidden" name="path" class="form-control" id="img_path">
                        </div>
                        <input type="button" onclick="uploadImg()" class="col-sm-1" class="form-control" value="上传">
                      </div>
                      <div class="panel-footer">
                        <div class="row">
                          <div class="col-sm-8 col-sm-offset-5">
                            <button class="btn btn-primary" id="sub1" onclick="uploadForm1()">保存</button>
                            <button type="reset" class="btn btn-default">重置</button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                  <div class="tab-pane" id="ptab2">
                    <form class="form">
                      <div class="form-group">
                      <label class="col-sm-4">章序号</label>
                      <div class="col-sm-8">
                        <select class="select2" data-placeholder="请选择章序号" required>
                            <option value=""></option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4">章名称</label>
                        <div class="col-sm-8">
                          <input type="text" name="product_name" class="form-control">
                        </div>
                      </div>

                    <div class="panel-footer">
                        <div class="row">
                          <div class="col-sm-8 col-sm-offset-5">
                            <button class="btn btn-primary" id="sub2">保存</button>
                            <button type="reset" class="btn btn-default">重置</button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                  <div class="tab-pane" id="ptab3">
                    <form class="form">
                      <div class="form-group">
                      <label class="col-sm-4">节序号</label>
                      <div class="col-sm-8">
                        <select class="select2" data-placeholder="请选择章序号" required>
                            <option value=""></option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-4">节名称</label>
                        <div class="col-sm-8">
                          <input type="text" name="product_name" class="form-control">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-4">课程视频<span class="asterisk">*</span></label>
                        <div class="col-sm-8">
                          <input type="file" name="course_video" class="form-control">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4">课程附件<span class="asterisk">*</span></label>
                        <div class="col-sm-8">
                          <input type="file" name="course_attachment" class="form-control">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4">附件名称</label>
                        <div class="col-sm-8">
                          <input type="text" name="product_name" class="form-control">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4">附件备注</label>
                        <div class="col-sm-8">
                          <input type="text" name="product_name" class="form-control">
                        </div>
                      </div>
                      <div class="panel-footer">
                        <div class="row">
                          <div class="col-sm-8 col-sm-offset-5">
                            <button class="btn btn-primary" id="sub3">保存</button>
                            <button type="reset" class="btn btn-default">重置</button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                  
                  
                </div><!-- tab-content -->
                
                <ul class="pager wizard">
                    <li class="previous disabled"><a href="javascript:void(0)">Previous</a></li>
                    <li class="next"><a href="javascript:void(0)">Next</a></li>
                  </ul>
                
              </div><!-- #basicWizard -->
              
            </div><!-- panel-body -->
          </div><!-- panel -->
        </div>
        </div><!-- mainpanel -->
        </section>


        <script src="js/jquery-2.0.0.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/jquery-ui-1.10.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/modernizr.min.js"></script>
        <script src="js/jquery.sparkline.min.js"></script>
        <script src="js/toggles.min.js"></script>
        <script src="js/jquery.cookies.js"></script>
        <script src="js/jquery.tagsinput.min.js"></script>
        <script src="js/select2.min.js"></script>
        <script src="js/bootstrap-wizard.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/jquery-form.js"></script>
        <script src="js/custom.js"></script>

<script>
jQuery(document).ready(function(){
    
    "use strict";
    // Progress Wizard
  $('#progressWizard').bootstrapWizard({
    'nextSelector': '.next',
    'previousSelector': '.previous',
    onNext: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      jQuery('#progressWizard').find('.progress-bar').css('width', $percent+'%');
    },
    onPrevious: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      jQuery('#progressWizard').find('.progress-bar').css('width', $percent+'%');
    },
    onTabShow: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      jQuery('#progressWizard').find('.progress-bar').css('width', $percent+'%');
    }
  });

  // Tags Input
  jQuery('#tags').tagsInput({width:'auto',defaultText:'添加标签'});
  jQuery(".select2").select2({
            width: '100%',
            minimumResultsForSearch: -1
        });
        
        jQuery(".select2-2").select2({
            width: '100%'
        });
});
function uploadImg(){
	alert("aaa");
	var options = {
    url:'./servlet/AddCourseServlet',
    type:'post',
    
    success: function() {
      alert('Thanks for your comment!');
    } };
	
	$('#imgForm').submit(function() {
	     $(this).ajaxSubmit(options);
	     
	     return false;
     });
}


function uploadForm1(){
	var options = {
    url:'./servlet/AddCourseServlet',
    type:'post',
    
    success: function() {
      //alert('Thanks for your comment!');
    } };
	
	$('#firstForm').submit(function() {
	     $(this).ajaxSubmit(options);
	     $("#sub1").attr("disabled", "disabled");
	     return false;
     });
}
</script>
</body>
</html>