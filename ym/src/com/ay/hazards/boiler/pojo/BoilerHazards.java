package com.ay.hazards.boiler.pojo;

import java.sql.Date;
import com.ay.framework.core.pojo.BasePojo;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;

/**
 *  重大危险源 锅炉实体类
 * @author zhangxiang
 * 2013-04-03
 */
public class BoilerHazards extends MapPojo implements IHazards {
	
	@Override
	public MapType getMapType() {
		// TODO Auto-generated method stub
		return MapType.boiler;
	}
	//锅炉型号
    private String boilerModel;
    
    //锅炉名称
    private String boilerName;
    private String corpName;
    //锅炉编号
    private String boilerNumber;
    
    //单位代码
    private String dwdm;
    
    //锅炉类型
    private String boilerType;
    
    //锅炉具体位置
    private String boilerLocation;
    
    //制造厂名		
    private String makeName;
    
    //制造日期
    private String makeTime;
    
    //安装完工日期
    private String installEndDate;
    
    //投入使用日期
    private String inputUseDate;
    
    //设计工作压力	MPa	
    private String desginWorkPressure;
    
    //许可使用压力	MPa
    private String permitUsePressure;
    
    //额定供热量 KCal/h
    private String fixLayHeat;
    
    //额定出力	  t/h
    private String limitOutput;
    
    //介质出口温度	℃
    private String agentEcportTemperature;
    
    //水处理方法
    private String waterManageMethod;
    
    //锅炉用途
    private String boilerUse;
    
    //备注（移装、检修、改造、事故记录）
    private String remarks;
    
    //填报人
    private String tbr;
    
    //填报日期
    private String tbrq;
    
    //填报联系电话
    private String tblxdh;
    
    public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public String getTbr() {
		return tbr;
	}
	public void setTbr(String tbr) {
		this.tbr = tbr;
	}
	public String getTbrq() {
		return tbrq;
	}
	public void setTbrq(String tbrq) {
		this.tbrq = tbrq;
	}
	public String getTblxdh() {
		return tblxdh;
	}
	public void setTblxdh(String tblxdh) {
		this.tblxdh = tblxdh;
	}
	public String getDwdm() {
		return dwdm;
	}
	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}
	public String getBoilerType() {
		return boilerType;
	}
	public void setBoilerType(String boilerType) {
		this.boilerType = boilerType;
	}
	public String getLimitOutput() {
		return limitOutput;
	}
	public void setLimitOutput(String limitOutput) {
		this.limitOutput = limitOutput;
	}
	public void setBoilerModel(String boilerModel){
    	this.boilerModel=boilerModel;
    }
    public String getBoilerModel(){
    	return	this.boilerModel;
    }
    public void setBoilerName(String boilerName){
    	this.boilerName=boilerName;
    }
    public String getBoilerName(){
    	return	this.boilerName;
    }
    public void setBoilerNumber(String boilerNumber){
    	this.boilerNumber=boilerNumber;
    }
    public String getBoilerNumber(){
    	return	this.boilerNumber;
    }
    public void setBoilerLocation(String boilerLocation){
    	this.boilerLocation=boilerLocation;
    }
    public String getBoilerLocation(){
    	return	this.boilerLocation;
    }
    public void setMakeName(String makeName){
    	this.makeName=makeName;
    }
    public String getMakeName(){
    	return	this.makeName;
    }
    public void setMakeTime(String makeTime){
    	this.makeTime=makeTime;
    }
    public String getMakeTime(){
    	return	this.makeTime;
    }
    public void setInstallEndDate(String installEndDate){
    	this.installEndDate=installEndDate;
    }
    public String getInstallEndDate(){
    	return	this.installEndDate;
    }
    public void setInputUseDate(String inputUseDate){
    	this.inputUseDate=inputUseDate;
    }
    public String getInputUseDate(){
    	return	this.inputUseDate;
    }
    public void setDesginWorkPressure(String desginWorkPressure){
    	this.desginWorkPressure=desginWorkPressure;
    }
    public String getDesginWorkPressure(){
    	return	this.desginWorkPressure;
    }
    public void setPermitUsePressure(String permitUsePressure){
    	this.permitUsePressure=permitUsePressure;
    }
    public String getPermitUsePressure(){
    	return	this.permitUsePressure;
    }
    public void setFixLayHeat(String fixLayHeat){
    	this.fixLayHeat=fixLayHeat;
    }
    public String getFixLayHeat(){
    	return	this.fixLayHeat;
    }
    public void setAgentEcportTemperature(String agentEcportTemperature){
    	this.agentEcportTemperature=agentEcportTemperature;
    }
    public String getAgentEcportTemperature(){
    	return	this.agentEcportTemperature;
    }
    public void setWaterManageMethod(String waterManageMethod){
    	this.waterManageMethod=waterManageMethod;
    }
    public String getWaterManageMethod(){
    	return	this.waterManageMethod;
    }
    public void setBoilerUse(String boilerUse){
    	this.boilerUse=boilerUse;
    }
    public String getBoilerUse(){
    	return	this.boilerUse;
    }
    public void setRemarks(String remarks){
    	this.remarks=remarks;
    }
    public String getRemarks(){
    	return	this.remarks;
    }
    @Override
    public HazardsType getHazardsType() {
	return HazardsType.boiler;
    }

}