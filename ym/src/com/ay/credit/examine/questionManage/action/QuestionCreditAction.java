package com.ay.credit.examine.questionManage.action;

import java.util.List;
import java.util.Map;

import com.ay.credit.examine.questionManage.pojo.QuestionCredit;
import com.ay.credit.examine.questionManage.service.QuestionCreditService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
/**
 * 题目信息页面表现层
 * @author zhangxiang
 *2013-05-16
 */
@SuppressWarnings("all")
public class QuestionCreditAction extends BaseAction {
	private QuestionCreditService questionCreditService;
	private QuestionCredit questionCredit;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	
	/**
	 * 查询所有试题
	 */
	public void questionList() {
		DataStore<QuestionCredit> dataStore = new DataStore<QuestionCredit>();
		Page pageTemp = Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(questionCredit);
		Page resultPage = questionCreditService.pageQueryList(paramMap, pageTemp);
		List<QuestionCredit> resultList = (List<QuestionCredit>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		System.out.println(questionCredit.getQsTypeId()+"____________________________________________");
		try {
			questionCreditService.insert(questionCredit);
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
		boolean flag = questionCreditService.update(questionCredit);
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
			flag = questionCreditService.delete(idsParam);
		} else {
			flag = questionCreditService.delete(ids);
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
		DataStore<QuestionCredit> dataStore = new DataStore<QuestionCredit>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(questionCredit);
		Page resultPage = questionCreditService.pageQuery(paramMap, pageTemp);
		List<QuestionCredit> resultList = (List<QuestionCredit>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		questionCredit=questionCreditService.getById(id);
		Struts2Utils.renderJson(questionCredit,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public QuestionCredit getQuestionCredit() {
		return questionCredit;
	}

	public void setQuestionCredit(QuestionCredit questionCredit) {
		this.questionCredit = questionCredit;
	}

	public QuestionCreditService getQuestionCreditService() {
		return questionCreditService;
	}

	public void setQuestionCreditService(QuestionCreditService questionCreditService) {
		this.questionCreditService = questionCreditService;
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
