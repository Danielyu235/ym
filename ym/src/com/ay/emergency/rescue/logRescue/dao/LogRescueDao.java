package com.ay.emergency.rescue.logRescue.dao;

import com.ay.emergency.rescue.logRescue.pojo.LogRescue;
import com.ay.framework.core.dao.BaseDao;

public class LogRescueDao extends BaseDao<LogRescue> {
	@Override
	public String getEntityName() {
		return "LogRescue";
	}
	@Override
	public String getTableName() {
		return "TB_LOG_RESCUE";
	}

}