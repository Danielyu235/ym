package com.ay.hazards.hazardousmaterials.dao;

import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.framework.core.dao.BaseDao;
/** 
 * @Description 危化品库的中危险物质Dao
 * @date 2013-4-15
 * @author WangXin
 */
public class MaterialsDao extends BaseDao<Materials> {
	@Override
	public String getEntityName() {
		return "Materials";
	}
	@Override
	public String getTableName() {
		return "TB_MATERIALS";
	}

}