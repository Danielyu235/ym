package com.ay.safe.health.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("人员职业健康")
public class HealthSafe extends BasePojo {
	@ChineseName("员工工号")
	private String employeeId;
	private String employeeName;
	@ChineseName("体检结果")
	private String source;
	@ChineseName("填报时间")
	private String date;
	@ChineseName("职业项数量")
	private String number;
	@ChineseName("备注")
	private String remark;
	
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "HealthSafe [date=" + date + ", employeeId=" + employeeId
				+ ", number=" + number + ", remark=" + remark + ", source="
				+ source + "]";
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
}
