package com.ay.colliery.theme.TunnellingSysTheme.pojo;

import org.junit.experimental.theories.ParametersSuppliedBy;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
/**
 * 掘进系统主题实体类
 * @author zhangxiang
 * 2013-05-21
 */ 
//@ChineseName("掘进系统")
public class TunnellingSysTheme extends BasePojo {
	@ChineseName("所属掘进队伍")
	private String tunnllingGroupID;
	@ChineseName("实际掘进")
	private String realityTunnlling;
	@ChineseName("计划掘进")
	private String planTunnlling;
	@ChineseName("掘进日期")
	private String tunnllingDate;
	@PersistenceIgnore
	private String tunnllingGroupName;
	public String getTunnllingGroupID() {
		return tunnllingGroupID;
	}
	public void setTunnllingGroupID(String tunnllingGroupID) {
		this.tunnllingGroupID = tunnllingGroupID;
	}
	public String getRealityTunnlling() {
		return realityTunnlling;
	}
	public void setRealityTunnlling(String realityTunnlling) {
		this.realityTunnlling = realityTunnlling;
	}
	public String getPlanTunnlling() {
		return planTunnlling;
	}
	public void setPlanTunnlling(String planTunnlling) {
		this.planTunnlling = planTunnlling;
	}
	public String getTunnllingDate() {
		return tunnllingDate;
	}
	public void setTunnllingDate(String tunnllingDate) {
		this.tunnllingDate = tunnllingDate;
	}
	public String getTunnllingGroupName() {
		return tunnllingGroupName;
	}
	public void setTunnllingGroupName(String tunnllingGroupName) {
		this.tunnllingGroupName = tunnllingGroupName;
	}
}
