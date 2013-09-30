
package com.ay.emergency.resource.technical.dao;

import com.ay.emergency.resource.technical.pojo.TechnicalResourcet;
import com.ay.framework.core.dao.BaseDao;

/**
 * 技术支持DAO层
 * @author lihe
 * @version2013.3.14 
 */
public class TechnicalResourcetDao extends BaseDao<TechnicalResourcet> {

	@Override
	/** 取得sqlMapper命名空间名*/
	public String getEntityName() {
		return "RescueTechnical";
	}
	
	@Override
	/** 取得表名*/
	public String getTableName() {
		return "TB_RESCUE_TECHNICAL";
	}

}