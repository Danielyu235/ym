package com.ay.safetarget.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.safetarget.pojo.SafeTarget;

public class SafeTargetDao extends BaseDao<SafeTarget>{

	@Override
	public String getTableName() {
		// TODO Auto-generated method stub
		return "TB_SAFE_TARGET1";
	}

	@Override
	public String getEntityName() {
		// TODO Auto-generated method stub
		return "SafeTarget";
	}

}
