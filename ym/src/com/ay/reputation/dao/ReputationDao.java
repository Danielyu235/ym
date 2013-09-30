package com.ay.reputation.dao;

import java.util.HashMap;
import java.util.List;

import com.ay.framework.core.dao.BaseDao;
import com.ay.reputation.pojo.HistoryScope;
import com.ay.reputation.pojo.Reputation;

public class ReputationDao extends BaseDao<Reputation> {
	
	@Override
	public String getEntityName() {
		return "Reputation";
	}
	@Override
	public String getTableName() {
		return "tb_ygxypj";
	}
	
	@SuppressWarnings("unchecked")
	public List<Reputation> getReputationList(Reputation reputation){
		HashMap<String,String> rMap = new HashMap<String,String>();
		rMap.put("employeeId", reputation.getEmployeeId());
		rMap.put("date", reputation.getDate());
		return (List<Reputation>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".list",rMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<HistoryScope> getHistoryScopeList(String employeeId){
		HashMap<String,String> rMap = new HashMap<String,String>();
		rMap.put("employeeId", employeeId);
		return (List<HistoryScope>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".history",rMap);
	}
	
}
