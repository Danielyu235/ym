package com.ay.hiddenPerils.dao;

import com.ay.hiddenPerils.pojo.PerilsData;
import com.ay.framework.core.dao.BaseDao;

public class PerilsDataDao extends BaseDao<PerilsData> {
	@Override
	public String getEntityName() {
		return "PerilsData";
	}
	@Override
	public String getTableName() {
		return "TB_PERILS_DATA";
	}

}