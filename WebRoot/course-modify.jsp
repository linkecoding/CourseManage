<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.model.Course" %>
<%@ page import="com.dao.CourseDao" %>
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
        <title>后台管理</title>

        <link href="css/style.default.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
    
    <%
    String teacherId = (String)request.getSession().getAttribute("teacher_id");
    List<Course> courseList = new CourseDao().queryOne(teacherId);
    System.out.print("size" + courseList.size());
    %>
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
                            <li><a href="video-show.jsp"><i class="fa fa-sign-out"></i> <span>退出登录</span></a></li>
                        </ul>
                    </div>
                    <ul class="nav nav-pills nav-stacked nav-bracket">
                        <li class="nav-parent"><a href=""><i class="fa fa-edit"></i> <span>个人中心</span></a>
                            <ul class="children">
                                <li><a href="teacher-info.jsp"><i class="fa fa-caret-right"></i>个人信息</a></li>
                                <li><a href="modify-info.jsp"><i class="fa fa-caret-right"></i>修改信息</a></li>
                            </ul>
                        </li>
                        <li class="nav-parent  nav-hover nav-active"><a href=""><i class="fa fa-suitcase"></i> <span>课程管理</span></a>
                            <ul class="children" style="display: block;">
                                <li><a href="course-list.jsp"><i class="fa fa-caret-right"></i> 查看课程</a></li>
                                <li><a href="course-add.jsp"><i class="fa fa-caret-right"></i> 添加课程</a></li>
                                <li><a href="course-modify.jsp"><i class="fa fa-caret-right"></i> 修改课程</a></li>
                                <li class="active"><a href="course-delete.jsp"><i class="fa fa-caret-right"></i> 删除课程</a></li>
                            </ul>
                        </li>
                        </ul>
                    </div><!-- infosummary -->
                </div><!-- leftpanelinner -->
            </div><!-- leftpanel -->

            <div class="mainpanel">

                <div class="headerbar">

                    <a class="menutoggle"><i class="fa fa-bars"></i></a>

                    <form class="searchform" action="#" method="post">
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
                                        <li><a href="video-show.jsp"><i class="glyphicon glyphicon-log-out"></i>退出登录</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div><!-- header-right -->

                </div><!-- headerbar -->

            <div style="margin: 10px;">
            <div class="table-responsive">
                <table class="table table-success mb30">
                    <thead>
                      <tr>
                        <th>序号</th>
                        <th>课程名</th>
                        <th>开课时间</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%for(int i = 0; i < courseList.size(); i++){ %>
                      <tr>
                        <td><%=i+1 %></td>
                        <td><%=courseList.get(i).courseName%></td>
                        <td><%=courseList.get(i).courseStartTime%></td>
                        <td><a href="./servlet/DeleteCourseServlet?id=<%=courseList.get(i).courseId %>">修改</a></td>
                      </tr>
                      <%} %>
                    </tbody>
                </table>
            </div><!-- table-responsive -->
        </div>
            </div><!-- mainpanel -->

        </section>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/modernizr.min.js"></script>
        <script src="js/jquery.sparkline.min.js"></script>
        <script src="js/toggles.min.js"></script>
        <script src="js/retina.min.js"></script>
        <script src="js/jquery.cookies.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
