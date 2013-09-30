package com.ay.hazards.tank.pojo;

import java.util.List;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;
/**
 * 重大危险源贮罐区
 * @author zhangxiang
 * 2013-04-09
 */
//@ChineseName("贮罐区")
public class TankAraeHazards extends MapPojo implements IHazards {
	
	
    	@Override
	public MapType getMapType() {
		return MapType.tank;
	}
		/**
    	 * 贮罐集合
    	 */
    	@PersistenceIgnore
    	private List<TankHazards> tanks;
	@ChineseName("编号")
	private String number;
	@ChineseName("单位代码")
	private String dwdm;
	@PersistenceIgnore
	private String corpName;
	@ChineseName("贮罐区名称")
	private String tankName;
	@ChineseName("具体位置")
	private String address;
	@ChineseName("所处环境功能区")
	private String ambientDomain;
	@ChineseName("贮罐区面积")
	private String tankArea;
	@ChineseName("有无防护堤")
	private String isNonBulwark;
	@ChineseName("防护堤所围面积")
	private String bulwarkArea;
	@ChineseName("贮罐个数")
	private String tankNumber;
	@ChineseName("最小距离")
	private String minRange;
	@ChineseName("填表联系电话")
	private String tblxdh;
	
	@ChineseName("填表人")
	private String tbr;
	
	@ChineseName("填表日期")
	private String tbrq;
	
	public List<TankHazards> getTanks() {
	    return tanks;
	}
	public void setTanks(List<TankHazards> tanks) {
	    this.tanks = tanks;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getDwdm() {
		return dwdm;
	}
	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}
	public String getTankName() {
		return tankName;
	}
	public void setTankName(String tankName) {
		this.tankName = tankName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAmbientDomain() {
		return ambientDomain;
	}
	public void setAmbientDomain(String ambientDomain) {
		this.ambientDomain = ambientDomain;
	}
	public String getTankArea() {
		return tankArea;
	}
	public void setTankArea(String tankArea) {
		this.tankArea = tankArea;
	}
	public String getIsNonBulwark() {
		return isNonBulwark;
	}
	public void setIsNonBulwark(String isNonBulwark) {
		this.isNonBulwark = isNonBulwark;
	}
	public String getBulwarkArea() {
		return bulwarkArea;
	}
	public void setBulwarkArea(String bulwarkArea) {
		this.bulwarkArea = bulwarkArea;
	}
	public String getTankNumber() {
		return tankNumber;
	}
	public void setTankNumber(String tankNumber) {
		this.tankNumber = tankNumber;
	}
	public String getMinRange() {
		return minRange;
	}
	public void setMinRange(String minRange) {
		this.minRange = minRange;
	}
	public String getTblxdh() {
		return tblxdh;
	}
	public void setTblxdh(String tblxdh) {
		this.tblxdh = tblxdh;
	}
	public String getTbr() {
		return tbr;
	}
	public void setTbr(String tbr) {
		this.tbr = tbr;
	}
	public String getTbrq() {
		return tbrq;
	}
	public void setTbrq(String tbrq) {
		this.tbrq = tbrq;
	}
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	@Override
	public HazardsType getHazardsType() {
	    return HazardsType.tank;
	}
	
}
