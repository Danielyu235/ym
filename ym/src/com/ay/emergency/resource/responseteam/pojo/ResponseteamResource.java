package com.ay.emergency.resource.responseteam.pojo;

import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;

/**
 * 救援队伍实体类
 * @author 软件工程部产品小组 yuzhou
 * 2013年3月19日 
 */
public class ResponseteamResource extends MapPojo  { 
    
    @Override
	public MapType getMapType() {
		return MapType.responseteam;
	}
	//队伍名称
    private String teamname;
    
    //队伍类型
    private String teamtype;
    
    //队伍中文
    private String teamtypeCode;
    
    //地址
    private String address;
    
    //人员
    private Integer persons;
    
    //负责人
    private String headOf;
    
    //负责人电话
    private String headOfTel;
    
    //负责人手机
    private String headOfPhone;
    
    //联系人
    private String contact;
    
    //联系人电话
    private String contactTel;
    
    //联系人手机
    private String contactPhone;
    
    //所属单位
    private String affiliation;
    
    //所属部门
    private String departments;
    
    //队伍情况介绍 
    private String teamBriefing;

    public void setTeamname(String teamname){
    	this.teamname=teamname;
    }
    public String getTeamname(){
    	return	this.teamname;
    }
    public String getTeamtype()
    {
        return teamtype;
    }
    public void setTeamtype(String teamtype)
    {
        this.teamtype = teamtype;
    }
    public String getTeamtypeCode()
    {
        return teamtypeCode;
    }
    public void setTeamtypeCode(String teamtypeCode)
    {
        this.teamtypeCode = teamtypeCode;
    }
    public void setAddress(String address){
    	this.address=address;
    }
    public String getAddress(){
    	return	this.address;
    }
    public void setPersons(Integer persons){
    	this.persons=persons;
    }
    public Integer getPersons(){
    	return	this.persons;
    }
    public void setHeadOf(String headOf){
    	this.headOf=headOf;
    }
    public String getHeadOf(){
    	return	this.headOf;
    }
    public void setHeadOfTel(String headOfTel){
    	this.headOfTel=headOfTel;
    }
    public String getHeadOfTel(){
    	return	this.headOfTel;
    }
    public void setHeadOfPhone(String headOfPhone){
    	this.headOfPhone=headOfPhone;
    }
    public String getHeadOfPhone(){
    	return	this.headOfPhone;
    }
    public void setContact(String contact){
    	this.contact=contact;
    }
    public String getContact(){
    	return	this.contact;
    }
    public void setContactTel(String contactTel){
    	this.contactTel=contactTel;
    }
    public String getContactTel(){
    	return	this.contactTel;
    }
    public void setContactPhone(String contactPhone){
    	this.contactPhone=contactPhone;
    }
    public String getContactPhone(){
    	return	this.contactPhone;
    }
    public void setAffiliation(String affiliation){
    	this.affiliation=affiliation;
    }
    public String getAffiliation(){
    	return	this.affiliation;
    }
    public void setDepartments(String departments){
    	this.departments=departments;
    }
    public String getDepartments(){
    	return	this.departments;
    }
    public void setTeamBriefing(String teamBriefing){
    	this.teamBriefing=teamBriefing;
    }
    public String getTeamBriefing(){
    	return	this.teamBriefing;
    }

}