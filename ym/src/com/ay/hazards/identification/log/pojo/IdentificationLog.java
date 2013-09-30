package com.ay.hazards.identification.log.pojo;

import java.util.Date;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
/**
 * 重大危险源辨识日志
 * @author zhangxiang
 * 2013-04-18
 */
//@ChineseName("危险源辨识日志")
public class IdentificationLog extends BasePojo {
	public IdentificationLog(){
		super();
	}
	public IdentificationLog(String created,Date createTime,String dwdm,String corpName,
			String hazardsId,String hazardsName,String hazardsType,String info,String reason,String logDate){
		super();
		super.setCreated(created);
		super.setCreateTime(createTime);
		this.setDwdm(dwdm);
		this.setCorpName(corpName);
		this.setHazardsId(hazardsId);
		this.setHazardsName(hazardsName);
		this.setHazardsType(hazardsType);
		this.setInfo(info);
		this.setReason(reason);
		this.setLogDate(logDate);
	}
	@ChineseName("辨识时间")
	private String logDate;
	@ChineseName("单位代码")
	private String dwdm;
	@ChineseName("所属单位")
	private String corpName;
	@ChineseName("危险源ID")
	private String hazardsId;
	@ChineseName("危险源名称")
	private String hazardsName;
	@ChineseName("危险源类型")
	private String hazardsType;
	@ChineseName("辨识信息")
	private String info;
	@ChineseName("原因")
	private String reason;
	public String getDwdm() {
		return dwdm;
	}
	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public String getHazardsId() {
		return hazardsId;
	}
	public void setHazardsId(String hazardsId) {
		this.hazardsId = hazardsId;
	}
	public String getHazardsName() {
		return hazardsName;
	}
	public void setHazardsName(String hazardsName) {
		this.hazardsName = hazardsName;
	}
	public String getHazardsType() {
		return hazardsType;
	}
	public void setHazardsType(String hazardsType) {
		this.hazardsType = hazardsType;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getLogDate() {
		return logDate;
	}
	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}
	
}
