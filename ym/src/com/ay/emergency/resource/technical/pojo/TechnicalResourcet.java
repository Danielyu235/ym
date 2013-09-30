package com.ay.emergency.resource.technical.pojo;

import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;

/**
 * 技术支持实体类
 * @author lihe
 * @version 2013.03.12
 */
public class TechnicalResourcet extends MapPojo  {
	
	@Override
	public MapType getMapType() {
		return MapType.technical;
	}
	/**机构名称*/
    private String name;
    /**地址*/
    private String address;
    /**机构特长*/
    private String mechanismSpeciality;
    /**人员*/
    private String personnelNumber;
    /**负责人*/
    private String director;
    /**负责人电话*/
    private String telephone;
    /**负责人手机*/
    private String mobilePhone;
    /**联系人1*/
    private String contactsOne;
    /**联系人1电话*/
    private String contactsOneTelephone;
    /**联系人1手机*/
    private String contactsOneMobilePhone;
    /**联系人2*/
    private String contactsTwo;
    /**联系人2电话*/
    private String contactsTwoTelephone;
    /**联系人2手机*/
    private String contactsTwoMobilePhone;
    /**机构情况介绍*/
    private String organizeIntroduce;

    public void setName(String name){
    	this.name=name;
    }
    public String getName(){
    	return	this.name;
    }
    public void setAddress(String address){
    	this.address=address;
    }
    public String getAddress(){
    	return	this.address;
    }
    public void setMechanismSpeciality(String mechanismSpeciality){
    	this.mechanismSpeciality=mechanismSpeciality;
    }
    public String getMechanismSpeciality(){
    	return	this.mechanismSpeciality;
    }
    public void setPersonnelNumber(String personnelNumber){
    	this.personnelNumber=personnelNumber;
    }
    public String getPersonnelNumber(){
    	return	this.personnelNumber;
    }
    public void setDirector(String director){
    	this.director=director;
    }
    public String getDirector(){
    	return	this.director;
    }
    public void setTelephone(String telephone){
    	this.telephone=telephone;
    }
    public String getTelephone(){
    	return	this.telephone;
    }
    public void setMobilePhone(String mobilePhone){
    	this.mobilePhone=mobilePhone;
    }
    public String getMobilePhone(){
    	return	this.mobilePhone;
    }
    public void setContactsOne(String contactsOne){
    	this.contactsOne=contactsOne;
    }
    public String getContactsOne(){
    	return	this.contactsOne;
    }
    public void setContactsOneTelephone(String contactsOneTelephone){
    	this.contactsOneTelephone=contactsOneTelephone;
    }
    public String getContactsOneTelephone(){
    	return	this.contactsOneTelephone;
    }
    public void setContactsOneMobilePhone(String contactsOneMobilePhone){
    	this.contactsOneMobilePhone=contactsOneMobilePhone;
    }
    public String getContactsOneMobilePhone(){
    	return	this.contactsOneMobilePhone;
    }
    public void setContactsTwo(String contactsTwo){
    	this.contactsTwo=contactsTwo;
    }
    public String getContactsTwo(){
    	return	this.contactsTwo;
    }
    public void setContactsTwoTelephone(String contactsTwoTelephone){
    	this.contactsTwoTelephone=contactsTwoTelephone;
    }
    public String getContactsTwoTelephone(){
    	return	this.contactsTwoTelephone;
    }
    public void setContactsTwoMobilePhone(String contactsTwoMobilePhone){
    	this.contactsTwoMobilePhone=contactsTwoMobilePhone;
    }
    public String getContactsTwoMobilePhone(){
    	return	this.contactsTwoMobilePhone;
    }
    public void setOrganizeIntroduce(String organizeIntroduce){
    	this.organizeIntroduce=organizeIntroduce;
    }
    public String getOrganizeIntroduce(){
    	return	this.organizeIntroduce;
    }

}