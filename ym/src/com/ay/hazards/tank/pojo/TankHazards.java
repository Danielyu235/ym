package com.ay.hazards.tank.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
import com.ay.hazards.hazardousmaterials.pojo.Materials;
/***
 * 重大危险源贮罐区——贮罐
 * @author zhangxiang
 * 2013-04-09
 */
//@ChineseName("贮罐")
public class TankHazards extends BasePojo {
        /**
         * 包含的危险物质
         */
        @PersistenceIgnore
        private Materials materials;
    	@ChineseName("危险物质ID")
    	private String materialsId;
	@ChineseName("贮罐序号")
	private String tankNumber;
	@ChineseName("贮罐区ID")
	private String tankAraeID;
	@ChineseName("贮罐名称")
	private String tankName;
	@ChineseName("贮罐形状")
	private String tankForm;
	@ChineseName("贮罐形式")
	private String tankShape;
	@ChineseName("安装形式")
	private String installShape;
	@ChineseName("贮罐材质")
	private String tankMaterial;
	@ChineseName("公称直径")
	private String nominalDiameter;
	@ChineseName("容积")
	private String volume;
	@ChineseName("贮存物质名称")
	private String keepMatterName;
	@ChineseName("物质状态")
	private String matterState;
	@ChineseName("日常最大贮存量")
	private String maxKeep;
	@ChineseName("设计能力")
	private String designAblity;
	@ChineseName("实际工作压力")
	private String realAblity;
	@ChineseName("设计温度")
	private String designTemperature;
	@ChineseName("实际工作温度")
	private String realTemperature;
	@ChineseName("设计使用年限")
	private String designedServiceLife;
	@ChineseName("投产时间")
	private String operationDate;
	@ChineseName("进料方式")
	private String feedingMode;
	@ChineseName("出料方式")
	private String dischargingMode;
	@ChineseName("进料管道直径")
	private String feedingDiameter;
	@ChineseName("进料管道设计压力")
	private String feedingDesignAblity;
	@ChineseName("进料管道实际工作压力")
	private String feedingRealAblity;
	@ChineseName("出料管道直径")
	private String discharginDiameter;
	@ChineseName("出料管道设计压力")
	private String discharginDesignAblity;
	@ChineseName("出料管道实际工作压力")
	private String discharginRealAblity;
	
	public Materials getMaterials() {
	    return materials;
	}
	public void setMaterials(Materials materials) {
	    this.materials = materials;
	}
	public String getMaterialsId() {
	    return materialsId;
	}
	public void setMaterialsId(String materialsId) {
	    this.materialsId = materialsId;
	}
	public String getTankNumber() {
		return tankNumber;
	}
	public void setTankNumber(String tankNumber) {
		this.tankNumber = tankNumber;
	}
	public String getTankAraeID() {
		return tankAraeID;
	}
	public void setTankAraeID(String tankAraeID) {
		this.tankAraeID = tankAraeID;
	}
	public String getTankName() {
		return tankName;
	}
	public void setTankName(String tankName) {
		this.tankName = tankName;
	}
	public String getTankForm() {
		return tankForm;
	}
	public void setTankForm(String tankForm) {
		this.tankForm = tankForm;
	}
	public String getTankShape() {
		return tankShape;
	}
	public void setTankShape(String tankShape) {
		this.tankShape = tankShape;
	}
	public String getInstallShape() {
		return installShape;
	}
	public void setInstallShape(String installShape) {
		this.installShape = installShape;
	}
	public String getTankMaterial() {
		return tankMaterial;
	}
	public void setTankMaterial(String tankMaterial) {
		this.tankMaterial = tankMaterial;
	}
	public String getNominalDiameter() {
		return nominalDiameter;
	}
	public void setNominalDiameter(String nominalDiameter) {
		this.nominalDiameter = nominalDiameter;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	public String getKeepMatterName() {
		return keepMatterName;
	}
	public void setKeepMatterName(String keepMatterName) {
		this.keepMatterName = keepMatterName;
	}
	public String getMatterState() {
		return matterState;
	}
	public void setMatterState(String matterState) {
		this.matterState = matterState;
	}
	public String getMaxKeep() {
		return maxKeep;
	}
	public void setMaxKeep(String maxKeep) {
		this.maxKeep = maxKeep;
	}
	public String getDesignAblity() {
		return designAblity;
	}
	public void setDesignAblity(String designAblity) {
		this.designAblity = designAblity;
	}
	public String getRealAblity() {
		return realAblity;
	}
	public void setRealAblity(String realAblity) {
		this.realAblity = realAblity;
	}
	public String getDesignTemperature() {
		return designTemperature;
	}
	public void setDesignTemperature(String designTemperature) {
		this.designTemperature = designTemperature;
	}
	public String getRealTemperature() {
		return realTemperature;
	}
	public void setRealTemperature(String realTemperature) {
		this.realTemperature = realTemperature;
	}
	public String getDesignedServiceLife() {
		return designedServiceLife;
	}
	public void setDesignedServiceLife(String designedServiceLife) {
		this.designedServiceLife = designedServiceLife;
	}
	public String getOperationDate() {
		return operationDate;
	}
	public void setOperationDate(String operationDate) {
		this.operationDate = operationDate;
	}
	public String getFeedingMode() {
		return feedingMode;
	}
	public void setFeedingMode(String feedingMode) {
		this.feedingMode = feedingMode;
	}
	public String getDischargingMode() {
		return dischargingMode;
	}
	public void setDischargingMode(String dischargingMode) {
		this.dischargingMode = dischargingMode;
	}
	public String getFeedingDiameter() {
		return feedingDiameter;
	}
	public void setFeedingDiameter(String feedingDiameter) {
		this.feedingDiameter = feedingDiameter;
	}
	public String getFeedingDesignAblity() {
		return feedingDesignAblity;
	}
	public void setFeedingDesignAblity(String feedingDesignAblity) {
		this.feedingDesignAblity = feedingDesignAblity;
	}
	public String getFeedingRealAblity() {
		return feedingRealAblity;
	}
	public void setFeedingRealAblity(String feedingRealAblity) {
		this.feedingRealAblity = feedingRealAblity;
	}
	public String getDischarginDiameter() {
		return discharginDiameter;
	}
	public void setDischarginDiameter(String discharginDiameter) {
		this.discharginDiameter = discharginDiameter;
	}
	public String getDischarginDesignAblity() {
		return discharginDesignAblity;
	}
	public void setDischarginDesignAblity(String discharginDesignAblity) {
		this.discharginDesignAblity = discharginDesignAblity;
	}
	public String getDischarginRealAblity() {
		return discharginRealAblity;
	}
	public void setDischarginRealAblity(String discharginRealAblity) {
		this.discharginRealAblity = discharginRealAblity;
	}
	
}
