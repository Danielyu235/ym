
package com.ay.emergency.resource.expert.dao;

import com.ay.emergency.resource.expert.pojo.ExpertResource;
import com.ay.framework.core.dao.BaseDao;

/**
 * 救援专家DAO层
 * @author lihe
 * @version2013.3.14 
 */
public class ExpertResourceDao extends BaseDao<ExpertResource> {
	
	@Override
	/** 取得sqlMapper命名空间名*/
	public String getEntityName() {
		return "rescueExpert";
	}
	
	@Override
	/** 取得表名*/
	public String getTableName() {
		return "TB_RESCUE_EXPERT";
	}

}