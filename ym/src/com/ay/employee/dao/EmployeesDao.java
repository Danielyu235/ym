package com.ay.employee.dao;

import com.ay.employee.pojo.Employees;
import com.ay.framework.core.dao.BaseDao;

public class EmployeesDao extends BaseDao<Employees> {
	@Override
	public String getEntityName() {
		return "Employees";
	}
	@Override
	public String getTableName() {
		return "TB_EMPLOYEES";
	}

}