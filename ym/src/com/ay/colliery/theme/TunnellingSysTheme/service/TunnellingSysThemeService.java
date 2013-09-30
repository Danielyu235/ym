package com.ay.colliery.theme.TunnellingSysTheme.service;

import java.util.List;

import com.ay.colliery.theme.TunnellingSysTheme.dao.TunnellingSysThemeDao;
import com.ay.colliery.theme.TunnellingSysTheme.pojo.TunnellingGraph;
import com.ay.colliery.theme.TunnellingSysTheme.pojo.TunnellingSysTheme;
import com.ay.framework.core.service.BaseService;

public class TunnellingSysThemeService extends BaseService<TunnellingSysTheme, TunnellingSysThemeDao> {
	/**
	 * 查询掘进系统  柱形图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<TunnellingGraph> getMineSums(String date)
	{
		return this.dao.getMineSums(date);
	}
	 /**
	 * 计算 工作面的个数
	 * @param date 工作面的个数
	 * @return
	 */
	public int getCountWork(String date) {
		return this.dao.getCountWork(date);
	}
	/**
	 * 查询掘进系统  饼形图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<TunnellingSysTheme> getSumPie(String date)
	{
		return this.dao.getSumPie(date);
	}
	/**
	 * 查询掘进系统  折线图
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<TunnellingSysTheme> getAvg(String date)
	{
		return this.dao.getAvg(date);
	}	
}