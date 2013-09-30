package com.ay.colliery.theme.TunnellingSysTheme.dao;

import java.util.List;

import com.ay.colliery.theme.TunnellingSysTheme.pojo.TunnellingGraph;
import com.ay.colliery.theme.TunnellingSysTheme.pojo.TunnellingSysTheme;
import com.ay.framework.core.dao.BaseDao;
/**
 *  掘进系统主题数据库控制层
 * @author zx
 * 2013-06-04
 */
public class TunnellingSysThemeDao extends BaseDao<TunnellingSysTheme> {
	@Override
	public String getEntityName() {
		return "TunnellingSysTheme";
	}
	@Override
	public String getTableName() {
		return "TB_TUNNELLING_SYS_THEME";
	}
	/**
	 * 查询系统  柱形图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<TunnellingGraph> getMineSums(String date)
	{
		return (List<TunnellingGraph>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".sum",date);
	}
	
	/**
	 * 计算 工作面的个数
	 * @param date 工作面的个数
	 * @return
	 */
	public int getCountWork(String date) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				getEntityName() + ".number", date);
	}
	
	/**
	 * 查询采煤系统  饼图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<TunnellingSysTheme> getSumPie(String date)
	{
		return (List<TunnellingSysTheme>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".sumPie",date);
	}
	
	/**
	 * 查询采煤系统  饼折线图
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<TunnellingSysTheme> getAvg(String date)
	{
		return (List<TunnellingSysTheme>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".avgCoal",date);
	}
}