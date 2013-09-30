package com.ay.emergency.rescue.accidentconclusion.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.emergency.rescue.accidentconclusion.pojo.AccidentConclusion;
import com.ay.emergency.rescue.accidentconclusion.service.AccidentConclusionService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;

@SuppressWarnings("all")
public class AccidentConclusionAction extends BaseAction {
	private AccidentConclusionService accidentConclusionService;
	private AccidentConclusion accidentConclusion;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			System.out.println(accidentConclusion);
			accidentConclusionService.insert(accidentConclusion);
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
		boolean flag = accidentConclusionService.update(accidentConclusion);
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
			flag = accidentConclusionService.delete(idsParam);
		} else {
			flag = accidentConclusionService.delete(ids);
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
		DataStore<AccidentConclusion> dataStore = new DataStore<AccidentConclusion>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(accidentConclusion);
		Page resultPage = accidentConclusionService.pageQuery(paramMap, pageTemp);
		List<AccidentConclusion> resultList = (List<AccidentConclusion>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(accidentConclusionService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}	
	
	public void getCountByAid(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("aid", accidentConclusion.getAid());
		int count =  accidentConclusionService.getCountByAid(map);
		Struts2Utils.renderJson(count,
			EncodingHeaderUtil.HEADERENCODING,
			EncodingHeaderUtil.CACHEENCODING);	
	}
	
    public AccidentConclusion getAccidentConclusion() {
		return accidentConclusion;
	}

	public void setAccidentConclusion(AccidentConclusion accidentConclusion) {
		this.accidentConclusion = accidentConclusion;
	}

	public AccidentConclusionService getAccidentConclusionService() {
		return accidentConclusionService;
	}

	public void setAccidentConclusionService(AccidentConclusionService accidentConclusionService) {
		this.accidentConclusionService = accidentConclusionService;
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
