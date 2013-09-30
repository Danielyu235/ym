package com.ay.hazards.identification.log.dao;

import com.ay.hazards.identification.log.pojo.IdentificationLog;
import com.ay.framework.core.dao.BaseDao;

public class IdentificationLogDao extends BaseDao<IdentificationLog> {
	@Override
	public String getEntityName() {
		return "IdentificationLog";
	}
	@Override
	public String getTableName() {
		return "TB_IDENTIFICATION_LOG";
	}

}