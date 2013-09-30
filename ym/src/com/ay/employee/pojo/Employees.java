package com.ay.employee.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("员工基本信息")
public class Employees extends BasePojo {
	@ChineseName("工号")
	private String jobNum;
	@ChineseName("姓名")
	private String name;
	@ChineseName("性别")
	private String gender;
	@ChineseName("身份证号")
	private String idnumber;
	@ChineseName("民族")
	private String nation;
	@ChineseName("出生年月")
	private String dataOfBirth;
	@ChineseName("家庭住址")
	private String homeAddress;
	@ChineseName("学历")
	private String education;
	@ChineseName("参工时间")
	private String workTime;
	@ChineseName("先单位")
	private String unit;
	@ChineseName("增减工龄")
	private String lenOfService;
	@ChineseName("工别")
	private String workersNo;
	@ChineseName("工种")
	private String workType;
	@ChineseName("技能")
	private String skill;
	@ChineseName("岗位")
	private String post;
	@ChineseName("独生")
	private String only;
	@ChineseName("养老")
	private String aged;
	@ChineseName("医保")
	private String medical;
	@ChineseName("档案号")
	private String fillNo;
	@ChineseName("本人成份")
	private String composition;
	@ChineseName("籍贯")
	private String homeTown;
	@ChineseName("户口所在地")
	private String permanentResidence;
	@ChineseName("入局时间")
	private String bureauTime;
	@ChineseName("合同期限")
	private String contractPeriod;
	@ChineseName("合同开始时间")
	private String contractStatusTime;
	@ChineseName("政治面貌")
	private String politicalStatus;
	@ChineseName("职别")
	private String officialRank;
	@ChineseName("合同结束时间")
	private String contractConclusionTime;
	@ChineseName("是否班组长")
	private String sfbzz;
	@ChineseName("入职时间")
	private String rzsj;
	@ChineseName("单位编号")
	private String dwbh;
	@ChineseName("血型")
	private String bloodType;
	@ChineseName("入党团时间")
	private String partyTime;
	@ChineseName("身体状况")
	private String physiclalStatus;
	@ChineseName("第二职业")
	private String secondaryOccupation;
	@ChineseName("性格特征")
	private String characterTrait;
	@ChineseName("宗教信仰")
	private String religion;
	@ChineseName("业务活动")
	private String leisureActivities;
	@ChineseName("军龄")
	private String militaryLen;
	@ChineseName("下乡")
	private String countryside;
	@ChineseName("待业")
	private String waitForEmployment;
	@ChineseName("人员性质")
	private String personnelQuality;
	@ChineseName("上岗证")
	private String workLicense;
	@ChineseName("是否管理人员")
	private String sfglry;
	@ChineseName("岗位职务")
	private String position;
	@ChineseName("手机号码")
	private String cellphoneNumber;
	@ChineseName("私家车牌号")
	private String plateNumber;
	@ChineseName("亲属姓名")
	private String relativesName;
	@ChineseName("与本人关系")
	private String relations;
	@ChineseName("亲属手机号码")
	private String relativesCellphoneNumber;
	@ChineseName("卡号")
	private String cardNumber;
	@ChineseName("照片")
	private String passport;
	//所在部门
	private String done;
	private String dtwo;
	@ChineseName("专业")
	private String major;
	@ChineseName("座机号码")
	private String phoneNumber;
	
	private String postName;
	private String genderName;
	private String majorName;
	private String doneName;
	private String dtwoName;
	
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getGenderName() {
		return genderName;
	}
	public void setGenderName(String genderName) {
		this.genderName = genderName;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
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
	public String getContractConclusionTime() {
		return contractConclusionTime;
	}
	public void setContractConclusionTime(String contractConclusionTime) {
		this.contractConclusionTime = contractConclusionTime;
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
	public String getIdnumber() {
		return idnumber;
	}
	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getDataOfBirth() {
		return dataOfBirth;
	}
	public void setDataOfBirth(String dataOfBirth) {
		this.dataOfBirth = dataOfBirth;
	}
	public String getHomeAddress() {
		return homeAddress;
	}
	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getLenOfService() {
		return lenOfService;
	}
	public void setLenOfService(String lenOfService) {
		this.lenOfService = lenOfService;
	}
	public String getWorkersNo() {
		return workersNo;
	}
	public void setWorkersNo(String workersNo) {
		this.workersNo = workersNo;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getOnly() {
		return only;
	}
	public void setOnly(String only) {
		this.only = only;
	}
	public String getAged() {
		return aged;
	}
	public void setAged(String aged) {
		this.aged = aged;
	}
	public String getMedical() {
		return medical;
	}
	public void setMedical(String medical) {
		this.medical = medical;
	}
	public String getFillNo() {
		return fillNo;
	}
	public void setFillNo(String fillNo) {
		this.fillNo = fillNo;
	}
	public String getComposition() {
		return composition;
	}
	public void setComposition(String composition) {
		this.composition = composition;
	}
	public String getHomeTown() {
		return homeTown;
	}
	public void setHomeTown(String homeTown) {
		this.homeTown = homeTown;
	}
	public String getPermanentResidence() {
		return permanentResidence;
	}
	public void setPermanentResidence(String permanentResidence) {
		this.permanentResidence = permanentResidence;
	}
	public String getBureauTime() {
		return bureauTime;
	}
	public void setBureauTime(String bureauTime) {
		this.bureauTime = bureauTime;
	}
	public String getContractPeriod() {
		return contractPeriod;
	}
	public void setContractPeriod(String contractPeriod) {
		this.contractPeriod = contractPeriod;
	}
	public String getContractStatusTime() {
		return contractStatusTime;
	}
	public void setContractStatusTime(String contractStatusTime) {
		this.contractStatusTime = contractStatusTime;
	}
	public String getPoliticalStatus() {
		return politicalStatus;
	}
	public void setPoliticalStatus(String politicalStatus) {
		this.politicalStatus = politicalStatus;
	}
	public String getOfficialRank() {
		return officialRank;
	}
	public void setOfficialRank(String officialRank) {
		this.officialRank = officialRank;
	}
	public String getSfbzz() {
		return sfbzz;
	}
	public void setSfbzz(String sfbzz) {
		this.sfbzz = sfbzz;
	}
	public String getRzsj() {
		return rzsj;
	}
	public void setRzsj(String rzsj) {
		this.rzsj = rzsj;
	}
	public String getDwbh() {
		return dwbh;
	}
	public void setDwbh(String dwbh) {
		this.dwbh = dwbh;
	}
	public String getBloodType() {
		return bloodType;
	}
	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}
	public String getPartyTime() {
		return partyTime;
	}
	public void setPartyTime(String partyTime) {
		this.partyTime = partyTime;
	}
	public String getPhysiclalStatus() {
		return physiclalStatus;
	}
	public void setPhysiclalStatus(String physiclalStatus) {
		this.physiclalStatus = physiclalStatus;
	}
	public String getSecondaryOccupation() {
		return secondaryOccupation;
	}
	public void setSecondaryOccupation(String secondaryOccupation) {
		this.secondaryOccupation = secondaryOccupation;
	}
	public String getCharacterTrait() {
		return characterTrait;
	}
	public void setCharacterTrait(String characterTrait) {
		this.characterTrait = characterTrait;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getLeisureActivities() {
		return leisureActivities;
	}
	public void setLeisureActivities(String leisureActivities) {
		this.leisureActivities = leisureActivities;
	}
	public String getMilitaryLen() {
		return militaryLen;
	}
	public void setMilitaryLen(String militaryLen) {
		this.militaryLen = militaryLen;
	}
	public String getCountryside() {
		return countryside;
	}
	public void setCountryside(String countryside) {
		this.countryside = countryside;
	}
	public String getWaitForEmployment() {
		return waitForEmployment;
	}
	public void setWaitForEmployment(String waitForEmployment) {
		this.waitForEmployment = waitForEmployment;
	}
	public String getPersonnelQuality() {
		return personnelQuality;
	}
	public void setPersonnelQuality(String personnelQuality) {
		this.personnelQuality = personnelQuality;
	}
	public String getWorkLicense() {
		return workLicense;
	}
	public void setWorkLicense(String workLicense) {
		this.workLicense = workLicense;
	}
	public String getSfglry() {
		return sfglry;
	}
	public void setSfglry(String sfglry) {
		this.sfglry = sfglry;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getCellphoneNumber() {
		return cellphoneNumber;
	}
	public void setCellphoneNumber(String cellphoneNumber) {
		this.cellphoneNumber = cellphoneNumber;
	}
	public String getPlateNumber() {
		return plateNumber;
	}
	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}
	public String getRelativesName() {
		return relativesName;
	}
	public void setRelativesName(String relativesName) {
		this.relativesName = relativesName;
	}
	public String getRelations() {
		return relations;
	}
	public void setRelations(String relations) {
		this.relations = relations;
	}
	public String getRelativesCellphoneNumber() {
		return relativesCellphoneNumber;
	}
	public void setRelativesCellphoneNumber(String relativesCellphoneNumber) {
		this.relativesCellphoneNumber = relativesCellphoneNumber;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String passport) {
		this.passport = passport;
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
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
}
