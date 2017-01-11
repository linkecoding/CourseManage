package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Teacher;
import com.util.DBHelper;

public class TeacherDao {
	
	
	public Teacher queryOne(String teacherEmail){
		Connection conn = null;
		Teacher teacher = new Teacher();
		conn = DBHelper.getInstance().connSQL();
		ResultSet rs = DBHelper.getInstance().queryO(conn, "teacher_info", "teacher_email", teacherEmail);
		if(rs == null){
			return null;
		}
		try {
			while(rs.next()){
				teacher.setTeacherId(rs.getString("teacher_id"));
				teacher.setTeacherName(rs.getString("teacher_name"));
				teacher.setTeacherEmail(rs.getString("teacher_email"));
				teacher.setTeacherPassword(rs.getString("teacher_password"));
				teacher.setDepartmentName(rs.getString("department_name"));
			}
			DBHelper.getInstance().releaseConn(conn);
			return teacher;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return teacher;
	}
	
	public boolean insertOne(Teacher teacher){
		Connection conn = null;
		conn = DBHelper.getInstance().connSQL();
		
		String sql = "INSERT INTO teacher(teacher_name, teacher_email, teacher_password, department_id) VALUES(?, ?, ?, ?)";
		PreparedStatement pst;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, teacher.getTeacherName());
			pst.setString(2, teacher.getTeacherEmail());
			pst.setString(3, teacher.getTeacherPassword());
			pst.setInt(4, Integer.parseInt(teacher.getDepartmentId()));
			int res = pst.executeUpdate();
			if(res == 1){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateOne(Teacher teacher){
		Connection conn = null;
		conn = DBHelper.getInstance().connSQL();
		
		String sql = "UPDATE teacher set teacher_name = ?, teacher_email = ?, teacher_password = ?, department_id = ? where teacher_id = ?";
		PreparedStatement pst;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, teacher.getTeacherName());
			pst.setString(2, teacher.getTeacherEmail());
			pst.setString(3, teacher.getTeacherPassword());
			pst.setInt(4, Integer.parseInt(teacher.getDepartmentId()));
			pst.setInt(5, Integer.parseInt(teacher.getTeacherId()));
			int res = pst.executeUpdate();
			if(res == 1){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
