package com.ay.jdbcBase.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.log4j.Logger;
/**
 * 数据库操作类
 * @author zx
 *
 */
public class JdbcSqlCrud {
	static Logger logger = Logger.getLogger(Log.class.getName());
	private Connection con =null;
	private PreparedStatement pstm= null;
	private ResultSet result = null;
	private static String driver = "";
	private static String url = "";
	private static String username = "";
	private static String password = "";
	
	/**
	 * 无参数构造函数
	 */
	public JdbcSqlCrud(){
	}
	/**
	 * 构造函数 创建这个实体类类时触发
	 * @param driver 连接驱动  com.microsoft.sqlserver.jdbc.SQLServerDriver
	 * @param url 数据地址 jdbc:sqlserver://10.0.0.50:1435;DatabaseName=ayjava_ym
	 * @param username 用户名
	 * @param password 密码
	 */
	public JdbcSqlCrud(String driver,String url,String username, String password){
		this.driver = driver;
		this.url = url;
		this.username = username;
		this.password = password;
		con=getConntion();
	}
	/**
	 * 获取数据连接
	 * @return
	 */
	public Connection getConntion() {
		try {
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url, username, password);
		} catch (InstantiationException e) {
			logger.info("数据库连接失败: " + e.getMessage());
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			logger.info("数据库连接失败: " + e.getMessage());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			logger.info("数据库连接失败 : " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			logger.info("数据库连接失败 : " + e.getMessage());
			e.printStackTrace();
		}
		logger.info("数据库连接成功 " );
		return con;
	}
	/**
	 * 判断数据是否为空
	 * @param str
	 * @return
	 */
	public String getString(String str){
		if(str==null||"".equals(str)){
			return "";
		}
		return str;
	}
	/**
	 * 
	 * @param sql 查询语句
	 * @param obj 查询条件
	 * @return
	 */
	public ResultSet excuteQuery(String sql, Object[] obj) {
		try {
			pstm = con.prepareStatement(sql);
			int len = obj.length;
			for (int i = 0; i < len; i++) {
				pstm.setObject((i + 1), obj[i]);
			}
			result = pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.info("查询数据异常；" +  sql); 
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 
	 * @param sql 操作的sql语句
	 * @param obj 查询条件
	 * @return
	 */
	public int excuteUpdate(String sql, Object[] obj) {
		int result = 0;
		try {
			pstm = con.prepareStatement(sql);
			int len = obj.length;
			for (int i = 0; i < len; i++) {
				pstm.setObject((i + 1), obj[i]);
			}
			result = pstm.executeUpdate();
			//connect.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.info("操作数据库异常；" +  sql);
			e.printStackTrace();
		}
		return result;

	}
	/**
	 * 关闭数据连接操作
	 */
	public void closedAll() {
		try {
			if (result != null) {
				result.close();
			}
			if (pstm != null) {
				pstm.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.info("数据库资源关闭异常；");
			e.printStackTrace();
		}
	}
	/**
	 * 测试数据
	 * @param args
	 */
	public static void main(String[] args) {
		JdbcSqlCrud jdbc = new JdbcSqlCrud("com.microsoft.sqlserver.jdbc.SQLServerDriver", 
				"jdbc:sqlserver://10.0.0.181:1433;DatabaseName=ayjava_ym", "sa", "sasa");
		ResultSet result = jdbc.excuteQuery("select NAME,JOB_NUM from TB_EMPLOYEES where JOB_NUM =?", new Object[]{"060595"});
		try {
			while (result.next()) {
				System.out.println(result.getString("NAME")+"_______"+result.getString("JOB_NUM"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
