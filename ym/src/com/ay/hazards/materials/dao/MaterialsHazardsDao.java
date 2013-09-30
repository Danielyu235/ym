
package com.ay.hazards.materials.dao;

import java.util.List;

import com.ay.framework.core.dao.BaseDao;
import com.ay.hazards.materials.pojo.MaterialsHazards;

/**
 * 生产场所 中存放物质数据库控制层
 * @author yuzhou
 *  2013-04-22
 */
public class MaterialsHazardsDao extends BaseDao<MaterialsHazards> {
	@Override
	public String getEntityName() {
		return "materials";
	}
	
	@Override
	public String getTableName() {
		return "TB_HAZHARDS_MATERIALS";
	}
	public List<MaterialsHazards> getEntityList(String fid){
		return (List<MaterialsHazards>) getSqlMapClientTemplate().queryForList("materials.findList", fid);
	}
}