package com.ay.themezt.coalzt.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("原煤产量")
public class CoalOutput extends BasePojo {
	@ChineseName("单位队组")
	private String unitGroup;
	private String unitGroupText;
	@ChineseName("本月计划")
	private String monthPlan;
	@ChineseName("日计划")
	private String dailyPlan;
	@ChineseName("日产量")
	private String dailyOutput;
	@ChineseName("日超亏")
	private String dailyExceedLoss;
	@ChineseName("月累计划")
	private String monthCumulatePlan;
	@ChineseName("月累产量")
	private String monthCumulateOutput;
	@ChineseName("月累超亏")
	private String monthCumulateExceedLoss;
	@ChineseName("年累计划")
	private String yearCumulatePlan;
	@ChineseName("年累产量")
	private String yearCumulateOutput;
	@ChineseName("年累超亏")
	private String yearCumulateExceedLoss;
	public String getUnitGroup() {
		return unitGroup;
	}
	public void setUnitGroup(String unitGroup) {
		this.unitGroup = unitGroup;
	}
	public String getUnitGroupText() {
		return unitGroupText;
	}
	public void setUnitGroupText(String unitGroupText) {
		this.unitGroupText = unitGroupText;
	}
	public String getMonthPlan() {
		return monthPlan;
	}
	public void setMonthPlan(String monthPlan) {
		this.monthPlan = monthPlan;
	}
	public String getDailyPlan() {
		return dailyPlan;
	}
	public void setDailyPlan(String dailyPlan) {
		this.dailyPlan = dailyPlan;
	}
	public String getDailyOutput() {
		return dailyOutput;
	}
	public void setDailyOutput(String dailyOutput) {
		this.dailyOutput = dailyOutput;
	}
	public String getDailyExceedLoss() {
		return dailyExceedLoss;
	}
	public void setDailyExceedLoss(String dailyExceedLoss) {
		this.dailyExceedLoss = dailyExceedLoss;
	}
	public String getMonthCumulatePlan() {
		return monthCumulatePlan;
	}
	public void setMonthCumulatePlan(String monthCumulatePlan) {
		this.monthCumulatePlan = monthCumulatePlan;
	}
	public String getMonthCumulateOutput() {
		return monthCumulateOutput;
	}
	public void setMonthCumulateOutput(String monthCumulateOutput) {
		this.monthCumulateOutput = monthCumulateOutput;
	}
	public String getMonthCumulateExceedLoss() {
		return monthCumulateExceedLoss;
	}
	public void setMonthCumulateExceedLoss(String monthCumulateExceedLoss) {
		this.monthCumulateExceedLoss = monthCumulateExceedLoss;
	}
	public String getYearCumulatePlan() {
		return yearCumulatePlan;
	}
	public void setYearCumulatePlan(String yearCumulatePlan) {
		this.yearCumulatePlan = yearCumulatePlan;
	}
	public String getYearCumulateOutput() {
		return yearCumulateOutput;
	}
	public void setYearCumulateOutput(String yearCumulateOutput) {
		this.yearCumulateOutput = yearCumulateOutput;
	}
	public String getYearCumulateExceedLoss() {
		return yearCumulateExceedLoss;
	}
	public void setYearCumulateExceedLoss(String yearCumulateExceedLoss) {
		this.yearCumulateExceedLoss = yearCumulateExceedLoss;
	}
	
	
}
