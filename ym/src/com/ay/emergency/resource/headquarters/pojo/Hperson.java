package com.ay.emergency.resource.headquarters.pojo;

import com.ay.framework.core.pojo.BasePojo;

public class Hperson extends BasePojo {
	
	//组别
	private String category;
	
	//姓名
	private String name;
	
	//手机号码
	private String phoneNumber;
	
	//关联应急指挥部ID
	private String hid;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	@Override
	public String toString() {
		return "Hperson [category=" + category + ", hid=" + hid + ", name="
				+ name + ", phoneNumber=" + phoneNumber + "]";
	}
	
}
