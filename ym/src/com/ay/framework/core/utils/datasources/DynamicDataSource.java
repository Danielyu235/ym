package com.ay.framework.core.utils.datasources;

import java.sql.SQLException;

import javax.sql.XAConnection;
import javax.sql.XADataSource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 动态数据源类
 * @author 数据库注入 小组
 * @date 2013-3-5
 * 
 */
public class DynamicDataSource extends  AbstractRoutingDataSource{

	@Override
	protected Object determineCurrentLookupKey() {
		String dataSourceName = DynamicDataSourceHolder.getDataSourceName();
		return dataSourceName;
	}

}
