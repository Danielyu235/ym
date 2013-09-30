package com.ay.scoremanagement.dao;

import com.ay.scoremanagement.pojo.ScoreManagement;
import com.ay.framework.core.dao.BaseDao;

public class ScoreManagementDao extends BaseDao<ScoreManagement> {
	@Override
	public String getEntityName() {
		return "ScoreManagement";
	}
	@Override
	public String getTableName() {
		return "TB_SCORE_MANAGEMENT";
	}

}