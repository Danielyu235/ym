package com.ay.emergency.resource.shelter.pojo;

import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;

/**
 * 避难场所实体类
 * @author lihe
 * @version 2013.03.12
 */
public class ShelterResource extends MapPojo  {
	
	@Override
	public MapType getMapType() {
		return MapType.shelter;
	}
	/**场所名称*/
    private String name;
    /**场所地址 */
    private String address;
    /**房屋面积*/
    private String area;
    /**容纳人数*/
    private String number;
    /**负责单位*/
    private String organize;
	/**负责人*/
    private String director;
    /**负责人手机*/
    private String mobilePhone;
    /**场所情况介绍*/
    private String introduction;

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
    public void setArea(String area){
    	this.area=area;
    }
    public String getArea(){
    	return	this.area;
    }
    public void setNumber(String number){
    	this.number=number;
    }
    public String getNumber(){
    	return	this.number;
    }
    public String getOrganize() {
		return organize;
	}
	public void setOrganize(String organize) {
		this.organize = organize;
	}
    public void setDirector(String director){
    	this.director=director;
    }
    public String getDirector(){
    	return	this.director;
    }
    public void setMobilePhone(String mobilePhone){
    	this.mobilePhone=mobilePhone;
    }
    public String getMobilePhone(){
    	return	this.mobilePhone;
    }
    public void setIntroduction(String introduction){
    	this.introduction=introduction;
    }
    public String getIntroduction(){
    	return	this.introduction;
    }

}