package com.ay.attend.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

//@ChineseName("员工考勤与奖罚")
public class AttendReward extends BasePojo
{   
    @ChineseName("员工工号")
    private String employeeId;
    private String employeeName;
    
    @ChineseName("记录时间")
    private String jlTime;
    
    @ChineseName("考勤状况")
    private String attend;
    
    @ChineseName("奖惩情况")
    private String reward;
    
    @ChineseName("奖惩原因")
    private String rewardReason;


    //工号
    private String jobNum;
    //员工姓名
    private String name;
    //员工专业
    private String major;
    //员工岗位
    private String post;
  //部门
	private String done;
	private String dtwo;
	
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
    
    public String getEmployeeId()
    {
        return employeeId;
    }

    public void setEmployeeId(String employeeId)
    {
        this.employeeId = employeeId;
    }

    public String getJlTime()
    {
        return jlTime;
    }

    public void setJlTime(String jlTime)
    {
        this.jlTime = jlTime;
    }

    public String getAttend()
    {
        return attend;
    }

    public void setAttend(String attend)
    {
        this.attend = attend;
    }

    public String getReward()
    {
        return reward;
    }

    public void setReward(String reward)
    {
        this.reward = reward;
    }

    public String getRewardReason()
    {
        return rewardReason;
    }

    public void setRewardReason(String rewardReason)
    {
        this.rewardReason = rewardReason;
    }

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}


}
