
package com.ay.emergency.resource.transport.dao;

import com.ay.emergency.resource.transport.pojo.TransportResource;
import com.ay.framework.core.dao.BaseDao;

/**
 * 运输保障DAO层
 * @author lihe
 * @version2013.3.14 
 */
public class TransportResourceDao extends BaseDao<TransportResource> {
	
	@Override
	/** 取得sqlMapper命名空间名*/
	public String getEntityName() {
		return "TbRescueTransport";
	}
	
	@Override
	/** 取得表名*/
	public String getTableName() {
		return "TB_RESCUE_TRANSPORT";
	}

}