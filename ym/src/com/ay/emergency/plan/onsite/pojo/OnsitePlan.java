package com.ay.emergency.plan.onsite.pojo;

import java.sql.Date;
import com.ay.framework.core.pojo.BasePojo;

/**
 * 现场处理方案实体类
 * @author lihe
 * @version 2013.03.14
 * 
 */
public class OnsitePlan extends BasePojo  { 
	/**预案名称*/
    private String planName;
    /**预案类型*/
    private String planType;
    /**事故类型父级*/
    private String accidenttypeFather;
    /**事故类型父级中文*/
    private String accidenttypeFatherText;
    /**事故类型子级*/
    private String accidenttypeSon;
    /**事故类型子级中文*/
    private String accidenttypeSonText;
    /**预案级别*/
    private String planLeve;
    /**预案级别中文*/ 
    private String planLeveText;
    /**事故特征*/
    private String accidentCharacteristics;
    /**应急组织与职责*/
    private String organizeDuty;
    /**应急处置*/
    private String emergencyDisposal;
    /**注意事项*/
    private String attention;
    /**建立时间*/
    private String time;

    public void setPlanName(String planName){
    	this.planName=planName;
    }
    public String getPlanName(){
    	return	this.planName;
    }
    public void setPlanType(String planType){
    	this.planType=planType;
    }
    public String getPlanType(){
    	return	this.planType;
    }
    public void setAccidenttypeFather(String accidenttypeFather){
    	this.accidenttypeFather=accidenttypeFather;
    }
    public String getAccidenttypeFather(){
    	return	this.accidenttypeFather;
    }
    public void setAccidenttypeSon(String accidenttypeSon){
    	this.accidenttypeSon=accidenttypeSon;
    }
    public String getAccidenttypeSon(){
    	return	this.accidenttypeSon;
    }
    public void setPlanLeve(String planLeve){
    	this.planLeve=planLeve;
    }
    public String getPlanLeve(){
    	return	this.planLeve;
    }
    public void setAccidentCharacteristics(String accidentCharacteristics){
    	this.accidentCharacteristics=accidentCharacteristics;
    }
    public String getAccidentCharacteristics(){
    	return	this.accidentCharacteristics;
    }
    public void setOrganizeDuty(String organizeDuty){
    	this.organizeDuty=organizeDuty;
    }
    public String getOrganizeDuty(){
    	return	this.organizeDuty;
    }
    public void setEmergencyDisposal(String emergencyDisposal){
    	this.emergencyDisposal=emergencyDisposal;
    }
    public String getEmergencyDisposal(){
    	return	this.emergencyDisposal;
    }
    public void setAttention(String attention){
    	this.attention=attention;
    }
    public String getAttention(){
    	return	this.attention;
    }
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAccidenttypeFatherText() {
		return accidenttypeFatherText;
	}
	public void setAccidenttypeFatherText(String accidenttypeFatherText) {
		this.accidenttypeFatherText = accidenttypeFatherText;
	}
	public String getAccidenttypeSonText() {
		return accidenttypeSonText;
	}
	public void setAccidenttypeSonText(String accidenttypeSonText) {
		this.accidenttypeSonText = accidenttypeSonText;
	}
	public String getPlanLeveText() {
		return planLeveText;
	}
	public void setPlanLeveText(String planLeveText) {
		this.planLeveText = planLeveText;
	}

}