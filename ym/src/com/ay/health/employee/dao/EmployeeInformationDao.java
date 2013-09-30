package com.ay.health.employee.dao;

import java.util.List;

import com.ay.framework.core.dao.BaseDao;
import com.ay.health.employee.pojo.EmployeeInformation;

public class EmployeeInformationDao extends BaseDao<EmployeeInformation> {
	@Override
	public String getEntityName() {
		return "EmployeeInformation";
	}
	@Override
	public String getTableName() {
		return "TB_EMPLOYEE_INFORMATION";
	}
	
	public String getJobNumber(String jobNumber){
	   
	   
	    return (Integer) getSqlMapClientTemplate().queryForObject(getEntityName()+".getByJobNumber",jobNumber)+"";
	}
}