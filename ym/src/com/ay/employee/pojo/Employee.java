package com.ay.employee.pojo;

import com.ay.framework.core.pojo.BasePojo;

//@ChineseName("员工基本信息")
public class Employee extends BasePojo {
	
	private static final long serialVersionUID = -3424818755981607689L;

	//员工号
	private String jobNum;
	
	//员工姓名
	private String name;
	
	//性别
	private String gender;
	private String genderName;
	
	//证件照
	private String passport;
	
	//出生年月
	private String dateOfBirth;
	
	//文化程度
	private String education;
	
	//参加工作时间
	private String workTime;
	
	//调入单位时间
	private String transferTime;
	
	//所在部门
	private String done;
	private String dtwo;
	
	//所在部门-中文
	private String doneName;
	private String dtwoName;
	
	//专业
	private String major;
	
	//专业-中文
	private String majorName;
	
	//岗位
	private String post;
	
	//岗位-中文
	private String postName;
	
	//籍贯
	private String homeTown;
	
	//家庭住址
	private String homeAddress;
	
	//身份证号
	private String idNumber;
	
	//手机号码
	private String cellPhoneNumber;
	
	//电话号码
	private String phoneNumber;
	
	//加盐字段，在触发器中使用，在表中无实际用途
	private String salt;
    
	
	private  String first;
	
	public String getFirst()
    {
        return first;
    }

    public void setFirst(String first)
    {
        this.first = first;
    }

    public String getJobNum() {
		return jobNum;
	}

	public void setJobNum(String jobNum) {
		this.jobNum = jobNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getTransferTime() {
		return transferTime;
	}

	public void setTransferTime(String transferTime) {
		this.transferTime = transferTime;
	}	

	public String getDone() {
		return done;
	}

	public void setDone(String done) {
		this.done = done;
	}

	public String getDtwo() {
		return dtwo;
	}

	public void setDtwo(String dtwo) {
		this.dtwo = dtwo;
	}

	public String getDoneName() {
		return doneName;
	}

	public void setDoneName(String doneName) {
		this.doneName = doneName;
	}

	public String getDtwoName() {
		return dtwoName;
	}

	public void setDtwoName(String dtwoName) {
		this.dtwoName = dtwoName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getHomeTown() {
		return homeTown;
	}

	public void setHomeTown(String homeTown) {
		this.homeTown = homeTown;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getCellPhoneNumber() {
		return cellPhoneNumber;
	}

	public void setCellPhoneNumber(String cellPhoneNumber) {
		this.cellPhoneNumber = cellPhoneNumber;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getGenderName() {
		return genderName;
	}

	public void setGenderName(String genderName) {
		this.genderName = genderName;
	}

	
}
