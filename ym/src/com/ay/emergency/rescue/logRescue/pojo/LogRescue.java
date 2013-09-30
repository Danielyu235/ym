package com.ay.emergency.rescue.logRescue.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("救援预案日志")
public class LogRescue extends BasePojo {
	@ChineseName("预案Id")
	private String pid;
	@ChineseName("事故Id")
	private String aid;
	@ChineseName("指挥部Id")
	private String cid;
	@ChineseName("响应等级")
	private String level;
	@ChineseName("预案类型")
	private String ptype;
	private String levelText;
	private String time;
	public String getLevelText()
    {
        return levelText;
    }
    public void setLevelText(String levelText)
    {
        this.levelText = levelText;
    }
    public String getTime()
    {
        return time;
    }
    public void setTime(String time)
    {
        this.time = time;
    }
    public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
}
