package com.ay.elect.dao;

import java.util.List;
import java.util.Map;

import com.ay.elect.pojo.Elect;
import com.ay.elect.pojo.ElectMonth;
import com.ay.framework.core.dao.BaseDao;
import com.ay.themezt.coalzt.pojo.CoalMiningGraph;
import com.ay.themezt.coalzt.pojo.Coalzt;

public class ElectDao extends BaseDao<Elect> {
	@Override
	public String getEntityName() {
		return "Elect";
	}
	@Override
	public String getTableName() {
		return "TB_ELECT";
	}
	
	@SuppressWarnings("unchecked")
    public List<ElectMonth> getStaff(String month){
        return (List<ElectMonth>) getSqlMapClientTemplate().queryForList( 
                getEntityName() +".getStaff",month);
    }
	
	@SuppressWarnings("unchecked")
    public List<ElectMonth> getCol(String month){
        return (List<ElectMonth>) getSqlMapClientTemplate().queryForList( 
                getEntityName() +".getCol",month);
    }
}