package com.ay.safe.health.pojo;

public class HealthSafePojo extends HealthSafe {
	
	//工号
	private String jobNum;
	//员工姓名
	private String name;
	//员工专业
	private String major;
	//员工岗位
	private String post;
	
	public String getJobNum() {
		return jobNum;
	}
	public void setJobNum(String jobNum) {
		this.jobNum = jobNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	@Override
	public String toString() {
		return "HealthSafePojo [jobNum=" + jobNum + ", major=" + major
				+ ", name=" + name + ", post=" + post + "]";
	}
	
	
	
	
	
}
