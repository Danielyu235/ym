package com.ay.masses.register.dao;

import com.ay.masses.register.pojo.RegisterMesses;
import com.ay.framework.core.dao.BaseDao;

public class RegisterMessesDao extends BaseDao<RegisterMesses> {
	@Override
	public String getEntityName() {
		return "RegisterMesses";
	}
	@Override
	public String getTableName() {
		return "TB_REGISTER_MESSES";
	}

}