package com.ay.emergency.rescue.accidentconclusion.dao;

import java.util.Map;

import com.ay.emergency.rescue.accidentconclusion.pojo.AccidentConclusion;
import com.ay.framework.core.dao.BaseDao;

public class AccidentConclusionDao extends BaseDao<AccidentConclusion> {
	@Override
	public String getEntityName() {
		return "AccidentConclusion";
	}
	@Override
	public String getTableName() {
		return "TB_ACCIDENT_CONCLUSION";
	}
	
	public int getCountByAid(Map<String,String> map){
		return (Integer) getSqlMapClientTemplate().queryForObject(
				getEntityName() + ".countByAid", map);
	}

}