package com.ay.health.employee.service;

import com.ay.health.employee.dao.EmployeeInformationDao;
import com.ay.health.employee.pojo.EmployeeInformation;
import com.ay.framework.core.service.BaseService;

public class EmployeeInformationService extends BaseService<EmployeeInformation, EmployeeInformationDao> {
	public String getJobNumber(String jobNumber){
	   
	   return dao.getJobNumber(jobNumber);
	}
}