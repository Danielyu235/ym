package com.ay.themezt.coalzt.dao;

import java.util.List;

import com.ay.framework.core.dao.BaseDao;
import com.ay.themezt.coalzt.pojo.CoalOutGraph;
import com.ay.themezt.coalzt.pojo.CoalOutput;

public class CoalOutputDao extends BaseDao<CoalOutput> {
	@Override
	public String getEntityName() {
		return "CoalOutput";
	}
	@Override
	public String getTableName() {
		return "TB_COAL_OUTPUT";
	}
	@SuppressWarnings("unchecked")
	public List<CoalOutGraph> getMonthCoalData(String month){
		return (List<CoalOutGraph>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".coalOut",month);
	}
}