package com.ay.emergency.rescue.supplies.dao;

import com.ay.emergency.rescue.supplies.pojo.AccidentSupplies;
import com.ay.framework.core.dao.BaseDao;

public class AccidentSuppliesDao extends BaseDao<AccidentSupplies> {
	@Override
	public String getEntityName() {
		return "AccidentSupplies";
	}
	@Override
	public String getTableName() {
		return "TB_ACCIDENT_SUPPLIES";
	}

}