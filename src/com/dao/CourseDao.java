package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Course;
import com.util.DBHelper;

public class CourseDao {
	public List<Course> queryOne(String teacherId){
		List<Course> courseList = new ArrayList<Course>();
		Connection conn = null;
		//获得数据库连接
		conn = DBHelper.getInstance().connSQL();
		//从课程视图中查到教师Id对应的课程信息
		ResultSet rs = DBHelper.getInstance().queryO(conn, "course_info", "teacher_id", teacherId);
		if(rs == null){
			return null;
		}
		try {
			while(rs.next()){
				Course course = new Course();
				System.out.println(rs.getString("course_name"));
				course.setTeacherId(rs.getString("teacher_id"));
				course.setCourseId(String.valueOf(rs.getInt("course_id")));
				course.setCourseName(rs.getString("course_name"));
				course.setCourseStartTime(rs.getString("course_start_time"));
				course.setCourseIntroduction((rs.getString("course_introduction")));
				course.setCourseLabel(rs.getString("course_label"));
				course.setCourseImgPath(rs.getString("course_img_path"));
				course.setCourseCategory(rs.getString("cc_name"));
				course.setCourseReferences(rs.getString("rm_content"));
				courseList.add(course);
			}
			DBHelper.getInstance().releaseConn(conn);
			return courseList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courseList;
	}
	
	/**
	 * 添加课程函数，将课程信息添加到数据库
	 * @param course
	 * @return
	 */
	public boolean addCourse(Course course){
		Connection conn = null;
		conn = DBHelper.getInstance().connSQL();
		//构建要插入的SQL语句
		String sql1 = "INSERT INTO reference_material(rm_content) values ('" + course.getCourseReferences() + "')";
		String sql2 = "INSERT INTO course(course_name, course_introduction, course_label, course_start_time, course_img_path, rm_id, cc_id, teacher_id) " +
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pst1;
		PreparedStatement pst2;
		String rmId = null;
		try {
			pst1 = conn.prepareStatement(sql1,Statement.RETURN_GENERATED_KEYS);
			pst1.executeUpdate();
			ResultSet rs = pst1.getGeneratedKeys();
			if(rs.next()){
				rmId = rs.getString(1);
			}
			
			pst2 = conn.prepareStatement(sql2);
			pst2.setString(1, course.getCourseName());
			pst2.setString(2, course.getCourseIntroduction());
			pst2.setString(3, course.getCourseLabel());
			pst2.setString(4, course.getCourseStartTime());
			pst2.setString(5, "http://127.0.0.1:8080/CourseManage/course/image/1.png");
			pst2.setInt(6, Integer.parseInt(rmId));
			pst2.setInt(7, Integer.parseInt(course.getCourseCategory()));
			pst2.setInt(8, Integer.parseInt(course.getTeacherId()));
			int res2 = pst2.executeUpdate();
			if(res2 == 1){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
