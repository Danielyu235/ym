package com.ay.safe.health.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.safe.health.pojo.HealthSafe;
import com.ay.safe.health.pojo.HealthSafePojo;
import com.ay.safe.health.service.HealthSafeService;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("all")
public class HealthSafeAction extends BaseAction {
	private HealthSafeService healthSafeService;
	private HealthSafe healthSafe;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	private String employeeId;
	private String date;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			if (healthSafe.getSource().equals("正常")) {
				healthSafe.setNumber("无");
			}
			healthSafeService.insert(healthSafe);
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
		if (healthSafe.getSource().equals("正常")) {
			healthSafe.setNumber("无");
		}
		boolean flag = healthSafeService.update(healthSafe);
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
			flag = healthSafeService.delete(idsParam);
		} else {
			flag = healthSafeService.delete(ids);
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
		DataStore<HealthSafe> dataStore = new DataStore<HealthSafe>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(healthSafe);
		Page resultPage = healthSafeService.pageQuery(paramMap, pageTemp);
		List<HealthSafe> resultList = (List<HealthSafe>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(healthSafeService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	public void getView(){
		HealthSafePojo hsp;
		try {
			hsp = healthSafeService.getView(employeeId, date);
			String json = new JsonMapper().toJson(hsp);
			Struts2Utils.renderText(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

	public HealthSafe getHealthSafe() {
		return healthSafe;
	}

	public void setHealthSafe(HealthSafe healthSafe) {
		this.healthSafe = healthSafe;
	}

	public HealthSafeService getHealthSafeService() {
		return healthSafeService;
	}

	public void setHealthSafeService(HealthSafeService healthSafeService) {
		this.healthSafeService = healthSafeService;
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

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
