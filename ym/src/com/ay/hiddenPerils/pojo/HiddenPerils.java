package com.ay.hiddenPerils.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

//@ChineseName("干部走动隐患")
public class HiddenPerils extends BasePojo
{   
    @ChineseName("干部ID")
    private String cadresId;
    //隐患ID
	private String hiddenId;
    @ChineseName("姓名")
    private String name;
    
    @ChineseName("干部级别")
    private String cadresLevel;
    
    @ChineseName("职务")
    private String position;
    
    @ChineseName("部门")
    private String department; 
    
    @ChineseName("隐患地点")
    private String htAddress;
    
    @ChineseName("隐患点部门")
    private String htDepartment;
    
    @ChineseName("任务")
    private String task;
    
    @ChineseName("班次")
    private String shift;
    
    @ChineseName("走动日期")
    private String walkDate;
    
    @ChineseName("录入状态")
    private String state;
    
    @ChineseName("挂牌时间")
    private String listedDate;
    //隐患等级
    private String level;
    //隐患专业
    private String major;
    //隐患内容
    private String content;
    //隐患意见
    private String suggestion;
    //隐患色别
    private String color;
    //隐患联系人
    private String lsr;
    //处理期限
    private String time;
    //处理方式
    private String way;
    //隐患完成状态
    private String sta;
    //隐患Id
    private String perilsId;
    //整改措施
    private String measure;
    //整改结果
    private String report;
    //整改人
    private String people;
    
    //统计图用到发现时间字段
    private String discoveryTime;
    
    public String getDiscoveryTime()
    {
        return discoveryTime;
    }

    public void setDiscoveryTime(String discoveryTime)
    {
        this.discoveryTime = discoveryTime;
    }

    /**
     * 饼图统计所有字段
     */
    //各隐患类型条数
    private String ts;
    
    //隐患类型
    private String hiddenType;
    
    public String getTs()
    {
        return ts;
    }

    public void setTs(String ts)
    {
        this.ts = ts;
    }

    public String getHiddenType()
    {
        return hiddenType;
    }

    public void setHiddenType(String hiddenType)
    {
        this.hiddenType = hiddenType;
    }

    public String getHiddenId() {
		return hiddenId;
	}

	public void setHiddenId(String hiddenId) {
		this.hiddenId = hiddenId;
	}

	public String getMeasure() {
		return measure;
	}

	public void setMeasure(String measure) {
		this.measure = measure;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getPerilsId() {
		return perilsId;
	}

	public void setPerilsId(String perilsId) {
		this.perilsId = perilsId;
	}

	public String getSta() {
		return sta;
	}

	public void setSta(String sta) {
		this.sta = sta;
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

	public String getLsr() {
		return lsr;
	}

	public void setLsr(String lsr) {
		this.lsr = lsr;
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

	public String getCadresId()
    {
        return cadresId;
    }

    public void setCadresId(String cadresId)
    {
        this.cadresId = cadresId;
    }


    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getCadresLevel()
    {
        return cadresLevel;
    }

    public void setCadresLevel(String cadresLevel)
    {
        this.cadresLevel = cadresLevel;
    }

    public String getPosition()
    {
        return position;
    }

    public void setPosition(String position)
    {
        this.position = position;
    }

    public String getDepartment()
    {
        return department;
    }

    public void setDepartment(String department)
    {
        this.department = department;
    }

    public String getHtAddress()
    {
        return htAddress;
    }

    public void setHtAddress(String htAddress)
    {
        this.htAddress = htAddress;
    }

    public String getHtDepartment()
    {
        return htDepartment;
    }

    public void setHtDepartment(String htDepartment)
    {
        this.htDepartment = htDepartment;
    }

    public String getTask()
    {
        return task;
    }

    public void setTask(String task)
    {
        this.task = task;
    }

    public String getShift()
    {
        return shift;
    }

    public void setShift(String shift)
    {
        this.shift = shift;
    }

    public String getWalkDate()
    {
        return walkDate;
    }

    public void setWalkDate(String walkDate)
    {
        this.walkDate = walkDate;
    }

    public String getState()
    {
        return state;
    }

    public void setState(String state)
    {
        this.state = state;
    }

    public String getListedDate()
    {
        return listedDate;
    }

    public void setListedDate(String listedDate)
    {
        this.listedDate = listedDate;
    }
}
