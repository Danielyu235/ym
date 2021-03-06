package com.ay.framework.core.pojo;

import java.util.Date;

/**
 * 基础的Pojo类主要实现ID.
 * 
 * 增加添加人的部门信息
 *
 * @DateTime: 2012-9-10
 * @author lushigai
 * @author zxy
 * @version 2.0
 */
@SuppressWarnings("serial")
public class BasePojo implements IdEntity
{
      
    /** 实体标识. */
    private String id;

	/** 删除标识 */
	private String status;
	
	/** 创建人 */
	private String created;
	
	/** 创建者部门IDS */
	private String createdDept;
	
	/** 创建时间 */
	private Date createTime;
	
	/** 更新人 */
	private String updated;
	
	/** 更新时间 */
	private Date updateTime;
	
    /* (non-Javadoc)
     * @see com.fh.iasp.platform.core.pojo.IdEntity#getId()
     */
    public String getId()
    {
        return id;
    }

    /* (non-Javadoc)
     * @see com.fh.iasp.platform.core.pojo.IdEntity#setId(java.lang.String)
     */
    public void setId(String id)
    {
        this.id = id;
    }
    
    public String getStatus() {
  		return status;
  	}

  	public void setStatus(String status) {
  		this.status = status;
  	}

  	public String getCreated() {
  		return created;
  	}

  	public void setCreated(String created) {
  		this.created = created;
  	}

  	public Date getCreateTime() {
  		return createTime;
  	}

  	public void setCreateTime(Date createTime) {
  		this.createTime = createTime;
  	}

  	public String getUpdated() {
  		return updated;
  	}

  	public void setUpdated(String updated) {
  		this.updated = updated;
  	}

  	public Date getUpdateTime() {
  		return updateTime;
  	}

  	public void setUpdateTime(Date updateTime) {
  		this.updateTime = updateTime;
  	}

	public String getCreatedDept() {
		return createdDept;
	}

	public void setCreatedDept(String createdDept) {
		this.createdDept = createdDept;
	}
 
}
