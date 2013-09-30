package com.ay.colliery.theme.AThreeAntiSysTheme.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.colliery.theme.AThreeAntiSysTheme.pojo.AThreeAntiSysTheme;
import com.ay.colliery.theme.AThreeAntiSysTheme.service.AThreeAntiSysThemeService;
import com.ay.framework.core.action.BaseAction;
import com.ay.jdbcBase.dao.JdbcSqlCrud;

@SuppressWarnings("all")
public class AThreeAntiSysThemeAction extends BaseAction {
	private AThreeAntiSysThemeService aThreeAntiSysThemeService;
	private AThreeAntiSysTheme aThreeAntiSysTheme;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			aThreeAntiSysThemeService.insert(aThreeAntiSysTheme);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = aThreeAntiSysThemeService.update(aThreeAntiSysTheme);
		if (flag) {
			operateInfo.setOperateMessage("更新成功");
			operateInfo.setOperateSuccess(true);
		} else {
			operateInfo.setOperateMessage("更新失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = aThreeAntiSysThemeService.delete(idsParam);
		} else {
			flag = aThreeAntiSysThemeService.delete(ids);
		}
		if (flag) {
			operateInfo.setOperateMessage("删除成功");
			operateInfo.setOperateSuccess(true);
		} else {
			operateInfo.setOperateMessage("删除失败");
			operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);		
	}
	
	public void list() {
		DataStore<AThreeAntiSysTheme> dataStore = new DataStore<AThreeAntiSysTheme>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(aThreeAntiSysTheme);
		Page resultPage = aThreeAntiSysThemeService.pageQuery(paramMap, pageTemp);
		List<AThreeAntiSysTheme> resultList = (List<AThreeAntiSysTheme>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		JdbcSqlCrud jdbc = new JdbcSqlCrud("com.microsoft.sqlserver.jdbc.SQLServerDriver", 
				"jdbc:sqlserver://10.0.0.181:1433;DatabaseName=ayjava_ym", "sa", "sasa");
		ResultSet result = jdbc.excuteQuery("select NAME,JOB_NUM from TB_EMPLOYEES where JOB_NUM =?", new Object[]{"060595"});
		try {
			while (result.next()) {
				System.out.println(result.getString("NAME")+"_______"+result.getString("JOB_NUM"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Struts2Utils.renderJson("测试数据",
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public AThreeAntiSysTheme getAThreeAntiSysTheme() {
		return aThreeAntiSysTheme;
	}

	public void setAThreeAntiSysTheme(AThreeAntiSysTheme aThreeAntiSysTheme) {
		this.aThreeAntiSysTheme = aThreeAntiSysTheme;
	}

	public AThreeAntiSysThemeService getAThreeAntiSysThemeService() {
		return aThreeAntiSysThemeService;
	}

	public void setAThreeAntiSysThemeService(AThreeAntiSysThemeService aThreeAntiSysThemeService) {
		this.aThreeAntiSysThemeService = aThreeAntiSysThemeService;
	}

	public AThreeAntiSysThemeService getaThreeAntiSysThemeService() {
		return aThreeAntiSysThemeService;
	}

	public void setaThreeAntiSysThemeService(
			AThreeAntiSysThemeService aThreeAntiSysThemeService) {
		this.aThreeAntiSysThemeService = aThreeAntiSysThemeService;
	}

	public AThreeAntiSysTheme getaThreeAntiSysTheme() {
		return aThreeAntiSysTheme;
	}

	public void setaThreeAntiSysTheme(AThreeAntiSysTheme aThreeAntiSysTheme) {
		this.aThreeAntiSysTheme = aThreeAntiSysTheme;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
