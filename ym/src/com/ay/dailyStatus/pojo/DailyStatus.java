package com.ay.dailyStatus.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/**
 * 人员日常状态实体类
 * @author yuzhou
 * 2013年6月3日 
 */
//@ChineseName("人员日常状态")
public class DailyStatus extends BasePojo
{   
    @ChineseName("时间")
    private String time;
    
    @ChineseName("地点")
    private String address;
    
    @ChineseName("谈话人")
    private String speaker;
    
    @ChineseName("被谈话人")
    private String employeeid;
    
    private String employeeName;
    
    @ChineseName("不放心人员类型")
    private String personType;
    
    @ChineseName("谈话事由")
    private String talkReason;
    
    @ChineseName("谈话内容")
    private String conversation;
    
    @ChineseName("谈话效果")
    private String effect;
    
    private String personTypeText;
    
    private String done;
    private String dtwo;
  //工号
    private String jobNum;
    //员工姓名
    private String name;
    //员工专业
    private String major;
    //员工岗位
    private String post;
    
    private int count;
    
    
    public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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

	public String getTime()
    {
        return time;
    }

    public void setTime(String time)
    {
        this.time = time;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getSpeaker()
    {
        return speaker;
    }

    public void setSpeaker(String speaker)
    {
        this.speaker = speaker;
    }

    public String getEmployeeid()
    {
        return employeeid;
    }

    public void setEmployeeid(String employeeid)
    {
        this.employeeid = employeeid;
    }

    public String getPersonType()
    {
        return personType;
    }

    public void setPersonType(String personType)
    {
        this.personType = personType;
    }

    public String getTalkReason()
    {
        return talkReason;
    }

    public void setTalkReason(String talkReason)
    {
        this.talkReason = talkReason;
    }

    public String getConversation()
    {
        return conversation;
    }

    public void setConversation(String conversation)
    {
        this.conversation = conversation;
    }

    public String getEffect()
    {
        return effect;
    }

    public void setEffect(String effect)
    {
        this.effect = effect;
    }

	public String getPersonTypeText() {
		return personTypeText;
	}

	public void setPersonTypeText(String personTypeText) {
		this.personTypeText = personTypeText;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
    
}
