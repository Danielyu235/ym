package com.ay.dailyStatus.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ay.dailyStatus.pojo.DailyStatus;
import com.ay.framework.core.dao.BaseDao;
import com.ay.jfds.dev.pojo.Data;

public class DailyStatusDao extends BaseDao<DailyStatus> {
	@Override
	public String getEntityName() {
		return "DailyStatus";
	}
	@Override
	public String getTableName() {
		return "TB_DAILY_STATUS";
	}
	
	@SuppressWarnings("unchecked")
	public List<String> codeToText(String[] strArray){
		List list = Arrays.asList(strArray);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("personList", list);
		System.out.println(map);
		try {
			list = this.getSqlMapClientTemplate().
				queryForList(getEntityName() +".codeToText",map);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<DailyStatus> getChartsData(Map<String, Object> map){
		return (List<DailyStatus>)this.getSqlMapClientTemplate().queryForList(getEntityName() + ".find", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Data> getDepartment(){
		return (List<Data>)this.getSqlMapClientTemplate().queryForList(getEntityName() + ".getDepartment");
	}
	
	@SuppressWarnings("unchecked")
	public List<DailyStatus> getLineData(Map<String, Object> map){
		return (List<DailyStatus>)this.getSqlMapClientTemplate().queryForList(getEntityName() + ".getLineData", map);
	}

}