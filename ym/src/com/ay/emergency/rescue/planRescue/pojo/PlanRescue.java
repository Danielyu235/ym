package com.ay.emergency.rescue.planRescue.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("启动预案")
public class PlanRescue extends BasePojo {
	@ChineseName("预案id")
	private String pid;
	@ChineseName("建立时间")
	private String pCreateTime;
	@ChineseName("预案事故类型")
	private String accidentType;
	@ChineseName("预案名称")
	private String planName;
	@ChineseName("预案事故类型名称")
	@PersistenceIgnore
	private String accidentTypeName;
	@ChineseName("预案等级")
	private String planLevel;
	@ChineseName("预案等级名称")
	@PersistenceIgnore
	private String planLevelName;
	@ChineseName("接警Id")
	private String rid;
	@ChineseName("接警事故类型")
	private String bigAccidentType;
	@ChineseName("接警事故名称")
	@PersistenceIgnore
	private String bigAccidentTypeName;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getpCreateTime() {
		return pCreateTime;
	}
	public void setpCreateTime(String pCreateTime) {
		this.pCreateTime = pCreateTime;
	}
	public String getAccidentType() {
		return accidentType;
	}
	public void setAccidentType(String accidentType) {
		this.accidentType = accidentType;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getAccidentTypeName() {
		return accidentTypeName;
	}
	public void setAccidentTypeName(String accidentTypeName) {
		this.accidentTypeName = accidentTypeName;
	}
	public String getPlanLevel() {
		return planLevel;
	}
	public void setPlanLevel(String planLevel) {
		this.planLevel = planLevel;
	}
	public String getPlanLevelName() {
		return planLevelName;
	}
	public void setPlanLevelName(String planLevelName) {
		this.planLevelName = planLevelName;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getBigAccidentType() {
		return bigAccidentType;
	}
	public void setBigAccidentType(String bigAccidentType) {
		this.bigAccidentType = bigAccidentType;
	}
	public String getBigAccidentTypeName() {
		return bigAccidentTypeName;
	}
	public void setBigAccidentTypeName(String bigAccidentTypeName) {
		this.bigAccidentTypeName = bigAccidentTypeName;
	}
	
}
