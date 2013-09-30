package com.ay.jfds.sys.dao;

import java.util.List;
import java.util.Map;

import com.ay.framework.core.dao.BaseDao;
import com.ay.jfds.sys.pojo.Department;
import com.ay.jfds.sys.pojo.User;

/**
 * 部门DAO
 * 
 * @author zxy
 *
 */
@SuppressWarnings("all")
public class DepartmentDao extends BaseDao<Department> {

	@Override
	public String getEntityName() {
		return "dept";
	}
	
	/**
	 * 查找一个部门下面的所有子部门
	 * 
	 * @param department
	 * @return
	 */
	public List<Department> findAllChildDept(Department department) {
		return (List<Department>) this.getSqlMapClientTemplate().queryForList(getEntityName() + ".findAllChildDept", department.getId());
	}
	
	/**
	 * 查找这个部门下的所有员工用户
	 * 
	 * @param department
	 * @return
	 */
	public List<User> findAllDepartmentUser(Department department, int from, int prePageNum) {
		return (List<User>) this.getSqlMapClientTemplate().queryForList(getEntityName() + ".findDeptsUser", department, from, prePageNum);
	}
	
	/**
	 * 根据id来找这个部门下的所有员工
	 * 
	 * @param deptId
	 * @param from
	 * @param prePageNum
	 * @return
	 */
	public List<User> findAllDepartmentUser(String id, int from, int prePageNum) {
		return (List<User>) this.getSqlMapClientTemplate().queryForList(getEntityName() + ".findDeptUserById", id, from ,prePageNum);
	}
	
	public boolean deleteUserByDept(String id) {
		int rows = this.getSqlMapClientTemplate().delete(getEntityName() + ".deleteUserByDept", id);
		if (rows >= 1) {
			return true;
		}
		return false;
	}

	@Override
	public String getTableName() {
		return "sys_dept";
	}
	
}
