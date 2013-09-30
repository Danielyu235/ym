package com.ay.emergency.plan.special.pojo;

import com.ay.framework.core.pojo.BasePojo;

/**
 * @description 专项应急预案实体类
 * @author wgw
 * @date 2013-03-13
 */
@SuppressWarnings("serial")
public class SpecialPlan extends BasePojo  { 
    /**
     * 预案名称
     */
    private String planName;
    
    /**
     * 用来显示字符串的创建时间
     */
    private String time;
    
    /**
     * 预案类型
     */
    private String planType;
    
    /**
     * 事故类型 代码
     */
    private String accidentType;
    /**
     * 事故类型 代码
     */
    private String accidentTypeSubclass;
    /**
     * 事故类型  中文
     */
    private String accidentTypeText;
    /**
     * 事故类型  中文
     */
    private String accidentTypeSubclassText;
   
	/**
	 * 预案等级
	 */
    private String planLevel;
    
   /**
   * 预案等级 中文
   */
    private String planLevelText;
    
    /**
     * 事故类型和危害程度分析
     */
    private String typeHarmAnalysis;
    
    /**
     * 应急处置基本原则
     */
    private String basicPrinciples;
    
    /**
     * 应急组织体系
     */
    private String EmergencyOrganizationSystem;
    
    /**
     * 指挥机构及职责
     */
    private String structureResponsibilities;
    
    /**
     * 危险源监控
     */
    private String hazardControl;
    
    /**
     * 预警行动
     */
    private String actionWarning;
    
    /**
     * 信息报告程序
     */
    private String informationReportingProcedures;
    
    /**
     * 响应分级
     */
    private String responseGrading;
    
    /**
     * 响应程度
     */
    private String responseDegree;
    
    /**
     * 处置措施
     */
    private String disposalMeasures;
    
    /**
     * 应急物资与装备保障
     */
    private String SuppliesEquipment;
    
    /**
     * 指挥人员id
     */
    private String expId;
    
    /**
     * 救援物资id
     */
    private String suppliesId;

    
	public String getAccidentTypeSubclass() {
		return accidentTypeSubclass;
	}

	public void setAccidentTypeSubclass(String accidentTypeSubclass) {
		this.accidentTypeSubclass = accidentTypeSubclass;
	}

	public String getAccidentTypeSubclassText() {
		return accidentTypeSubclassText;
	}

	public void setAccidentTypeSubclassText(String accidentTypeSubclassText) {
		this.accidentTypeSubclassText = accidentTypeSubclassText;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	public String getAccidentType() {
		return accidentType;
	}

	public void setAccidentType(String accidentType) {
		this.accidentType = accidentType;
	}

	public String getAccidentTypeText() {
		return accidentTypeText;
	}

	public void setAccidentTypeText(String accidentTypeText) {
		this.accidentTypeText = accidentTypeText;
	}

	public String getPlanLevel() {
		return planLevel;
	}

	public void setPlanLevel(String planLevel) {
		this.planLevel = planLevel;
	}

	public String getPlanLevelText() {
		return planLevelText;
	}

	public void setPlanLevelText(String planLevelText) {
		this.planLevelText = planLevelText;
	}

	public String getTypeHarmAnalysis() {
		return typeHarmAnalysis;
	}

	public void setTypeHarmAnalysis(String typeHarmAnalysis) {
		this.typeHarmAnalysis = typeHarmAnalysis;
	}

	public String getBasicPrinciples() {
		return basicPrinciples;
	}

	public void setBasicPrinciples(String basicPrinciples) {
		this.basicPrinciples = basicPrinciples;
	}

	public String getEmergencyOrganizationSystem() {
		return EmergencyOrganizationSystem;
	}

	public void setEmergencyOrganizationSystem(String emergencyOrganizationSystem) {
		EmergencyOrganizationSystem = emergencyOrganizationSystem;
	}

	public String getStructureResponsibilities() {
		return structureResponsibilities;
	}

	public void setStructureResponsibilities(String structureResponsibilities) {
		this.structureResponsibilities = structureResponsibilities;
	}

	public String getHazardControl() {
		return hazardControl;
	}

	public void setHazardControl(String hazardControl) {
		this.hazardControl = hazardControl;
	}

	public String getActionWarning() {
		return actionWarning;
	}

	public void setActionWarning(String actionWarning) {
		this.actionWarning = actionWarning;
	}

	public String getInformationReportingProcedures() {
		return informationReportingProcedures;
	}

	public void setInformationReportingProcedures(
			String informationReportingProcedures) {
		this.informationReportingProcedures = informationReportingProcedures;
	}

	public String getResponseGrading() {
		return responseGrading;
	}

	public void setResponseGrading(String responseGrading) {
		this.responseGrading = responseGrading;
	}

	public String getResponseDegree() {
		return responseDegree;
	}

	public void setResponseDegree(String responseDegree) {
		this.responseDegree = responseDegree;
	}

	public String getDisposalMeasures() {
		return disposalMeasures;
	}

	public void setDisposalMeasures(String disposalMeasures) {
		this.disposalMeasures = disposalMeasures;
	}

	public String getSuppliesEquipment() {
		return SuppliesEquipment;
	}

	public void setSuppliesEquipment(String suppliesEquipment) {
		SuppliesEquipment = suppliesEquipment;
	}

	public String getExpId() {
		return expId;
	}

	public void setExpId(String expId) {
		this.expId = expId;
	}

	public String getSuppliesId() {
		return suppliesId;
	}

	public void setSuppliesId(String suppliesId) {
		this.suppliesId = suppliesId;
	}
    
}