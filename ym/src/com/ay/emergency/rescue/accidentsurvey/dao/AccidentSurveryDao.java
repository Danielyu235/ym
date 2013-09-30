package com.ay.emergency.rescue.accidentsurvey.dao;

import java.util.Map;

import com.ay.emergency.rescue.accidentsurvey.pojo.AccidentSurvery;
import com.ay.framework.core.dao.BaseDao;

public class AccidentSurveryDao extends BaseDao<AccidentSurvery> {
	@Override
	public String getEntityName() {
		return "AccidentSurvery";
	}
	@Override
	public String getTableName() {
		return "TB_ACCIDENT_SURVERY";
	}

	public int getCountByAid(Map<String,String> map){
		return (Integer) getSqlMapClientTemplate().queryForObject(
				getEntityName() + ".countByAid", map);
	}
}