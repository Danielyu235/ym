
package com.ay.emergency.resource.communication.dao;

import com.ay.emergency.resource.communication.pojo.CommunicationResourcet;
import com.ay.framework.core.dao.BaseDao;

/**
 * 通讯保障DAO层
 * @author lihe
 * @version2013.3.14 
 */
public class CommunicationResourcetDao extends BaseDao<CommunicationResourcet> {
	
	@Override
	/** 取得sqlMapper命名空间名*/
	public String getEntityName() {
		return "rescueCommunication";
	}
	
	@Override
	/** 取得表名*/
	public String getTableName() {
		return "TB_RESCUE_COMMUNICATION";
	}

}