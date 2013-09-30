package com.ay.colliery.theme.CoalMiningSysTheme.dao;

import java.util.List;

import com.ay.colliery.theme.CoalMiningSysTheme.pojo.CoalMiningGraph;
import com.ay.colliery.theme.CoalMiningSysTheme.pojo.CoalMiningSysTheme;
import com.ay.framework.core.dao.BaseDao;
/***
 * 采煤系统主题数据库控制层
 * @author zhangxiang
 * 2013-05-21
 */
public class CoalMiningSysThemeDao extends BaseDao<CoalMiningSysTheme> {
	@Override
	public String getEntityName() {
		return "CoalMiningSysTheme";
	}
	@Override
	public String getTableName() {
		return "TB_COAL_MINING_SYS_THEME";
	}

	/**
	 * 查询采煤系统  柱形图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<CoalMiningGraph> getMineSums(String date)
	{
		return (List<CoalMiningGraph>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".sums",date);
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
	public List<CoalMiningSysTheme> getSumPie(String date)
	{
		return (List<CoalMiningSysTheme>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".sumPie",date);
	}
	
	/**
	 * 查询采煤系统  饼折线图
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<CoalMiningSysTheme> getAvg(String date)
	{
		return (List<CoalMiningSysTheme>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".avgCoal",date);
	}
}