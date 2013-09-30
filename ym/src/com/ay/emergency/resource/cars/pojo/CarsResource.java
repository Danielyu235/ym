package com.ay.emergency.resource.cars.pojo;

import com.ay.framework.core.pojo.BasePojo;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;

/**
 * 救援车辆
 * @author yuzhou
 * @version 2013年3月19日 
 */
public class CarsResource extends MapPojo  { 
	
    @Override
	public MapType getMapType() {
		return MapType.cars;
	}
	/** 车辆名称 */
    private String carName;
    /** 类型 */
    private String carStyle;
    /** 型号 */
    private String carModle;
    /** 吨位 */
    private String tonnage;
    /** 数量 */
    private String number;
    /** 自身是否带泵 */
    private String hasPump;
    /** 是否自配运输车辆 */
    private String hasCarProvide;
    /** 备注 */
    private String remark;
    /** 组织 */
    private String organize;
    /** 所属部门 */
    private String department;
    /** 负责人 */
    private String principal;
    /** 负责人手机 */
    private String mobilePhone;

    public void setCarName(String carName){
    	this.carName=carName;
    }
    public String getCarName(){
    	return	this.carName;
    }
    public void setCarStyle(String carStyle){
    	this.carStyle=carStyle;
    }
    public String getCarStyle(){
    	return	this.carStyle;
    }
    public void setCarModle(String carModle){
    	this.carModle=carModle;
    }
    public String getCarModle(){
    	return	this.carModle;
    }

    public String getTonnage()
    {
        return tonnage;
    }
    public void setTonnage(String tonnage)
    {
        this.tonnage = tonnage;
    }
    public String getNumber()
    {
        return number;
    }
    public void setNumber(String number)
    {
        this.number = number;
    }
    public String getHasPump()
    {
        return hasPump;
    }
    public void setHasPump(String hasPump)
    {
        this.hasPump = hasPump;
    }
    public String getHasCarProvide()
    {
        return hasCarProvide;
    }
    public void setHasCarProvide(String hasCarProvide)
    {
        this.hasCarProvide = hasCarProvide;
    }
    public void setRemark(String remark){
    	this.remark=remark;
    }
    public String getRemark(){
    	return	this.remark;
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
    public void setPrincipal(String principal){
    	this.principal=principal;
    }
    public String getPrincipal(){
    	return	this.principal;
    }
    public void setMobilePhone(String mobilePhone){
    	this.mobilePhone=mobilePhone;
    }
    public String getMobilePhone(){
    	return	this.mobilePhone;
    }

}