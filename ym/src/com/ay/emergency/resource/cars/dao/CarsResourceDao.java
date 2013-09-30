
package com.ay.emergency.resource.cars.dao;

import com.ay.emergency.resource.cars.pojo.CarsResource;
import com.ay.framework.core.dao.BaseDao;

/**
 * 救援车辆Dao
 * @author yuzhou
 * @version 2013年3月19日 
 */
public class CarsResourceDao extends BaseDao<CarsResource> {
	@Override
	/** 取得sqlMapper命名空间名*/
	public String getEntityName() {
		return "CarsResource";
	}
	
	@Override
	/** 取得表名*/
	public String getTableName() {
		return "TB_RESCUE_CARS";
	}

}