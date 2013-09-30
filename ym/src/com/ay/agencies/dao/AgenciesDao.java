package com.ay.agencies.dao;

import com.ay.agencies.pojo.Agencies;
import com.ay.framework.core.dao.BaseDao;

public class AgenciesDao extends BaseDao<Agencies> {
	@Override
	public String getEntityName() {
		return "Agencies";
	}
	@Override
	public String getTableName() {
		return "TB_AGENCIES";
	}

}