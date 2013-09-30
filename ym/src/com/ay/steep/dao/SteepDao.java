package com.ay.steep.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.steep.pojo.Steep;
import com.ay.coal.pojo.Coal;
import com.ay.framework.core.dao.BaseDao;

public class SteepDao extends BaseDao<Steep> {
	@Override
	public String getEntityName() {
		return "Steep";
	}
	@Override
	public String getTableName() {
		return "TB_STEEP";
	}
	@SuppressWarnings("unchecked")
	public List<Steep> getListById(String[] ids){
		Map map = null;
		if(ids != null){
			map = new HashMap();
			map.put("ids", ids);
		}
		return this.getSqlMapClientTemplate().queryForList(
					getEntityName()+".flist",map);
	}
}