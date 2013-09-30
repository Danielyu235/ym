package com.ay.scoremanagement.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/**
 *	@描述：评分管理模块POJO
 *	@包名：com.ay.scoremanagement.pojo
 *	@类名：ScoreManagement.java
 *	@日期：2013-6-25
 *	@版权：Copyright ®安元科技. All right reserved. 
 *	@作者：闵琨
 */
//@ChineseName("评分管理")
public class ScoreManagement extends BasePojo {	
	
	private static final long serialVersionUID = 1L;

	@ChineseName("安全教育考核占分数比例")
	private String sp;
	
	@ChineseName("人员职业健康扣分数")
	private String hs;
	
	@ChineseName("人员职业健康占分数比例")
	private String hp;
	
	@ChineseName("日常三违处罚扣分数")
	private String ps;
	
	@ChineseName("日常三违处罚占分数比例")
	private String pp;
	
	@ChineseName("人员日常状态扣分数")
	private String ds;
	
	@ChineseName("人员日常状态占分数比例")
	private String dp;
	
	@ChineseName("人员日常考勤与奖罚-迟到扣分数")
	private String rls;
	
	@ChineseName("人员日常考勤与奖罚-旷工扣分数")
	private String ras;
	
	@ChineseName("人员日常考勤与奖罚-惩罚扣分数")
	private String rps;
	
	@ChineseName("人员日常考勤与奖罚-奖励扣分数")
	private String rrs;
	
	@ChineseName("人员日常考勤与奖罚占分数比例")
	private String rp;

	public String getSp() {
		return sp;
	}

	public void setSp(String sp) {
		this.sp = sp;
	}

	public String getHs() {
		return hs;
	}

	public void setHs(String hs) {
		this.hs = hs;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getPs() {
		return ps;
	}

	public void setPs(String ps) {
		this.ps = ps;
	}

	public String getPp() {
		return pp;
	}

	public void setPp(String pp) {
		this.pp = pp;
	}

	public String getDs() {
		return ds;
	}

	public void setDs(String ds) {
		this.ds = ds;
	}

	public String getDp() {
		return dp;
	}

	public void setDp(String dp) {
		this.dp = dp;
	}

	public String getRls() {
		return rls;
	}

	public void setRls(String rls) {
		this.rls = rls;
	}

	public String getRas() {
		return ras;
	}

	public void setRas(String ras) {
		this.ras = ras;
	}

	public String getRps() {
		return rps;
	}

	public void setRps(String rps) {
		this.rps = rps;
	}

	public String getRrs() {
		return rrs;
	}

	public void setRrs(String rrs) {
		this.rrs = rrs;
	}

	public String getRp() {
		return rp;
	}

	public void setRp(String rp) {
		this.rp = rp;
	}

	@Override
	public String toString() {
		return "ScoreManagement [dp=" + dp + ", ds=" + ds + ", hp=" + hp
				+ ", hs=" + hs + ", pp=" + pp + ", ps=" + ps + ", ras=" + ras
				+ ", rls=" + rls + ", rp=" + rp + ", rps=" + rps + ", rrs="
				+ rrs + ", sp=" + sp + "]";
	}
	
}
