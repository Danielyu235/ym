package com.ay.hazards.hazardousmaterials.pojo;

import com.ay.framework.core.pojo.BasePojo;
/**
 * 危险化学品分类 
 * @author zhangxiang
 * 2013-04-18
 */
public class ChemicalsHazardous extends BasePojo {
	/** 危险化学品类别 **/
	private String wxhxplb;
	/** 危险化学品说明 **/
	private String wxhxpsm;
	/** 临界值 **/
	private String ljz;
	/** 危险化学品名称 **/
	private String wxhxpmc;
	
	public String getWxhxpmc() {
		return wxhxpmc;
	}
	public void setWxhxpmc(String wxhxpmc) {
		this.wxhxpmc = wxhxpmc;
	}
	public String getWxhxplb() {
		return wxhxplb;
	}
	public void setWxhxplb(String wxhxplb) {
		this.wxhxplb = wxhxplb;
	}
	public String getWxhxpsm() {
		return wxhxpsm;
	}
	public void setWxhxpsm(String wxhxpsm) {
		this.wxhxpsm = wxhxpsm;
	}
	public String getLjz() {
		return ljz;
	}
	public void setLjz(String ljz) {
		this.ljz = ljz;
	}
	
}
