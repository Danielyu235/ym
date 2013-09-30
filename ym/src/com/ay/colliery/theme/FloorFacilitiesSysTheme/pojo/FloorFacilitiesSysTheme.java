package com.ay.colliery.theme.FloorFacilitiesSysTheme.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("地面设施系统")
public class FloorFacilitiesSysTheme extends BasePojo {
	@ChineseName("地面设施类型")
	private String floorType;
	@PersistenceIgnore
	private String floorTypeName;
	@ChineseName("所属科室")
	private String departmentId;
	@PersistenceIgnore
	private String departmentName;
	@ChineseName("得分")
	private String score;
	@ChineseName("扣分原因")
	private String reason;
	@ChineseName("评分时间")
	private String date;
	public String getFloorType() {
		return floorType;
	}
	public void setFloorType(String floorType) {
		this.floorType = floorType;
	}
	public String getFloorTypeName() {
		return floorTypeName;
	}
	public void setFloorTypeName(String floorTypeName) {
		this.floorTypeName = floorTypeName;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
