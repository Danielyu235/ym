package com.ay.emergency.resource.expert.pojo;

import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;

/**
 * 救援专家实体类
 * @author lihe
 * @version 2013.03.12
 */
public class ExpertResource extends MapPojo  {
	
	@Override
	public MapType getMapType() {
		return MapType.expert;
	}
	/**姓名*/
    private String name;
    /**性别*/
    private String sex;
    /**性别的中文*/
    private String sexText;
    /**年龄*/
    private String age;
    /**专业*/
    private String specialized;
    /**专业的中文*/
    private String specializedText;
    /**组别*/
    private String workGroup;
    /**组别的中文*/
    private String workGroupText;
    /**现任职务*/
    private String business;
    /**办公室电话*/
    private String officePhone;
    /**住宅电话*/
    private String homePhone;
    /**手机*/
    private String mobilePhone;
    /**序号*/
    private String number;
    /**家庭住址*/
    private String address;
    /**所属单位*/
    private String organize;
    /**所属部门*/
    private String department;
    /**工作经历*/
    private String experience;

    public String getSexText() {
		return sexText;
	}
	public void setSexText(String sexText) {
		this.sexText = sexText;
	}
	public String getSpecializedText() {
		return specializedText;
	}
	public void setSpecializedText(String specializedText) {
		this.specializedText = specializedText;
	}
	public String getWorkGroupText() {
		return workGroupText;
	}
	public void setWorkGroupText(String workGroupText) {
		this.workGroupText = workGroupText;
	}
	public void setName(String name){
    	this.name=name;
    }
    public String getName(){
    	return	this.name;
    }
    public void setSex(String sex){
    	this.sex=sex;
    }
    public String getSex(){
    	return	this.sex;
    }
    
    public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public void setSpecialized(String specialized){
    	this.specialized=specialized;
    }
    public String getSpecialized(){
    	return	this.specialized;
    }
    public void setWorkGroup(String workGroup){
    	this.workGroup=workGroup;
    }
    public String getWorkGroup(){
    	return	this.workGroup;
    }
    public void setBusiness(String business){
    	this.business=business;
    }
    public String getBusiness(){
    	return	this.business;
    }
    public void setOfficePhone(String officePhone){
    	this.officePhone=officePhone;
    }
    public String getOfficePhone(){
    	return	this.officePhone;
    }
    public void setHomePhone(String homePhone){
    	this.homePhone=homePhone;
    }
    public String getHomePhone(){
    	return	this.homePhone;
    }
    public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public void setNumber(String number){
    	this.number=number;
    }
    public String getNumber(){
    	return	this.number;
    }
    public void setAddress(String address){
    	this.address=address;
    }
    public String getAddress(){
    	return	this.address;
    }
    public void setOrganize(String organize){
    	this.organize=organize;
    }
    public String getOrganize(){
    	return	this.organize;
    }
    public void setDepartment(String department){
    	this.department=department;
    }
    public String getDepartment(){
    	return	this.department;
    }
    public void setExperience(String experience){
    	this.experience=experience;
    }
    public String getExperience(){
    	return	this.experience;
    }

}