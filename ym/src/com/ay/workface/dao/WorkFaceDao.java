package com.ay.workface.dao;

import com.ay.workface.pojo.WorkFace;
import com.ay.framework.core.dao.BaseDao;

public class WorkFaceDao extends BaseDao<WorkFace> {
	@Override
	public String getEntityName() {
		return "WorkFace";
	}
	@Override
	public String getTableName() {
		return "TB_WORK_FACE";
	}

}