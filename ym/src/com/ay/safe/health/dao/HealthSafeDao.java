package com.ay.safe.health.dao;

import java.util.ArrayList;
import java.util.Map;

import com.ay.framework.core.dao.BaseDao;
import com.ay.safe.health.pojo.HealthSafe;
import com.ay.safe.health.pojo.HealthSafePojo;

public class HealthSafeDao extends BaseDao<HealthSafe> {
	@Override
	public String getEntityName() {
		return "HealthSafe";
	}
	@Override
	public String getTableName() {
		return "TB_HEALTH_SAFE";
	}
	
	public HealthSafePojo getView(Map<String,String> map){
		ArrayList<HealthSafePojo> list =  (ArrayList<HealthSafePojo>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".find",map);
		return list.get(0);
	}
}