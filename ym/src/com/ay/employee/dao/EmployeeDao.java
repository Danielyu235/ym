package com.ay.employee.dao;

import com.ay.employee.pojo.Employee;
import com.ay.framework.core.dao.BaseDao;

public class EmployeeDao extends BaseDao<Employee> {
	@Override
	public String getEntityName() {
		return "Employee";
	}
	@Override
	public String getTableName() {
		return "TB_EMPLOYEE";
	}

}