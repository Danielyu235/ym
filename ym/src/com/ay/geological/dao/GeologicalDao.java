package com.ay.geological.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.geological.pojo.Geological;
import com.ay.ventilation.pojo.Ventilation;
import com.ay.framework.core.dao.BaseDao;

public class GeologicalDao extends BaseDao<Geological> {
	@Override
	public String getEntityName() {
		return "Geological";
	}
	@Override
	public String getTableName() {
		return "TB_GEOLOGICAL";
	}
	@SuppressWarnings("unchecked")
	public List<Geological> getListById(String[] ids){
		Map map = null;
		if(ids != null){
			map = new HashMap();
			map.put("ids", ids);
		}
		return this.getSqlMapClientTemplate().queryForList(
					getEntityName()+".flist",map);
	}
}