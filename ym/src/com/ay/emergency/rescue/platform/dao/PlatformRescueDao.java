package com.ay.emergency.rescue.platform.dao;

import java.util.List;
import java.util.Map;

import com.ay.emergency.rescue.platform.pojo.PlatformRescue;
import com.ay.framework.core.dao.BaseDao;

public class PlatformRescueDao extends BaseDao<PlatformRescue> {
	
	@Override
	public String getEntityName() {
		return "PlatformRescue";
	}
	
	@Override
	public String getTableName() {
		return "TB_PLATFORM_RESCUE";
	}

	@SuppressWarnings("unchecked")
	public List<String> findType(){
		return (List<String>) getSqlMapClientTemplate().queryForList(getEntityName() +".findType");
	}
	
	@SuppressWarnings("unchecked")
	public List<PlatformRescue> getChartsData(Map<String, Object> map){
		return (List<PlatformRescue>) getSqlMapClientTemplate().queryForList(getEntityName() +".find", map);
	}
}