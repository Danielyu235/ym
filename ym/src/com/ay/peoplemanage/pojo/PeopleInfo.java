package com.ay.peoplemanage.pojo;

import java.util.Date;

import com.ay.framework.core.pojo.BasePojo;

/**
 * 封装联系人信息
 * @author liuhu
 * @Date 20130409
 */
public class PeopleInfo extends BasePojo{
	
	
	/**
	 * 联系人id
	 */
	private String id; 
	private String status;
	/**
	 * 联系人姓名
	 */
	private String created;
	private Date createTime;
	private String updated;
	private Date updateTime;
	private String postcode;
	
	private String name;
	/**
	 * 年龄
	 */
	private String age;
	/**
	 * 性别
	 */
	private String sex;
	 /**
	  * 性别的中文
	  */
    private String sexText;
	/**
	 * 手机号
	 */
	private String mobilenumber;
	/**
	 * 家庭电话
	 */
	private String phonenumber;
	/**
	 * 办公室电话
	 */
	private String officephonenumber;
	/**
	 * 单位
	 */
	private String unit;
	/**
	 * 职务
	 */
	private String duty;
	/**
	 * 部门
	 */
	private String deparment;
	/**
	 * 部门的中文
	 */
	private String deparmentText;

	/**
	 * 家庭住址
	 */
	private String address;
	/**
	 * 工作经历
	 */
	private String workexperience;
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getOfficephonenumber() {
		return officephonenumber;
	}
	public void setOfficephonenumber(String officephonenumber) {
		this.officephonenumber = officephonenumber;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getDeparment() {
		return deparment;
	}
	public void setDeparment(String deparment) {
		this.deparment = deparment;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getWorkexperience() {
		return workexperience;
	}
	public void setWorkexperience(String workexperience) {
		this.workexperience = workexperience;
	}
	public String getSexText() {
		return sexText;
	}
	public void setSexText(String sexText) {
		this.sexText = sexText;
	}
	public String getDeparmentText() {
		return deparmentText;
	}
	public void setDeparmentText(String deparmentText) {
		this.deparmentText = deparmentText;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
	public String getUpdated() {
		return updated;
	}
	public void setUpdated(String updated) {
		this.updated = updated;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String toString() {
		return "PeopleInfo [address=" + address + ", age=" + age
				+ ", createTime=" + createTime + ", created=" + created
				+ ", deparment=" + deparment + ", duty=" + duty + ", id=" + id
				+ ", mobilenumber=" + mobilenumber + ", name=" + name
				+ ", officephonenumber=" + officephonenumber + ", phonenumber="
				+ phonenumber + ", postcode=" + postcode + ", sex=" + sex
				+ ", status=" + status + ", unit=" + unit + ", updateTime="
				+ updateTime + ", updated=" + updated + ", workexperience="
				+ workexperience + "]";
	}
}
