package com.ay.colliery.theme.AThreeAntiSysTheme.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("一通三防系统")
public class AThreeAntiSysTheme extends BasePojo {
	@ChineseName("巷道及重点部位的风速")
	private String wind;
	@ChineseName("瓦斯浓度")
	private String gasDensity;
	@ChineseName("时间")
	private String date;
	@ChineseName("所属区域")
	private String areaId;
	//区域中文名称
	@PersistenceIgnore
	private String areaName;
	public String getWind() {
		return wind;
	}
	public void setWind(String wind) {
		this.wind = wind;
	}
	public String getGasDensity() {
		return gasDensity;
	}
	public void setGasDensity(String gasDensity) {
		this.gasDensity = gasDensity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
}
