package com.ay.themezt.coalzt.dao;

import java.util.List;
import java.util.Map;

import com.ay.framework.core.dao.BaseDao;
import com.ay.themezt.coalzt.pojo.CoalMiningGraph;
import com.ay.themezt.coalzt.pojo.Coalzt;

public class CoalztDao extends BaseDao<Coalzt> {
	@Override
	public String getEntityName() {
		return "Coalzt";
	}
	@Override
	public String getTableName() {
		return "TB_COALZT";
	}
	
	@SuppressWarnings("unchecked")
	public List<Coalzt> getMonthlyData(Map<String, Object> map){
		return (List<Coalzt>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".getMonthlyData",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Coalzt> getKindData(Map<String, Object> map){
		return (List<Coalzt>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".getKindData",map);
	}
	@SuppressWarnings("unchecked")
	public List<Coalzt> getTunne(String month){
		return (List<Coalzt>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".getTunne",month);
	}
	@SuppressWarnings("unchecked")
	public List<CoalMiningGraph> getStaff(String month){
		return (List<CoalMiningGraph>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".getStaff",month);
	}
	
	@SuppressWarnings("unchecked")
	public List<Coalzt> getYieldData(Map<String, Object> map){
		return (List<Coalzt>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".yield",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Coalzt> yearChartsData(Map<String, Object> map) {
		return (List<Coalzt>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".yearChartsData",map);
	}
}