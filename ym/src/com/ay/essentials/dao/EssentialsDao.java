package com.ay.essentials.dao;

import com.ay.essentials.pojo.Essentials;
import com.ay.framework.core.dao.BaseDao;

public class EssentialsDao extends BaseDao<Essentials> {
	@Override
	public String getEntityName() {
		return "Essentials";
	}
	@Override
	public String getTableName() {
		return "TB_ESSENTIALS";
	}

}