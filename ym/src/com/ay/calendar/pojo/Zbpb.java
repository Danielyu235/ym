package com.ay.calendar.pojo;
import generate.tool.PropertiesTool;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class Zbpb {
	private Connection con =null;
	private PreparedStatement state= null;
	private ResultSet result = null;
	
	public Zbpb(){
		con=getConntion();
	}
	
	public String getString(String str){
		if(str==null||"".equals(str)){
			return "";
		}
		return str;
	}
	public Connection getConntion() {
		con = null;
		try {
			 PropertiesTool pt = PropertiesTool.newInstance("init.properties");
			 Class.forName(pt.readValue("datasource.driverClassName"));  
			String uri=pt.readValue("datasource.url");  
			  con =DriverManager.getConnection(uri,pt.readValue("datasource.username"),pt.readValue("datasource.password")); 
			  /*Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
			  String uri="jdbc:sqlserver://10.0.0.50:1435;DatabaseName=ayjava_ym";  
			  con =DriverManager.getConnection(uri,"sa","sasa");*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public synchronized String[] getResult(String group, String year,String month,String day) {
		String []users=new String[]{"","","",""};
		if(month.length()==1)
			month="0"+month;
		if(day.length()==1)
			day="0"+day;
		String date=year+"-"+month+"-"+day;
				
		String sql="select TB_COAL_OUTPUT.DAILY_PLAN AS dailyPlan,TB_COAL_OUTPUT.DAILY_OUTPUT AS dailyOutput," +
		"SUBSTRING(TB_COAL_OUTPUT.MONTH_PLAN, 6, 5) as monthPlan " +
		"from TB_COAL_OUTPUT where TB_COAL_OUTPUT.UNIT_GROUP ='"+group+"' " +
		"and SUBSTRING(TB_COAL_OUTPUT.MONTH_PLAN, 1, 10) = '"+date+"'" ;
		try {
			state = con.prepareStatement(sql);
			result=state.executeQuery();	
			int num=0;
			while (result.next()) {
				users[num]=getString(result.getString("dailyPlan"));
				num++;
				users[num]=getString(result.getString("dailyOutput"));
				num++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (result != null)
					result.close();
				if (state != null)
					state.close();
			} catch (SQLException e) {
				e.printStackTrace();
				return new String[]{"",""};
			}
		}
		return users;
	}
	/**
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @return
	 */
	public synchronized List<String[]> getCoalOutPut(String year,String month,String group) {
		String []users= null;
		List<String[]> list = new ArrayList<String[]>();
		if(month.length()==1)
			month="0"+month;
		String date=year+"-"+month;
		String sql="SELECT TB_COAL_OUTPUT.UNIT_GROUP AS unitGroup," +
				"dbo.FN_codeToText(TB_COAL_OUTPUT.UNIT_GROUP) AS unitGroupText," +
				"SUBSTRING(TB_COAL_OUTPUT.MONTH_PLAN, 1, 7) as monthPlan," +
				"sum(cast(TB_COAL_OUTPUT.DAILY_PLAN AS int)) AS dailyPlan," +
				"sum(cast(TB_COAL_OUTPUT.DAILY_OUTPUT AS int)) AS dailyOutput" +
				" FROM TB_COAL_OUTPUT WHERE TB_COAL_OUTPUT.STATUS = '1' " +
				"and MONTH_PLAN like '%"+date+"%' and dbo.FN_codeToText(TB_COAL_OUTPUT.UNIT_GROUP) = '"+group+"'" +
				" group by TB_COAL_OUTPUT.UNIT_GROUP," +
				"SUBSTRING(TB_COAL_OUTPUT.MONTH_PLAN, 1, 7) order by dbo.FN_codeToText(TB_COAL_OUTPUT.UNIT_GROUP)" +
				" collate Chinese_PRC_Stroke_CS_AS_KS_WS,SUBSTRING(TB_COAL_OUTPUT.MONTH_PLAN, 1,7)" ;
		try {
			state = con.prepareStatement(sql);
			result=state.executeQuery();	
			int num=0;
			while (result.next()) {
				users=new String[]{"","","","",""};
				users[num]=getString(result.getString("unitGroup"));
				num++;
				users[num]=getString(result.getString("unitGroupText"));
				num++;
				users[num]=getString(result.getString("monthPlan"));
				num++;
				users[num]=getString(result.getString("dailyPlan"));
				num++;
				users[num]=getString(result.getString("dailyOutput"));
				num = 0;
				list.add(users);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (result != null)
					result.close();
				if (state != null)
					state.close();
			} catch (SQLException e) {
				e.printStackTrace();
				return new ArrayList<String[]>();
			}
		}
		return list;
	}
	/**
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @return
	 */
	public synchronized List<String[]> getGroup() {
		String []users= null;
		List<String[]> list = new ArrayList<String[]>();
		String sql="select data_name from dev_data where type_id ='dwdz' order by data_name collate Chinese_PRC_Stroke_CS_AS_KS_WS" ;
		try {
			state = con.prepareStatement(sql);
			result=state.executeQuery();	
			int num=0;
			while (result.next()) {
				users=new String[]{""};
				users[num]=getString(result.getString("data_name"));
				list.add(users);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (result != null)
					result.close();
				if (state != null)
					state.close();
			} catch (SQLException e) {
				e.printStackTrace();
				return new ArrayList<String[]>();
			}
		}
		return list;
	}
	public void close(){
			try {
				if (result != null)
					result.close();
				if (state != null)
					state.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}

