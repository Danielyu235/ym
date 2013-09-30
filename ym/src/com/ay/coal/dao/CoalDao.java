package com.ay.coal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.coal.pojo.Coal;
import com.ay.framework.core.dao.BaseDao;
import com.ay.geological.pojo.Geological;

public class CoalDao extends BaseDao<Coal> {
	@Override
	public String getEntityName() {
		return "Coal";
	}
	@Override
	public String getTableName() {
		return "TB_COAL";
	}
	@SuppressWarnings("unchecked")
	public List<Coal> getListById(String[] ids){
		Map map = null;
		if(ids != null){
			map = new HashMap();
			map.put("ids", ids);
		}
		return this.getSqlMapClientTemplate().queryForList(
					getEntityName()+".flist",map);
	}
}