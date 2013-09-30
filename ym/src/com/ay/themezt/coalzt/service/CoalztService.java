package com.ay.themezt.coalzt.service;

import java.util.List;
import java.util.Map;

import com.ay.framework.core.service.BaseService;
import com.ay.themezt.coalzt.dao.CoalztDao;
import com.ay.themezt.coalzt.pojo.CoalMiningGraph;
import com.ay.themezt.coalzt.pojo.Coalzt;

public class CoalztService extends BaseService<Coalzt, CoalztDao> {
	
	public List<Coalzt> getMonthlyData(Map<String,Object> map){
		return this.dao.getMonthlyData(map);
	}
	
	/**
	 * 掘进产量
	 * @param month
	 * @return
	 */
	public List<Coalzt> getTunne(String month){
		return this.dao.getTunne(month);
	}
	
	public List<Coalzt> getYieldData(Map<String, Object> map){
		return this.dao.getYieldData(map);
	}
	
	public List<Coalzt> getKindData(Map<String, Object> map){
		return this.dao.getKindData(map);
	}
	
	/**
	 * 掘进人员效率
	 * @param month
	 * @return
	 */
	public List<CoalMiningGraph> getStaff(String month){
		return this.dao.getStaff(month);
	}
	
	/**
	 * 年度中每月的品种煤产量
	 * @param map
	 * @return
	 */
	public List<Coalzt> yearChartsData(Map<String, Object> map) {
		return this.dao.yearChartsData(map);
	}
}