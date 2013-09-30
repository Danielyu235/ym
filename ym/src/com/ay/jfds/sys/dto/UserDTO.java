package com.ay.jfds.sys.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户dto为了作显示用
 * 
 * @author zxy
 * 
 */
@SuppressWarnings("serial")
public class UserDTO implements Serializable {
	
	/** 用户ID */
	private String id;
	
	/** 用户 */
	private String account;

	/** 密码 */
	private String password;

	/** 用户名 */
	private String userName;

	/** department id */
	private String deptId;

	/** 用户类型 0 为超级管理员 1 为其它用户 */
	private String userType;

	/** 皮肤类型 */
	private String skinType;

	/** 登录时间 */
	private Date loginTime;

	/** 最后一次登录时间 */
	private Date lastLoginTime;

	/** 状态  0:删除   1:正常  2:锁定*/
	private String status;

	/** 保存人 */
	private String created;

	/** 创建时间 */
	private Date createTime;

	/** 更新人 */
	private String updated;

	/** 更新时间 */
	private Date updateTime;
	
	/** 30分钟登陆错误次数*/
	private Integer loseCount;

	private String deptName;

	public UserDTO() {}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getSkinType() {
		return skinType;
	}

	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getLoseCount() {
		return loseCount;
	}

	public void setLoseCount(int loseCount) {
		this.loseCount = loseCount;
	}

}
