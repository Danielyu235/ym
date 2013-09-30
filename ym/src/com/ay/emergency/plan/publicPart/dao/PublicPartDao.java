package com.ay.emergency.plan.publicPart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.emergency.plan.publicPart.pojo.PublicPart;
import com.ay.framework.core.dao.BaseDao;

public class PublicPartDao extends BaseDao<PublicPart> {
	@Override
	public String getEntityName() {
		return "PublicPart";
	}
	@Override
	public String getTableName() {
		return "TB_PUBLIC_PART";
	}

	@SuppressWarnings("unchecked")
	public List<PublicPart> getListById(String[] ids){
		Map map = null;
		if(ids != null){
			map = new HashMap();
			map.put("ids", ids);
		}
		return this.getSqlMapClientTemplate().queryForList(
					getEntityName()+".flist",map);
	}
}