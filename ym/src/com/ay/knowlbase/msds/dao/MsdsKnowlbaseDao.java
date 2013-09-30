
package com.ay.knowlbase.msds.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.knowlbase.msds.pojo.MsdsKnowlbase;

/**
 * 危化品特征库Dao
 * @author yuzhou
 * @version 2013年3月18日 
 */
public class MsdsKnowlbaseDao extends BaseDao<MsdsKnowlbase> {
	@Override
	/** 取得sqlMapper命名空间名*/
	public String getEntityName() {
		return "MsdsKnowlbase";
	}
	
	@Override
	/** 取得表名*/
	public String getTableName() {
		return "TB_MSDS";
	}

}