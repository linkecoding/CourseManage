package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TeacherDao;
import com.model.Teacher;
import com.util.MDEncrypt;

public class TeacherInfoModifyServlet extends HttpServlet {

	
	public TeacherInfoModifyServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		Teacher teacher = new Teacher();
		
		teacher.setTeacherId(request.getParameter("teacher_id"));
		teacher.setTeacherName(request.getParameter("teacher_name"));
		String teacherPassword = request.getParameter("teacher_password");
		teacherPassword = MDEncrypt.mdEncrypt(teacherPassword);
		teacher.setTeacherPassword(teacherPassword);
		teacher.setTeacherEmail(request.getParameter("teacher_email"));
		teacher.setDepartmentId(request.getParameter("department_id"));
		
		boolean flag = new TeacherDao().updateOne(teacher);
		if(flag){
			session.setAttribute("teacher_info", null);
			session.setAttribute("teacher_id", null);
			response.sendRedirect(basePath + "teacher-signin.jsp");
		}else{
			response.sendRedirect(basePath + "teacher-admin.jsp");
		}
	}

	public void init() throws ServletException {
		
	}

}
