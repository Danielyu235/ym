package com.ay.peoplemanage.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.peoplemanage.pojo.PeopleInfo;

public class PeopleInfoDao extends BaseDao<PeopleInfo>{
	
    /**
     * 获取sql命名空间名
     */
	public String getEntityName() {
		
		return "peoplemanage";
	}
	/**
	 * 获取数据库表明
	 */
	public String getTableName() {
		return "TB_PEOPLEINFO";
	}

}
