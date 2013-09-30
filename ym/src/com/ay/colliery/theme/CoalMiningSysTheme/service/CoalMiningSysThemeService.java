package com.ay.colliery.theme.CoalMiningSysTheme.service;

import java.util.List;

import com.ay.colliery.theme.CoalMiningSysTheme.dao.CoalMiningSysThemeDao;
import com.ay.colliery.theme.CoalMiningSysTheme.pojo.CoalMiningGraph;
import com.ay.colliery.theme.CoalMiningSysTheme.pojo.CoalMiningSysTheme;
import com.ay.framework.core.service.BaseService;
/***
 * 采煤系统主题服务层
 * @author zhangxiang
 * 2013-05-21
 */
public class CoalMiningSysThemeService extends BaseService<CoalMiningSysTheme, CoalMiningSysThemeDao> {
	/**
	 * 查询采煤系统  柱形图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<CoalMiningGraph> getMineSums(String date)
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
	 * 查询采煤系统  饼形图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<CoalMiningSysTheme> getSumPie(String date)
	{
		return this.dao.getSumPie(date);
	}
	/**
	 * 查询采煤系统  折线图
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<CoalMiningSysTheme> getAvg(String date)
	{
		return this.dao.getAvg(date);
	}
}