package com.ay.credit.examine.testPaperManage.dao;

import com.ay.credit.examine.testPaperManage.pojo.selectPaper;
import com.ay.framework.core.dao.BaseDao;

public class selectPaperDao extends BaseDao<selectPaper> {
	@Override
	public String getEntityName() {
		return "selectPaper";
	}
	@Override
	public String getTableName() {
		return "TB_SELECT_PAPER";
	}

}