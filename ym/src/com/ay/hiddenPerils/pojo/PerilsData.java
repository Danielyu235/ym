package com.ay.hiddenPerils.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("添加隐患")
public class PerilsData extends BasePojo {
	@ChineseName("隐患Id")
	private String hiddenId;
	@ChineseName("隐患等级")
	private String level;
	@ChineseName("隐患专业")
	private String major;
	@ChineseName("整改内容")
	private String content;
	@ChineseName("整改意见")
	private String suggestion;
	@ChineseName("色别")
	private String color;
	@ChineseName("落实人部门")
	private String dep;
	@ChineseName("落实人名称")
	private String lsr;
	@ChineseName("落实人联系方式")
	private String tel;
	@ChineseName("处理期限")
	private String time;
	@ChineseName("处理方式")
	private String way;
	public String getHiddenId() {
		return hiddenId;
	}
	public void setHiddenId(String hiddenId) {
		this.hiddenId = hiddenId;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getLsr() {
		return lsr;
	}
	public void setLsr(String lsr) {
		this.lsr = lsr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
}
