package com.ay.safe.health.service;

import java.util.HashMap;
import java.util.Map;

import com.ay.framework.core.service.BaseService;
import com.ay.safe.health.dao.HealthSafeDao;
import com.ay.safe.health.pojo.HealthSafe;
import com.ay.safe.health.pojo.HealthSafePojo;

public class HealthSafeService extends BaseService<HealthSafe, HealthSafeDao> {
	
	public HealthSafePojo getView(String employeeId, String date){
		Map<String,String> map = new HashMap<String,String>();
		map.put("employeeId", employeeId);
		map.put("date", date.substring(0, 4));
		return this.dao.getView(map);
	}
}