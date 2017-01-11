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
  <title>教师登录</title>

  <link href="css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="signin">
<section>
  
    <div class="signinpanel">
        
        <div class="row">
            
            <div class="col-md-7">
                
                <div class="signin-info">
                    <div class="logopanel">
                        <h1><span>[</span> 课程视频管理系统 <span>]</span></h1>
                    </div><!-- logopanel -->
                
                    <div class="mb20"></div>
                
                    <h5><strong>欢迎登陆课程视频管理系统</strong></h5>
                    <ul>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i>新建课程</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i>上传视频</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i>上传附件</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i>课程说明</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i>更多功能...</li>
                    </ul>
                    <div class="mb20"></div>
                    <strong>没有账号<a href="teacher-signup.jsp">注册一个</a></strong>
                </div><!-- signin0-info -->
            
            </div><!-- col-sm-7 -->
            
            <div class="col-md-5">
                
                <form method="post" action="./servlet/TeacherSigninServlet">
                    <h4 class="nomargin">登录</h4>
                    <p class="mt5 mb20">登录你的账户</p>
                
                    <input type="email" class="form-control uname" name="teacher_email"  placeholder="邮箱" required/>
                    <input type="password" class="form-control pword" name="teacher_password" placeholder="密码" required/>
                    <a href=""><small>忘记密码?</small></a>
                    <button class="btn btn-success btn-block">登录</button>
                    
                </form>
            </div><!-- col-sm-5 -->
            
        </div><!-- row -->
        
        <div class="signup-footer">
            课程视频管理系统
        </div>
        
    </div><!-- signin -->
  
</section>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/jquery.cookies.js"></script>

<script src="js/toggles.min.js"></script>
<script src="js/retina.min.js"></script>

<script src="js/select2.min.js"></script>
<script src="js/custom.js"></script>
<script>
    jQuery(document).ready(function(){
        
        // Please do not use the code below
        // This is for demo purposes only
        var c = jQuery.cookie('change-skin');
        if (c && c == 'greyjoy') {
            jQuery('.btn-success').addClass('btn-orange').removeClass('btn-success');
        } else if(c && c == 'dodgerblue') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        } else if (c && c == 'katniss') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        }
    });
</script>

</body>
</html>
