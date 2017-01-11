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

public class TeacherSigninServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TeacherSigninServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
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
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			
			String teacherEmail = request.getParameter("teacher_email");
			String teacherPassword = request.getParameter("teacher_password");
			teacherPassword = MDEncrypt.mdEncrypt(teacherPassword);
			
			Teacher teacher = new TeacherDao().queryOne(teacherEmail);
			
			System.out.println("base" + basePath);
			if(teacher != null){
				if(teacher.getTeacherPassword().equals(teacherPassword)){
					HttpSession session = request.getSession();
					session.setAttribute("teacher_info", teacher);
					session.setAttribute("teacher_id", teacher.getTeacherId());
					response.sendRedirect(basePath + "teacher-admin.jsp");
				}else{
					response.sendRedirect(basePath + "teacher-signin.jsp");
				}
			}else{
				response.sendRedirect(basePath + "teacher-signin.jsp");
			}	
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
