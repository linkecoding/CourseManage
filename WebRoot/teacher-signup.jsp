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
  
  <title>教师注册</title>

  <link href="css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="signin">
<section>
  
    <div class="signuppanel">
        
        <div class="row">
            
            <div class="col-md-6">
                
                <div class="signup-info">
                    <div class="logopanel">
                        <h1><span>[</span> 课程视频管理系统 <span>]</span></h1>
                    </div><!-- logopanel -->
                
                    <div class="mb20"></div>
                    <p>该系统可以帮助教师方便地将课程视频进行管理，借助于该系统，你可以方便地分享你的课程资源</p>
                    <div class="mb20"></div>
                    
                    <div class="feat-list">
                        <i class="fa fa-wrench"></i>
                        <h4 class="text-success">新建课程</h4>
                        <p>该系统帮你方便地新建你开设的多门课程</p>
                    </div>
                    
                    <div class="feat-list">
                        <i class="fa fa-compress"></i>
                        <h4 class="text-success">上传视频</h4>
                        <p>你可以随时将录制的课程视频上传，丰富你的课程内容</p>
                    </div>
                    
                    <div class="feat-list mb20">
                        <i class="fa fa-search-plus"></i>
                        <h4 class="text-success">上传附件</h4>
                        <p>你可以将每门课需要的资料进行上传，供学生下载参考</p>
                    </div>
                    
                    <h4 class="mb20">还有更多功能...</h4>
                
                </div><!-- signup-info -->
            
            </div><!-- col-sm-6 -->
            
            <div class="col-md-6">
                
                <form method="post" action="./servlet/TeacherSignupServlet">
                    
                    <h3 class="nomargin">注册</h3>
                    <p class="mt5 mb20">已经有一个账户了? <a href="teacher-signin.jsp"><strong>登录</strong></a></p>
                    <div class="mb10">
                        <label class="control-label">用户名</label>
                        <input type="text" class="form-control" placeholder="请输入用户名" name="teacher_name" required/>
                    </div>
                    
                    <div class="mb10">
                        <label class="control-label">密码</label>
                        <input type="password" class="form-control" placeholder="请输入密码" name="teacher_password" required/>
                    </div>
                    
                    <div class="mb10">
                        <label class="control-label">确认密码</label>
                        <input type="password" class="form-control" placeholder="请输入确认密码" name="confirm_password" required/>
                    </div>
                    
                    <div class="mb10">
                        <label class="control-label">邮箱</label>
                        <input type="email" class="form-control" placeholder="请输入邮箱" name = "teacher_email" required/>
                    </div>

                    <div class="mb10">
                        <label class="control-label">所属院系</label>
                        <select class="select2" data-placeholder="请选择院系" name="department_id" required>
                            <option value=""></option>
                            <option value="1">物联网工程学院</option>
                            <option value="2">机电工程学院</option>
                            <option value="3">企业管理学院</option>
                        </select>
                    </div>
                    
                    <br />
                    <button class="btn btn-success btn-block">注册</button>     
                </form>
            </div><!-- col-sm-6 -->
            
        </div><!-- row -->
        
        <div class="signup-footer">
            课程视频管理系统
        </div>
        
    </div><!-- signuppanel -->
  
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
    $(document).ready(function(){
        
        $(".select2").select2({
            width: '100%',
            minimumResultsForSearch: -1
        });
        
        $(".select2-2").select2({
            width: '100%'
        });
        
        
        // Please do not use the code below
        // This is for demo purposes only
        var c = $.cookie('change-skin');
        if (c && c == 'greyjoy') {
            $('.btn-success').addClass('btn-orange').removeClass('btn-success');
        } else if(c && c == 'dodgerblue') {
            $('.btn-success').addClass('btn-primary').removeClass('btn-success');
        } else if (c && c == 'katniss') {
            $('.btn-success').addClass('btn-primary').removeClass('btn-success');
        }
        
    });
</script>

</body>
</html>
