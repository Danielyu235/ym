package com.ay.danger.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

//@ChineseName("隐患列表")
public class HiddenDanger extends BasePojo {
	
	private static final long serialVersionUID = 1L;

	@ChineseName("发现人ID")
	private String findPeople_Id;
	
	@ChineseName("发现人姓名")
	private String findPeople_Name;
	
	@ChineseName("发现人部门")
	private String findPeople_Department;
	
	@ChineseName("发现人职务")
	private String findPeople_Position;
	
	@ChineseName("发现时间")
	private String discoveryTime;
	
	@ChineseName("地点")
	private String location;
	
	@ChineseName("专业")
	private String specialty;
	
	@ChineseName("检查线路")
	private String checkLine;
	
	@ChineseName("检查地点")
	private String checkLocation;
	
	@ChineseName("检查项目")
	private String checkItem;
	
	@ChineseName("检查标准")
	private String checkLabel;
	
	@ChineseName("隐患内容")
	private String hiddenContent;
	
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
    
	//发现隐患日期中文显示
	private String specialtyType;
	
	//隐患条数月统计
	private String num;
	
	public String getNum()
    {
        return num;
    }

    public void setNum(String num)
    {
        this.num = num;
    }

    public String getSpecialtyType()
    {
        return specialtyType;
    }

    public void setSpecialtyType(String specialtyType)
    {
        this.specialtyType = specialtyType;
    }

    public String getFindPeople_Id() {
		return findPeople_Id;
	}

	public void setFindPeople_Id(String findPeopleId) {
		findPeople_Id = findPeopleId;
	}

	public String getFindPeople_Name() {
		return findPeople_Name;
	}

	public void setFindPeople_Name(String findPeopleName) {
		findPeople_Name = findPeopleName;
	}

	public String getFindPeople_Department() {
		return findPeople_Department;
	}

	public void setFindPeople_Department(String findPeopleDepartment) {
		findPeople_Department = findPeopleDepartment;
	}

	public String getFindPeople_Position() {
		return findPeople_Position;
	}

	public void setFindPeople_Position(String findPeoplePosition) {
		findPeople_Position = findPeoplePosition;
	}

	public String getDiscoveryTime() {
		return discoveryTime;
	}

	public void setDiscoveryTime(String discoveryTime) {
		this.discoveryTime = discoveryTime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getCheckLine() {
		return checkLine;
	}

	public void setCheckLine(String checkLine) {
		this.checkLine = checkLine;
	}

	public String getCheckLocation() {
		return checkLocation;
	}

	public void setCheckLocation(String checkLocation) {
		this.checkLocation = checkLocation;
	}

	public String getCheckItem() {
		return checkItem;
	}

	public void setCheckItem(String checkItem) {
		this.checkItem = checkItem;
	}

	public String getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(String checkLabel) {
		this.checkLabel = checkLabel;
	}

	public String getHiddenContent() {
		return hiddenContent;
	}

	public void setHiddenContent(String hiddenContent) {
		this.hiddenContent = hiddenContent;
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

	public String getCorrectivePeople_Id() {
		return correctivePeople_Id;
	}

	public void setCorrectivePeople_Id(String correctivePeopleId) {
		correctivePeople_Id = correctivePeopleId;
	}	
	
}
