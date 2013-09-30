package com.ay.jfds.sys.service;

import java.util.HashMap;
import java.util.List;

import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.service.BaseService;
import com.ay.jfds.sys.dao.DepartmentDao;
import com.ay.jfds.sys.pojo.Department;
import com.ay.jfds.sys.pojo.User;

/**
 * 部门service封装
 * 
 * @author zxy
 * 
 */
@SuppressWarnings("all")
public class DepartmentService extends BaseService<Department, DepartmentDao> {
	public List<Department> findAllChildDept(Department department) {
		return this.getDao().findAllChildDept(department);
	}

	public Page findAllDepartmentUser(Department department, Page page) {
		page.setCount(this.count(new HashMap()));
		List<User> list = this.getDao().findAllDepartmentUser(department, page.getFrom(),  page.getRecPerPage());
		page.setCollection(list);
		return page;
	}

	public Page findAllDepartmentUser(String id, Page page) {
		page.setCount(this.count(new HashMap()));
		List<User> list = this.getDao().findAllDepartmentUser(id, page.getFrom(),  page.getRecPerPage());
		page.setCollection(list);
		return page;
	}

	public boolean deleteUserByDept(String id) {
		return this.getDao().deleteUserByDept(id);
	}
}
