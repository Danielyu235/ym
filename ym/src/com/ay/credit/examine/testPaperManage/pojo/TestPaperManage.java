package com.ay.credit.examine.testPaperManage.pojo;

import java.util.List;

import com.ay.credit.examine.questionManage.pojo.QuestionCredit;
import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
/**
 * 试卷管理实体类
 * @author zhangxiang
 * 2013-06-24
 */
//@ChineseName("试卷管理")
public class TestPaperManage extends BasePojo {
	@ChineseName("专业类型")
	private String majorTypeId;
	private String majorTypeName;
	@ChineseName("试卷名称")
	private String paperName;
	@ChineseName("考试时间")
	private String paperTime;
	@ChineseName("试卷分数")
	private String paperScore;
	@ChineseName("单选题分数")
	private String singleScore;
	@ChineseName("单选题id集")
	private String singleIds;
	@ChineseName("多选题分数")
	private String manyScore;
	@ChineseName("多选题id集")
	private String manyIds;
	@ChineseName("判断题分数")
	private String judgeScore;
	@ChineseName("判断题id集")
	private String judgeIds;
	@ChineseName("试题类型")
	private String testType;
	//试卷题目数量
	private String countNum;
	private String jugeNum;
	private String manyNum;
	private String singleNum;
	//试题数据
	private List<QuestionCredit> list;
	private List<selectPaper> listPaper;
	
	public List<selectPaper> getListPaper() {
		return listPaper;
	}
	public void setListPaper(List<selectPaper> listPaper) {
		this.listPaper = listPaper;
	}
	public List<QuestionCredit> getList() {
		return list;
	}
	public void setList(List<QuestionCredit> list) {
		this.list = list;
	}
	
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public String getPaperTime() {
		return paperTime;
	}
	public void setPaperTime(String paperTime) {
		this.paperTime = paperTime;
	}
	public String getPaperScore() {
		return paperScore;
	}
	public void setPaperScore(String paperScore) {
		this.paperScore = paperScore;
	}
	public String getSingleScore() {
		return singleScore;
	}
	public void setSingleScore(String singleScore) {
		this.singleScore = singleScore;
	}
	public String getSingleIds() {
		return singleIds;
	}
	public void setSingleIds(String singleIds) {
		this.singleIds = singleIds;
	}
	public String getManyScore() {
		return manyScore;
	}
	public void setManyScore(String manyScore) {
		this.manyScore = manyScore;
	}
	public String getManyIds() {
		return manyIds;
	}
	public void setManyIds(String manyIds) {
		this.manyIds = manyIds;
	}
	public String getJudgeScore() {
		return judgeScore;
	}
	public void setJudgeScore(String judgeScore) {
		this.judgeScore = judgeScore;
	}
	public String getJudgeIds() {
		return judgeIds;
	}
	public void setJudgeIds(String judgeIds) {
		this.judgeIds = judgeIds;
	}
	public String getMajorTypeId() {
		return majorTypeId;
	}
	public void setMajorTypeId(String majorTypeId) {
		this.majorTypeId = majorTypeId;
	}
	public String getMajorTypeName() {
		return majorTypeName;
	}
	public void setMajorTypeName(String majorTypeName) {
		this.majorTypeName = majorTypeName;
	}
	public String getCountNum() {
		return countNum;
	}
	public void setCountNum(String countNum) {
		this.countNum = countNum;
	}
	public String getJugeNum() {
		return jugeNum;
	}
	public void setJugeNum(String jugeNum) {
		this.jugeNum = jugeNum;
	}
	public String getManyNum() {
		return manyNum;
	}
	public void setManyNum(String manyNum) {
		this.manyNum = manyNum;
	}
	public String getSingleNum() {
		return singleNum;
	}
	public void setSingleNum(String singleNum) {
		this.singleNum = singleNum;
	}
	public String getTestType() {
		return testType;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
	
}
