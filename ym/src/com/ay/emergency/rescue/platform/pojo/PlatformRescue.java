package com.ay.emergency.rescue.platform.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.MultiLineField;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("启动应急救援平台")
public class PlatformRescue extends BasePojo {
	@ChineseName("报警人")
	private String alarmPeople;
	
	@ChineseName("报警人电话")
	private String alarmPeopleTel;
	
	@ChineseName("大事故类型")
	private String bigAccidentTypes; 
	private String bigText;
	@ChineseName("小事故类型")
	private String smallAccidentTypes;
	private String smallText;
	@ChineseName("事故发生时间")
	private String accidentOfTime;
	
	@ChineseName("事发地点")
	private String accidentOfPlace;
	
	@MultiLineField
	@ChineseName("事故过程描述")
	private String accidentDescription;
	
	@ChineseName("接警人")
	private String alarm;
	
	@ChineseName("接警时间")
	private String alarmTel;
	
	@MultiLineField
	@ChineseName("灾难损失概要说明（对周边环境的影响）")
	private String explain;
	
	@ChineseName("死亡人数")
	private String deathToll;
	
	@ChineseName("受伤人数")
	private String injuredToll;
	
	@ChineseName("失踪人数")
	private String disappearToll;
	
	@ChineseName("住院人数")
	private String hospitalToll;
	
	@ChineseName("被疏散人数")
	private String evacuatedToll;
	
	@ChineseName("疏散地点")
	private String evacuptedPlace;
	
	@MultiLineField
	@ChineseName("目前状况")
	private String situation;
	
	@ChineseName("备注")
	@MultiLineField
	private String remarks;
	@ChineseName("指令")
	private String order;
	
	private String state;
	
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAlarmPeople() {
		return alarmPeople;
	}
	public void setAlarmPeople(String alarmPeople) {
		this.alarmPeople = alarmPeople;
	}
	public String getAlarmPeopleTel() {
		return alarmPeopleTel;
	}
	public void setAlarmPeopleTel(String alarmPeopleTel) {
		this.alarmPeopleTel = alarmPeopleTel;
	}
	public String getBigAccidentTypes() {
		return bigAccidentTypes;
	}
	public void setBigAccidentTypes(String bigAccidentTypes) {
		this.bigAccidentTypes = bigAccidentTypes;
	}
	public String getBigText() {
		return bigText;
	}
	public void setBigText(String bigText) {
		this.bigText = bigText;
	}
	public String getSmallText() {
		return smallText;
	}
	public void setSmallText(String smallText) {
		this.smallText = smallText;
	}
	public String getSmallAccidentTypes() {
		return smallAccidentTypes;
	}
	public void setSmallAccidentTypes(String smallAccidentTypes) {
		this.smallAccidentTypes = smallAccidentTypes;
	}
	public String getAccidentOfTime() {
		return accidentOfTime;
	}
	public void setAccidentOfTime(String accidentOfTime) {
		this.accidentOfTime = accidentOfTime;
	}
	public String getAccidentOfPlace() {
		return accidentOfPlace;
	}
	public void setAccidentOfPlace(String accidentOfPlace) {
		this.accidentOfPlace = accidentOfPlace;
	}
	public String getAccidentDescription() {
		return accidentDescription;
	}
	public void setAccidentDescription(String accidentDescription) {
		this.accidentDescription = accidentDescription;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	public String getAlarmTel() {
		return alarmTel;
	}
	public void setAlarmTel(String alarmTel) {
		this.alarmTel = alarmTel;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getDeathToll() {
		return deathToll;
	}
	public void setDeathToll(String deathToll) {
		this.deathToll = deathToll;
	}
	public String getInjuredToll() {
		return injuredToll;
	}
	public void setInjuredToll(String injuredToll) {
		this.injuredToll = injuredToll;
	}
	public String getDisappearToll() {
		return disappearToll;
	}
	public void setDisappearToll(String disappearToll) {
		this.disappearToll = disappearToll;
	}
	public String getHospitalToll() {
		return hospitalToll;
	}
	public void setHospitalToll(String hospitalToll) {
		this.hospitalToll = hospitalToll;
	}
	public String getEvacuatedToll() {
		return evacuatedToll;
	}
	public void setEvacuatedToll(String evacuatedToll) {
		this.evacuatedToll = evacuatedToll;
	}
	public String getEvacuptedPlace() {
		return evacuptedPlace;
	}
	public void setEvacuptedPlace(String evacuptedPlace) {
		this.evacuptedPlace = evacuptedPlace;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}
