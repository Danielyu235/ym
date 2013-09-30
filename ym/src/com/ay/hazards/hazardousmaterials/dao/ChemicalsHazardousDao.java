package com.ay.hazards.hazardousmaterials.dao;

import java.util.List;

import com.ay.framework.core.dao.BaseDao;
import com.ay.hazards.hazardousmaterials.pojo.ChemicalsHazardous;
import com.ay.jfds.dev.pojo.Data;
/**
 * 危险化学品数据库控制层
 * @author zhangxiang
 * 2013-04-18
 */
public class ChemicalsHazardousDao extends BaseDao<ChemicalsHazardous> {

	/**
	 * 返回表名
	 */
	@Override
	public String getTableName() {
		// TODO Auto-generated method stub
		return "TB_WXYXP_CLASS";
	}

	/**
	 * 返回实体类名
	 */
	@Override
	public String getEntityName() {
		// TODO Auto-generated method stub
		return "chemicalsHazardous";
	}
	/**
	 * 根据类型找到第一级的元数据
	 * 
	 * @param 
	 * @return
	 */
	public List<ChemicalsHazardous> findDataByTypeFirstLevel() {
	    return (List<ChemicalsHazardous>) this.getSqlMapClientTemplate().queryForList(getEntityName() + ".findDataByTypeFirstLevel");
	}
	/**
	 * 根据类型找到第一级的元数据
	 * 
	 * @param 
	 * @return
	 */
	public List<ChemicalsHazardous> findDataByTypeTwoLevel(String wxhxplb) {
	    return (List<ChemicalsHazardous>) this.getSqlMapClientTemplate().queryForList(getEntityName() + ".findDataByTypeTwoLevel", wxhxplb);
	}
}
