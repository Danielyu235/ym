package com.ay.colliery.theme.AThreeAntiSysTheme.dao;

import com.ay.colliery.theme.AThreeAntiSysTheme.pojo.AThreeAntiSysTheme;
import com.ay.framework.core.dao.BaseDao;

public class AThreeAntiSysThemeDao extends BaseDao<AThreeAntiSysTheme> {
	@Override
	public String getEntityName() {
		return "AThreeAntiSysTheme";
	}
	@Override
	public String getTableName() {
		return "TB_A_THREE_ANTI_SYS_THEME";
	}

}