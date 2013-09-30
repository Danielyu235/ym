package com.ay.credit.examine.testPaperManage.action;

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
import com.ay.credit.examine.testPaperManage.pojo.selectPaper;
import com.ay.credit.examine.testPaperManage.service.selectPaperService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class selectPaperAction extends BaseAction {
	private selectPaperService selectPaperService;
	private selectPaper selectPaper;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			selectPaperService.insert(selectPaper);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
			e.printStackTrace();
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = selectPaperService.update(selectPaper);
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
			flag = selectPaperService.delete(idsParam);
		} else {
			flag = selectPaperService.delete(ids);
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
		DataStore<selectPaper> dataStore = new DataStore<selectPaper>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(selectPaper);
		Page resultPage = selectPaperService.pageQuery(paramMap, pageTemp);
		List<selectPaper> resultList = (List<selectPaper>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	public void isExam(){
        DataStore<selectPaper> dataStore = new DataStore<selectPaper>();
        Page pageTemp = new Page();
        //当前页 
        int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
        //每页显示条数  
        int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
        int start = (intPage -1) * number;
        pageTemp.setCurrentPage(intPage);
        pageTemp.setRecPerPage(number);
        pageTemp.setFrom(start);
        Map paramMap = BeanUtil.Bean2Map(selectPaper);
        Page resultPage = selectPaperService.pageQuery(paramMap, pageTemp);
        List<selectPaper> resultList = (List<selectPaper>) resultPage.getCollection();
        dataStore.setTotal(new Long(resultPage.getCount()));
        dataStore.setRows(resultList);
        String json = new JsonMapper().toJson(dataStore);
        Struts2Utils.renderText(json);
	    
	}
	public void getById() {
		Struts2Utils.renderJson(selectPaperService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
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

	public selectPaperService getSelectPaperService() {
		return selectPaperService;
	}

	public void setSelectPaperService(selectPaperService selectPaperService) {
		this.selectPaperService = selectPaperService;
	}

	public selectPaper getSelectPaper() {
		return selectPaper;
	}

	public void setSelectPaper(selectPaper selectPaper) {
		this.selectPaper = selectPaper;
	}
	
}
