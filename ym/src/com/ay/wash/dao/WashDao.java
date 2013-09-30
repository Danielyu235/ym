package com.ay.wash.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.steep.pojo.Steep;
import com.ay.wash.pojo.Wash;
import com.ay.framework.core.dao.BaseDao;

public class WashDao extends BaseDao<Wash> {
	@Override
	public String getEntityName() {
		return "Wash";
	}
	@Override
	public String getTableName() {
		return "TB_WASH";
	}
	@SuppressWarnings("unchecked")
	public List<Wash> getListById(String[] ids){
		Map map = null;
		if(ids != null){
			map = new HashMap();
			map.put("ids", ids);
		}
		return this.getSqlMapClientTemplate().queryForList(
					getEntityName()+".flist",map);
	}
}