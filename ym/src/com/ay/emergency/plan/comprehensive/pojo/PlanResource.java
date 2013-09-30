package com.ay.emergency.plan.comprehensive.pojo;

import java.util.List;

import com.ay.framework.core.pojo.BasePojo;
/***
 * 综合预案与救援资源关联实体类
 * @author zhangxiang
 * @version 2013-03-12
 */
public class PlanResource extends BasePojo {
	
    
    private String accidentId;
	//救援资源类型
	private String type;
	
	//救援资源名称
	private String name;
	
	//救援资源ID
	private String resId;
	List<PlanResource> listRes;
	
	public List<PlanResource> getListRes() {
		return listRes;
	}public void setListRes(List<PlanResource> listRes) {
		this.listRes = listRes;
	}
	public String getAccidentId()
    {
        return accidentId;
    }

    public void setAccidentId(String accidentId)
    {
        this.accidentId = accidentId;
    }

    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}
	
}
