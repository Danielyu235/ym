package com.ay.emergency.rescue.platform.service;

import java.util.List;
import java.util.Map;

import com.ay.emergency.rescue.platform.dao.PlatformRescueDao;
import com.ay.emergency.rescue.platform.pojo.PlatformRescue;
import com.ay.framework.core.service.BaseService;

public class PlatformRescueService extends BaseService<PlatformRescue, PlatformRescueDao> {
	
	public List<String> findType(){
		return this.dao.findType();
	}
	
	public List<PlatformRescue> getChartsData(Map<String, Object> map){
		return this.dao.getChartsData(map);
	}
}