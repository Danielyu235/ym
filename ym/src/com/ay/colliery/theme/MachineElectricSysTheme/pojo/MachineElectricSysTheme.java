package com.ay.colliery.theme.MachineElectricSysTheme.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("机电系统")
public class MachineElectricSysTheme extends BasePojo {	
	@ChineseName("设备完好率")
	private String intactRate;
	@ChineseName("检修情况")
	private String overhaulCondition;
	@ChineseName("所属部门")
	private String departmentId;
	@ChineseName("检修日期")
	private String overhauDate;
	//所属部门
	@PersistenceIgnore
	private String departmentName;
	public String getIntactRate() {
		return intactRate;
	}
	public void setIntactRate(String intactRate) {
		this.intactRate = intactRate;
	}
	public String getOverhaulCondition() {
		return overhaulCondition;
	}
	public void setOverhaulCondition(String overhaulCondition) {
		this.overhaulCondition = overhaulCondition;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getOverhauDate() {
		return overhauDate;
	}
	public void setOverhauDate(String overhauDate) {
		this.overhauDate = overhauDate;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
}
