package com.ay.emergency.plan.comprehensive.pojo;

import com.ay.framework.core.pojo.BasePojo;

/**
 * 综合应急预案与指挥人员的关联
 * @author zhangxiang
 * @version 2013-03-12
 */
public class PlanExpert extends BasePojo {
	//专家姓名
	private String name;
	
	//专家年龄
	private String age;
	
	//专家联系方式
	private String mobilePhone;
	
	//专家所在单位
	private String organize;
	
	//指挥人员ID
	private String expId;
	
	//担任角色
	private String role;
	

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getOrganize() {
		return organize;
	}

	public void setOrganize(String organize) {
		this.organize = organize;
	}

	public String getExpId() {
		return expId;
	}

	public void setExpId(String expId) {
		this.expId = expId;
	}
}
