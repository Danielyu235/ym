package com.ay.safe.punish.pojo;

import com.ay.framework.core.pojo.BasePojo;

//日常三违处罚
public class PunishSafe extends BasePojo {
	
	private static final long serialVersionUID = 1L;

	//被罚款人ID
	private String bfkrid;
	
	//被罚款人姓名
	private String bfkrname;
	
	//被罚款人工号
	private String bfkrjobnum;
	
	//被罚款人岗位
	private String bfkrpost;
	
	//被罚款人专业
	private String bfkrmajor;
	
	//被罚款人部门1
	private String bfkrdone;
	
	//被罚款人部门2
	private String bfkrdtwo;
	
	//被罚款人身份证号码
	private String bfkridnumber;
	
	//罚款时间
	private String fksj;
	
	//罚款班次
	private String fkbc;
	
	//罚款金额
	private String fkje;
	
	//地点
	private String dd;
	
	//事因
	private String sy;
	
	//处罚人ID
	private String cfrid;
	
	//处罚人姓名
	private String cfrname;
	
	//罚款类型
	private String fklx;
	
	//罚款项目
	private String fkmx;

	public String getBfkridnumber() {
		return bfkridnumber;
	}

	public void setBfkridnumber(String bfkridnumber) {
		this.bfkridnumber = bfkridnumber;
	}

	public String getBfkrjobnum() {
		return bfkrjobnum;
	}

	public void setBfkrjobnum(String bfkrjobnum) {
		this.bfkrjobnum = bfkrjobnum;
	}

	public String getBfkrid() {
		return bfkrid;
	}

	public void setBfkrid(String bfkrid) {
		this.bfkrid = bfkrid;
	}

	public String getFksj() {
		return fksj;
	}

	public void setFksj(String fksj) {
		this.fksj = fksj;
	}

	public String getFkbc() {
		return fkbc;
	}

	public void setFkbc(String fkbc) {
		this.fkbc = fkbc;
	}

	public String getFkje() {
		return fkje;
	}

	public void setFkje(String fkje) {
		this.fkje = fkje;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getSy() {
		return sy;
	}

	public void setSy(String sy) {
		this.sy = sy;
	}

	public String getCfrid() {
		return cfrid;
	}

	public void setCfrid(String cfrid) {
		this.cfrid = cfrid;
	}

	public String getFklx() {
		return fklx;
	}

	public void setFklx(String fklx) {
		this.fklx = fklx;
	}

	public String getFkmx() {
		return fkmx;
	}

	public void setFkmx(String fkmx) {
		this.fkmx = fkmx;
	}

	public String getBfkrname() {
		return bfkrname;
	}

	public void setBfkrname(String bfkrname) {
		this.bfkrname = bfkrname;
	}

	public String getBfkrpost() {
		return bfkrpost;
	}

	public void setBfkrpost(String bfkrpost) {
		this.bfkrpost = bfkrpost;
	}

	public String getBfkrmajor() {
		return bfkrmajor;
	}

	public void setBfkrmajor(String bfkrmajor) {
		this.bfkrmajor = bfkrmajor;
	}

	public String getBfkrdone() {
		return bfkrdone;
	}

	public void setBfkrdone(String bfkrdone) {
		this.bfkrdone = bfkrdone;
	}

	public String getBfkrdtwo() {
		return bfkrdtwo;
	}

	public void setBfkrdtwo(String bfkrdtwo) {
		this.bfkrdtwo = bfkrdtwo;
	}

	public String getCfrname() {
		return cfrname;
	}

	public void setCfrname(String cfrname) {
		this.cfrname = cfrname;
	}	
	
}
