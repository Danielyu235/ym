package com.ay.reputation.service;

import java.util.List;

import com.ay.framework.core.service.BaseService;
import com.ay.reputation.dao.ReputationDao;
import com.ay.reputation.pojo.HistoryScope;
import com.ay.reputation.pojo.Reputation;

public class ReputationService extends BaseService<Reputation, ReputationDao> {

	
	public List<Reputation> getReputationList (Reputation reputation) {
		return this.dao.getReputationList(reputation);
	}
	
	public List<HistoryScope> getHistoryScopeList(String employeeId){
		return this.dao.getHistoryScopeList(employeeId);
	}
}
