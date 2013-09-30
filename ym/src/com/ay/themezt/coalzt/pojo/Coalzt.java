package com.ay.themezt.coalzt.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("采煤系统主题")
public class Coalzt extends BasePojo{
	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@ChineseName("月份")
	private String month;
	
	@ChineseName("组别")
	private String group_type;
	
	@ChineseName("产量计划")
	private String planYield;
	
	@ChineseName("产量日产")
	private String dailyOutput;
	
	@ChineseName("产量奋斗计划")
	private String struggleYield;
	
	@ChineseName("进尺计划")
	private String  footagePlan;
	
	@ChineseName("进尺日进")
	private String footageDaily;
	
	@ChineseName("进尺奋斗计划")
	private String fstruggleYield;
	
	@ChineseName("工作面")
	private String workingFace;
	
	@ChineseName("人员效率")
	private  String staffEfficiency;
	
	@ChineseName("回采率")
	private String recoveryRatio;
	
	@ChineseName("精煤①")
	private String boutiqueCoalOne;

	@ChineseName("精煤②")
	private String boutiqueCoalTwo;
	
	@ChineseName("块炭")	
	private String carbonBlock;
	
	@ChineseName("末煤")
	private String smalls;
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}



	public String getGroup_type() {
		return group_type;
	}

	public void setGroup_type(String groupType) {
		group_type = groupType;
	}

	public String getPlanYield() {
		return planYield;
	}

	public void setPlanYield(String planYield) {
		this.planYield = planYield;
	}

	public String getDailyOutput() {
		return dailyOutput;
	}

	public void setDailyOutput(String dailyOutput) {
		this.dailyOutput = dailyOutput;
	}

	public String getStruggleYield() {
		return struggleYield;
	}

	public void setStruggleYield(String struggleYield) {
		this.struggleYield = struggleYield;
	}

	public String getFootagePlan() {
		return footagePlan;
	}

	public void setFootagePlan(String footagePlan) {
		this.footagePlan = footagePlan;
	}

	public String getFootageDaily() {
		return footageDaily;
	}

	public void setFootageDaily(String footageDaily) {
		this.footageDaily = footageDaily;
	}

	public String getFstruggleYield() {
		return fstruggleYield;
	}

	public void setFstruggleYield(String fstruggleYield) {
		this.fstruggleYield = fstruggleYield;
	}

	public String getWorkingFace() {
		return workingFace;
	}

	public void setWorkingFace(String workingFace) {
		this.workingFace = workingFace;
	}

	public String getStaffEfficiency() {
		return staffEfficiency;
	}

	public void setStaffEfficiency(String staffEfficiency) {
		this.staffEfficiency = staffEfficiency;
	}

	public String getRecoveryRatio() {
		return recoveryRatio;
	}

	public void setRecoveryRatio(String recoveryRatio) {
		this.recoveryRatio = recoveryRatio;
	}

	public String getBoutiqueCoalOne() {
		return boutiqueCoalOne;
	}

	public void setBoutiqueCoalOne(String boutiqueCoalOne) {
		this.boutiqueCoalOne = boutiqueCoalOne;
	}

	public String getBoutiqueCoalTwo() {
		return boutiqueCoalTwo;
	}

	public void setBoutiqueCoalTwo(String boutiqueCoalTwo) {
		this.boutiqueCoalTwo = boutiqueCoalTwo;
	}

	public String getCarbonBlock() {
		return carbonBlock;
	}

	public void setCarbonBlock(String carbonBlock) {
		this.carbonBlock = carbonBlock;
	}

	public String getSmalls() {
		return smalls;
	}

	public void setSmalls(String smalls) {
		this.smalls = smalls;
	}
	
}
