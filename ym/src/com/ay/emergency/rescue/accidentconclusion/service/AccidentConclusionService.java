package com.ay.emergency.rescue.accidentconclusion.service;

import java.util.Map;

import com.ay.emergency.rescue.accidentconclusion.dao.AccidentConclusionDao;
import com.ay.emergency.rescue.accidentconclusion.pojo.AccidentConclusion;
import com.ay.framework.core.service.BaseService;

public class AccidentConclusionService extends BaseService<AccidentConclusion, AccidentConclusionDao> {
	
	public int getCountByAid(Map<String,String> map){
		return this.dao.getCountByAid(map);
	}

}