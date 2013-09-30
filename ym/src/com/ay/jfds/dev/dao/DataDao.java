package com.ay.jfds.dev.dao;

import java.util.List;
import java.util.Map;

import com.ay.framework.core.dao.BaseDao;
import com.ay.jfds.dev.dto.DataDTO;
import com.ay.jfds.dev.pojo.Data;
import com.ay.jfds.dev.pojo.DataType;

/**
 * 元数据Dao封装
 * 
 * @author PS
 */
@SuppressWarnings("all")
public class DataDao extends BaseDao<Data> {

	@Override
	public String getEntityName() {
		return "data";
	}

	/**
	 * 根据数据类型筛选元数据
	 * 
	 * @param idParam
	 * @return
	 */
	public List<Data> getDataByType(String idParam) {
		return (List<Data>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".getDataByType", idParam);
	}

	/**
	 * 用于分布展示的时候要显示这个元数据 属于哪个元数据类型的时候进行的操作
	 * 
	 * @param map
	 * @param from
	 * @param prePageNum
	 * @return
	 */
	public List<DataDTO> pageDTOQuery(Map map, int from, int prePageNum) {
		return (List<DataDTO>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".findDataDto", map, from, prePageNum);
	}

	/**
	 * 根据ID 查找DTO
	 * 
	 * @param id
	 * @return
	 */
	public DataDTO getDataDTOById(String id) {
		return (DataDTO) getSqlMapClientTemplate().queryForObject(
				getEntityName() + ".getDataDTOById", id);
	}

	/**
	 * 根据父类ID 找到子类DATA 数据 实现无限极查询
	 * 
	 * @param parentId
	 * @return
	 */
	public List<Data> findAllChildData(String parentId) {
		return (List<Data>) this.getSqlMapClientTemplate().queryForList(
				getEntityName() + ".findChildData", parentId);
	}

	/**
	 * 防止DATA 重复新建
	 * 
	 * @param map
	 * @return
	 */
	public Integer chickWordByWords(Map map) {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				getEntityName() + ".checkWordsByWords", map);
	}

	/**
	 * 防止更新的时候变成重复数据
	 * @param dataName
	 * @param dataCode
	 * @return
	 */
	public Integer chickUpdateWords(Map map) {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				getEntityName() + ".checkUpdateWords", map);
	}
	
	/**
	 * 根据元数据类别名称获取下拉框数据
	 * 
	 * @param typeName
	 * @return
	 */
	public List<DataDTO> getSelectDataByTypeName(String typeName) {
		return (List<DataDTO>) this.getSqlMapClientTemplate().queryForList(
				getEntityName() + ".getSelectDataByTypeName", typeName);
	}
	
	public List<Data> findData(Map map){
		return (List<Data>) this.getSqlMapClientTemplate().queryForList(getEntityName() + ".findData", map);
	}
	
	/**
	 * 根据类型找到第一级的元数据
	 * 
	 * @param typeId
	 * @return
	 */
	public List<Data> findDataByTypeFirstLevel(String typeId) {
	    return (List<Data>) this.getSqlMapClientTemplate().queryForList(getEntityName() + ".findDataByTypeFirstLevel", typeId);
	}
    public Data findParentData(String id){
       return (Data)this.getSqlMapClientTemplate().queryForObject(getEntityName()+".findParentById", id);
    }
	@Override
	public String getTableName() {
		return "dev_data";
	}
	
}
