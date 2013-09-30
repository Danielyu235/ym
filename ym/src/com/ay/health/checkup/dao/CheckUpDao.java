package com.ay.health.checkup.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ay.framework.core.dao.BaseDao;
import com.ay.health.checkup.pojo.CheckUp;

public class CheckUpDao extends BaseDao<CheckUp> {
	@Override
	public String getEntityName() {
		return "CheckUp";
	}
	@Override
	public String getTableName() {
		return "TB_CHECK_UP";
	}
	
	@SuppressWarnings("unchecked")
	public List<CheckUp> getPid(String pid){	   
	    return getSqlMapClientTemplate().queryForList(getEntityName()+".getByPid",pid);
	}
	
	@SuppressWarnings("unchecked")
	public CheckUp getView(Map<String,String> map){
		ArrayList<CheckUp> list =  (ArrayList<CheckUp>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".find",map);
		return list.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public List<CheckUp> charsData(Map<String,Object> map){
		return (List<CheckUp>)getSqlMapClientTemplate().queryForList(getEntityName() +".charsData",map);
	}
}