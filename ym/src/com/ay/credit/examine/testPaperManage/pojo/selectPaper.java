package com.ay.credit.examine.testPaperManage.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("查看成绩")
public class selectPaper extends BasePojo {
	@ChineseName("试卷Id")
	private String paperId;
	@ChineseName("判断题Id")
	private String judgeIds;
	@ChineseName("多选题Id")
	private String manyIds;
	@ChineseName("单选题Id")
	private String singleIds;
	@ChineseName("单选题答案")
	private String singleAnswer;
	@ChineseName("多选题答案")
	private String manyAnswer;
	@ChineseName("判断题答案")
	private String judgeAnswer;
	@ChineseName("得分")
	private String scores;
	@ChineseName("试卷总分")
	private String paperscores;
	@ChineseName("用户")
	private String username;
	private String sysuser;
	private String time;
	//试卷名称
	private String paperName;
	
	private String examTime;
	
	private String done;
    private String dtwo;
    //工号
    private String employeeName;
    //员工专业
    private String major;
    //员工岗位
    private String post;
    
	public String getExamTime()
    {
        return examTime;
    }
    public void setExamTime(String examTime)
    {
        this.examTime = examTime;
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
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getSysuser() {
		return sysuser;
	}
	public void setSysuser(String sysuser) {
		this.sysuser = sysuser;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public String getJudgeIds() {
		return judgeIds;
	}
	public void setJudgeIds(String judgeIds) {
		this.judgeIds = judgeIds;
	}
	public String getManyIds() {
		return manyIds;
	}
	public void setManyIds(String manyIds) {
		this.manyIds = manyIds;
	}
	public String getSingleIds() {
		return singleIds;
	}
	public void setSingleIds(String singleIds) {
		this.singleIds = singleIds;
	}
	public String getSingleAnswer() {
		return singleAnswer;
	}
	public void setSingleAnswer(String singleAnswer) {
		this.singleAnswer = singleAnswer;
	}
	public String getManyAnswer() {
		return manyAnswer;
	}
	public void setManyAnswer(String manyAnswer) {
		this.manyAnswer = manyAnswer;
	}
	public String getJudgeAnswer() {
		return judgeAnswer;
	}
	public void setJudgeAnswer(String judgeAnswer) {
		this.judgeAnswer = judgeAnswer;
	}
	public String getScores() {
		return scores;
	}
	public void setScores(String scores) {
		this.scores = scores;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPaperscores() {
		return paperscores;
	}
	public void setPaperscores(String paperscores) {
		this.paperscores = paperscores;
	}
	
}
