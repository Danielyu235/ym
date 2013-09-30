package com.ay.attend.dao;

import com.ay.attend.pojo.AttendReward;
import com.ay.framework.core.dao.BaseDao;

public class AttendRewardDao extends BaseDao<AttendReward> {
	@Override
	public String getEntityName() {
		return "AttendReward";
	}
	@Override
	public String getTableName() {
		return "TB_ATTEND_REWARD";
	}

}