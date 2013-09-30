package com.ay.reputation.pojo;

import com.ay.framework.core.pojo.BasePojo;

/**
 *	@描述：职工信誉评价POJO
 *	@包名：com.ay.reputation.pojo
 *	@类名：Reputation.java
 *	@日期：2013-6-27
 *	@版权：Copyright ®安元科技. All right reserved. 
 *	@作者：闵琨
 */
public class Reputation extends BasePojo {

	private static final long serialVersionUID = 1L;

	/** 员工ID */
	private String employeeId;
	
	/** 员工姓名 */
	private String ename;
	
	/** 员工岗位 */
	private String post;
	
	/** 考核时间  */
	private String date;
	
	/** 员工信誉成绩 */
	private String achievement;
	
	private String bmpd;
	
	private String jobnum;
	
	/**部门*/
	private String departmentf;
	
	/**职位*/
	private String departments;
	
	private String idNumber;	
	
	private String eid;
	
	private String major;
		
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}


	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getDepartmentf() {
		return departmentf;
	}

	public void setDepartmentf(String departmentf) {
		this.departmentf = departmentf;
	}

	public String getDepartments() {
		return departments;
	}

	public void setDepartments(String departments) {
		this.departments = departments;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAchievement() {
		return achievement;
	}

	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}

	public String getBmpd() {
		return bmpd;
	}

	public void setBmpd(String bmpd) {
		this.bmpd = bmpd;
	}

	public String getJobnum() {
		return jobnum;
	}

	public void setJobnum(String jobnum) {
		this.jobnum = jobnum;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	@Override
	public String toString() {
		return "Reputation [achievement=" + achievement + ", bmpd=" + bmpd
				+ ", date=" + date + ", employeeId=" + employeeId + ", ename="
				+ ename + ", jobnum=" + jobnum + ", post=" + post + "]";
	}	
	
}
