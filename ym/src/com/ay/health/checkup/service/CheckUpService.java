package com.ay.health.checkup.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.framework.core.service.BaseService;
import com.ay.health.checkup.dao.CheckUpDao;
import com.ay.health.checkup.pojo.CheckUp;

public class CheckUpService extends BaseService<CheckUp, CheckUpDao> {
    public List<CheckUp> getPid(String pid){
        return dao.getPid(pid);
    }
    public CheckUp getView(String employeeId, String date){
		Map<String,String> map = new HashMap<String,String>();
		map.put("pid", employeeId);
		map.put("date", date.substring(0, 4));
		return this.dao.getView(map);
	}
    
    public List<CheckUp> charsData(Map<String,Object> map){
    	return this.dao.charsData(map);
    }
}