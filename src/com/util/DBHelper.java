package com.util;

import java.sql.*;

import com.config.SQLConfig;
public class DBHelper{
	private static DBHelper dbHelper = null;
	private Connection conn;
	private DBHelper(){}
	public static DBHelper getInstance(){
		if(dbHelper == null){
			synchronized (DBHelper.class) {
				if(dbHelper == null){
					dbHelper = new DBHelper();
				}
			}
		}
		return dbHelper;
	}
	/**
	 * 连接数据库函数
	 * @return
	 */
	public Connection connSQL(){
		   String url = SQLConfig.url;  
	       String user = SQLConfig.username;  
	       String password = SQLConfig.password;  
	       String Driver = SQLConfig.driverName;  
	       conn = null;  
	       try {  
	           Class.forName(Driver);  
	           conn = DriverManager.getConnection(url, user,password);
	           if(conn != null){
	        	   System.out.println("OK");
	           }
	       } catch (Exception e) {  
	           System.out.println("连接数据库出现异常" + e.getMessage());  
	       }  
	       return conn;  
	}
	
	/**
	 * 查询指定表中所有数据
	 * @param conn
	 * @param tableName
	 * @return
	 */
	public  ResultSet queryAll(Connection conn, String tableName){
		ResultSet rs = null;
		if(conn != null){
    		String sql = "select * from " +  tableName;
    		PreparedStatement prStatement;
			try {
				prStatement = conn.prepareStatement(sql);
				rs = prStatement.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
    	}
		return rs;
	}
	
	/**
	 * 查询单条记录
	 * @param conn
	 * @param tableName
	 * @param key
	 * @param value
	 * @return
	 */
	public  ResultSet queryO(Connection conn, String tableName, String key, String value){
		ResultSet rs = null;
		if(conn != null){
    		String sql = "select * from " +  tableName + " where " + key + "='" + value + "'";
    		System.out.println("sql" + sql);
    		PreparedStatement prStatement;
			try {
				prStatement = conn.prepareStatement(sql);
				rs = prStatement.executeQuery();
				return rs;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
    	}
		return rs;
	}
	
	/**
	 * 往指定表中插入一行数据
	 * @param conn
	 * @param tableName
	 * @param key
	 * @param value
	 */
	public  void insertOne(Connection conn, String tableName, String key, String value){
		ResultSet rs = null;
		if(conn != null){
    		String sql = "select * from " +  tableName + " where " + key + "='" + value + "'";
    		PreparedStatement prStatement;
			try {
				prStatement = conn.prepareStatement(sql);
				rs = prStatement.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				releaseConn(conn);
			}	
    	}
	}
	
	/**
	 * 删除一行数据
	 * @param conn
	 * @param tableName
	 * @param key
	 * @param value
	 * @return
	 */
	public boolean deleteOne(Connection conn, String tableName, String key, String value){
		int res = 0;
		if(conn != null){
			String sql = "delete from " +  tableName + " where " + key + "=" + value;
			System.out.println("sql " +sql);
			try {
				PreparedStatement prStatement = conn.prepareStatement(sql);
				res = prStatement.executeUpdate();
				if(res == 1){
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				releaseConn(conn);
			}
		}
		return false;
	}
	
	/**
	 * 释放数据库连接
	 * @param conn
	 */
	public void releaseConn(Connection conn){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
