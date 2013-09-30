package com.ay.transport.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.steep.pojo.Steep;
import com.ay.transport.pojo.Transport;
import com.ay.framework.core.dao.BaseDao;

public class TransportDao extends BaseDao<Transport> {
	@Override
	public String getEntityName() {
		return "Transport";
	}
	@Override
	public String getTableName() {
		return "TB_TRANSPORT";
	}
	@SuppressWarnings("unchecked")
	public List<Transport> getListById(String[] ids){
		Map map = null;
		if(ids != null){
			map = new HashMap();
			map.put("ids", ids);
		}
		return this.getSqlMapClientTemplate().queryForList(
					getEntityName()+".flist",map);
	}
}