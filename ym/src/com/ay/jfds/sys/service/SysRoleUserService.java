package com.ay.jfds.sys.service;

import com.ay.framework.core.service.BaseService;
import com.ay.jfds.sys.dao.SysRoleDao;
import com.ay.jfds.sys.dao.SysRoleUserDao;
import com.ay.jfds.sys.pojo.SysRoleUser;

/**
 * 角色用户关系表service 的封装
 * 
 * @author lushigai
 * @see SysRoleDao
 */
public class SysRoleUserService extends BaseService<SysRoleUser, SysRoleUserDao> {
	//新增角色用户关系
	public boolean addRoleUser(String roleDeptsStr,String roleId){
		this.dao.deleteByRoleId(String.valueOf(roleId));
    	String[] roleDepts = roleDeptsStr.split(";");
    	for(int i = 0 ;i<roleDepts.length;i++){
    		String deptId = roleDepts[i];
    		SysRoleUser sysRoleUser = new SysRoleUser();
    		sysRoleUser.setUserId(deptId);
    		sysRoleUser.setRoleId(roleId);
    		this.dao.insert(sysRoleUser);
    	}
    	return true;
	}
	
}
