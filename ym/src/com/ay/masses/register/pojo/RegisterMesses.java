package com.ay.masses.register.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.MultiLineField;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("群众登记")
public class RegisterMesses extends BasePojo {
	@ChineseName("隐患所在单位")
	private String theUnit;
	@ChineseName("发现时间")
	private String registerTime;
	@ChineseName("隐患地点")
	private String place;
	@ChineseName("发现单位")
	private String foundUnit;
	@ChineseName("发现人")
	private String find;
	@ChineseName("职务")
	private String post;
	@ChineseName("隐患内容")
	@MultiLineField
	private String content;
	
	@ChineseName("隐患类型")
	private String hiddenType;
	
	@ChineseName("三色单")
	private String threeColorForm;
	
	@ChineseName("整改措施")
	private String measure;
	
	@ChineseName("整改人ID")
	private String correctivePeople_Id;
	
	@ChineseName("整改人")
	private String correctivePeople;
	
	@ChineseName("整改人单位")
	private String correctivePeopleUnits;
	
	@ChineseName("整改人姓名")
	private String correctivePeopleName;
	
	@ChineseName("整改期限")
	private String deadline;
	
	@ChineseName("整改结果")
	private String correctionReport;
	
	@ChineseName("完成时间")
	private String completionTime;
	
	@ChineseName("跟踪落实")
	private String followUp;
	@ChineseName("状态")
	private String state;
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTheUnit() {
		return theUnit;
	}
	public void setTheUnit(String theUnit) {
		this.theUnit = theUnit;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getFoundUnit() {
		return foundUnit;
	}
	public void setFoundUnit(String foundUnit) {
		this.foundUnit = foundUnit;
	}
	public String getFind() {
		return find;
	}
	public void setFind(String find) {
		this.find = find;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHiddenType() {
		return hiddenType;
	}
	public void setHiddenType(String hiddenType) {
		this.hiddenType = hiddenType;
	}
	public String getThreeColorForm() {
		return threeColorForm;
	}
	public void setThreeColorForm(String threeColorForm) {
		this.threeColorForm = threeColorForm;
	}
	public String getMeasure() {
		return measure;
	}
	public void setMeasure(String measure) {
		this.measure = measure;
	}
	public String getCorrectivePeople_Id() {
		return correctivePeople_Id;
	}
	public void setCorrectivePeople_Id(String correctivePeopleId) {
		correctivePeople_Id = correctivePeopleId;
	}
	public String getCorrectivePeople() {
		return correctivePeople;
	}
	public void setCorrectivePeople(String correctivePeople) {
		this.correctivePeople = correctivePeople;
	}
	public String getCorrectivePeopleUnits() {
		return correctivePeopleUnits;
	}
	public void setCorrectivePeopleUnits(String correctivePeopleUnits) {
		this.correctivePeopleUnits = correctivePeopleUnits;
	}
	public String getCorrectivePeopleName() {
		return correctivePeopleName;
	}
	public void setCorrectivePeopleName(String correctivePeopleName) {
		this.correctivePeopleName = correctivePeopleName;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getCorrectionReport() {
		return correctionReport;
	}
	public void setCorrectionReport(String correctionReport) {
		this.correctionReport = correctionReport;
	}
	public String getCompletionTime() {
		return completionTime;
	}
	public void setCompletionTime(String completionTime) {
		this.completionTime = completionTime;
	}
	public String getFollowUp() {
		return followUp;
	}
	public void setFollowUp(String followUp) {
		this.followUp = followUp;
	}

	
}
