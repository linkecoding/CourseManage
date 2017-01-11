package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Course;
import com.model.Teacher;
import com.util.DBHelper;

public class DeleteCourseServlet extends HttpServlet {

	public DeleteCourseServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		
		String id = request.getParameter("id");
		boolean flag = DBHelper.getInstance().deleteOne(DBHelper.getInstance().connSQL(), "course", "course_id", id);
		if(flag){
			response.sendRedirect(basePath + "course-delete.jsp");
		}else{
			response.sendRedirect(basePath + "course-delete.jsp");
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
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
