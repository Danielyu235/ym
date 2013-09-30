package com.ay.credit.examine.questionManage.pojo;

import java.util.List;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
/**
 * 题目信息实体类
 * @author zhangxiang
 *2013-05-16
 */
//@ChineseName("题目信息")
public class QuestionCredit extends BasePojo {
	
	@ChineseName("题目类型Id")
	private String qsTypeId;
	//现实题目类型中文
	@PersistenceIgnore
	private String qsTypeName;
	@ChineseName("岗位类型Id")
	private String quartersTypeId;
	//岗位类型中文
	@PersistenceIgnore
	private String quartersTypeName;
	@ChineseName("题目问题")
	private String qsName;
	@ChineseName("题目选项A")
	private String optionA;
	@ChineseName("题目选项B")
	private String optionB;
	@ChineseName("题目选项C")
	private String optionC;
	@ChineseName("题目选项D")
	private String optionD;
	@ChineseName("题目选项E")
	private String optionE;
	@ChineseName("题目答案")
	private String qsAnswer;
	@ChineseName("命卷人")
	private String qsUser;
	@ChineseName("备注")
	private String remarks;
	
	public String getQsTypeId() {
		return qsTypeId;
	}
	public void setQsTypeId(String qsTypeId) {
		this.qsTypeId = qsTypeId;
	}
	public String getQsName() {
		return qsName;
	}
	public void setQsName(String qsName) {
		this.qsName = qsName;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getOptionE() {
		return optionE;
	}
	public void setOptionE(String optionE) {
		this.optionE = optionE;
	}
	public String getQsAnswer() {
		return qsAnswer;
	}
	public void setQsAnswer(String qsAnswer) {
		this.qsAnswer = qsAnswer;
	}
	public String getQsUser() {
		return qsUser;
	}
	public void setQsUser(String qsUser) {
		this.qsUser = qsUser;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getQsTypeName() {
		return qsTypeName;
	}
	public void setQsTypeName(String qsTypeName) {
		this.qsTypeName = qsTypeName;
	}
	public String getQuartersTypeId() {
		return quartersTypeId;
	}
	public void setQuartersTypeId(String quartersTypeId) {
		this.quartersTypeId = quartersTypeId;
	}
	public String getQuartersTypeName() {
		return quartersTypeName;
	}
	public void setQuartersTypeName(String quartersTypeName) {
		this.quartersTypeName = quartersTypeName;
	}
	
	
}
