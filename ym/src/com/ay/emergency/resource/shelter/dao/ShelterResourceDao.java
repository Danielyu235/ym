
package com.ay.emergency.resource.shelter.dao;

import com.ay.emergency.resource.shelter.pojo.ShelterResource;
import com.ay.framework.core.dao.BaseDao;

/**
 * 避难场所DAO层
 * @author lihe
 * @version2013.3.14 
 */
public class ShelterResourceDao extends BaseDao<ShelterResource> {
	
	@Override
	/** 取得sqlMapper命名空间名*/
	public String getEntityName() {
		return "TbRescueShelter";
	}
	
	@Override
	/** 取得表名*/
	public String getTableName() {
		return "TB_RESCUE_SHELTER";
	}

}