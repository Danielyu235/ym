package com.ay.emergency.resource.headquarters.dao;

import java.util.HashMap;
import java.util.List;

import com.ay.emergency.resource.headquarters.pojo.Headquarters;
import com.ay.emergency.resource.headquarters.pojo.Hperson;
import com.ay.framework.core.dao.BaseDao;

public class HeadquartersDao extends BaseDao<Headquarters> {
	@Override
	public String getEntityName() {
		return "Headquarters";
	}
	@Override
	public String getTableName() {
		return "TB_HEADQUARTERS";
	}

	@SuppressWarnings("unchecked")
	public List<Hperson> getHpersonList(Hperson hperson){
		HashMap<String,String> rMap = new HashMap<String,String>();
		rMap.put("hid", hperson.getHid());
		return (List<Hperson>) getSqlMapClientTemplate().queryForList( 
				getEntityName() +".findPerson",rMap);
	}
	
	public int getHpersonCount(Hperson hperson){
		HashMap<String,String> rMap = new HashMap<String,String>();
		rMap.put("hid", hperson.getHid());
		return (Integer) getSqlMapClientTemplate().queryForObject(
				getEntityName() +".countPerson",rMap);
	}
	
	public void addHperson(Hperson hperson){
		getSqlMapClientTemplate().insert(
				getEntityName() +".insertPerson",hperson);
	}
	
	public int delHperson(String id){
		int rows = getSqlMapClientTemplate().delete(
				getEntityName() + ".deletePerson", id);
		return rows;
	}
	
	public int updateHperson(Hperson hperson){
		int rows = getSqlMapClientTemplate().update(
				getEntityName() + ".updatePerson", hperson);
		return rows;
	}
	
}