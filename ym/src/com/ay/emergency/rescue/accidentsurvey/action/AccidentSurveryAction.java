package com.ay.emergency.rescue.accidentsurvey.action;

import java.util.Date;
import java.util.HashMap;
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
import com.ay.emergency.rescue.accidentsurvey.pojo.AccidentSurvery;
import com.ay.emergency.rescue.accidentsurvey.service.AccidentSurveryService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class AccidentSurveryAction extends BaseAction {
	private AccidentSurveryService accidentSurveryService;
	private AccidentSurvery accidentSurvery;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			accidentSurveryService.insert(accidentSurvery);
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
		boolean flag = accidentSurveryService.update(accidentSurvery);
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
			flag = accidentSurveryService.delete(idsParam);
		} else {
			flag = accidentSurveryService.delete(ids);
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
		DataStore<AccidentSurvery> dataStore = new DataStore<AccidentSurvery>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(accidentSurvery);
		Page resultPage = accidentSurveryService.pageQuery(paramMap, pageTemp);
		List<AccidentSurvery> resultList = (List<AccidentSurvery>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(accidentSurveryService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	public void getCountByAid(){
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("aid", accidentSurvery.getAid());
			int count =  accidentSurveryService.getCountByAid(map);
			Struts2Utils.renderJson(count,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
    public AccidentSurvery getAccidentSurvery() {
		return accidentSurvery;
	}

	public void setAccidentSurvery(AccidentSurvery accidentSurvery) {
		this.accidentSurvery = accidentSurvery;
	}

	public AccidentSurveryService getAccidentSurveryService() {
		return accidentSurveryService;
	}

	public void setAccidentSurveryService(AccidentSurveryService accidentSurveryService) {
		this.accidentSurveryService = accidentSurveryService;
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
