
package com.ay.emergency.resource.responseteam.dao;

import com.ay.emergency.resource.responseteam.pojo.ResponseteamResource;
import com.ay.framework.core.dao.BaseDao;

/**
 * 救援队伍数据库控制层
 * @author yuzhou
 * 2013年3月19日 
 *
 */
public class ResponseteamResourceDao extends BaseDao<ResponseteamResource> {
	@Override
	public String getEntityName() {
		return "rescueTeam";
	}
	
	@Override
	public String getTableName() {
		return "TB_RESCUE_TEAM";
	}

}