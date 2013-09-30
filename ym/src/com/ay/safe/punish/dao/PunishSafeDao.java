package com.ay.safe.punish.dao;

import com.ay.safe.punish.pojo.PunishSafe;
import com.ay.framework.core.dao.BaseDao;

public class PunishSafeDao extends BaseDao<PunishSafe> {
	@Override
	public String getEntityName() {
		return "PunishSafe";
	}
	@Override
	public String getTableName() {
		return "TB_PUNISH_SAFE";
	}

}