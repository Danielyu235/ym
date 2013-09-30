package com.ay.hazards.hazardousmaterials.dao;

import com.ay.hazards.hazardousmaterials.pojo.OtherMaterials;
import com.ay.framework.core.dao.BaseDao;
/** 
 * @Description 自定义的危险物质Dao
 * @date 2013-4-15
 * @author WangXin
 */
public class OtherMaterialsDao extends BaseDao<OtherMaterials> {
	@Override
	public String getEntityName() {
		return "OtherMaterials";
	}
	@Override
	public String getTableName() {
		return "TB_OTHER_MATERIALS";
	}

}