package com.ay.colliery.theme.FloorFacilitiesSysTheme.dao;

import com.ay.colliery.theme.FloorFacilitiesSysTheme.pojo.FloorFacilitiesSysTheme;
import com.ay.framework.core.dao.BaseDao;

public class FloorFacilitiesSysThemeDao extends BaseDao<FloorFacilitiesSysTheme> {
	@Override
	public String getEntityName() {
		return "FloorFacilitiesSysTheme";
	}
	@Override
	public String getTableName() {
		return "TB_FLOOR_FACILITIES_SYS_THEME";
	}

}