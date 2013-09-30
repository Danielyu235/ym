package com.ay.dailyStatus.service;

import java.util.List;
import java.util.Map;

import com.ay.dailyStatus.dao.DailyStatusDao;
import com.ay.dailyStatus.pojo.DailyStatus;
import com.ay.framework.core.service.BaseService;
import com.ay.jfds.dev.pojo.Data;

public class DailyStatusService extends BaseService<DailyStatus, DailyStatusDao> {
	
	public List<String> codeToText(String[] strArray){
		return this.dao.codeToText(strArray);
	}
	
	public List<DailyStatus> getChartsData(Map<String, Object> map){
		return this.dao.getChartsData(map);
	}
	
	public List<Data> getDepartment(){
		return this.dao.getDepartment();
	}
	
	public List<DailyStatus> getLineData(Map<String, Object> map){
		return this.dao.getLineData(map);
	}
}