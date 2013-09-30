package com.ay.emergency.rescue.accidentsurvey.service;

import java.util.Map;

import com.ay.emergency.rescue.accidentsurvey.dao.AccidentSurveryDao;
import com.ay.emergency.rescue.accidentsurvey.pojo.AccidentSurvery;
import com.ay.framework.core.service.BaseService;

public class AccidentSurveryService extends BaseService<AccidentSurvery, AccidentSurveryDao> {
	
	public int getCountByAid(Map<String,String> map){
		return this.dao.getCountByAid(map);
	}
}