package com.ay.credit.examine.questionManage.action;

import java.util.List;
import java.util.Map;

import com.ay.credit.examine.questionManage.pojo.QuestionCredit;
import com.ay.credit.examine.questionManage.pojo.QuestionManageCredit;
import com.ay.credit.examine.questionManage.service.QuestionManageCreditService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
/**
 * 题库信息页面表现层
 * @author zhangxiang
 *2013-05-16
 */
@SuppressWarnings("all")
public class QuestionManageCreditAction extends BaseAction {
	private QuestionManageCreditService questionManageCreditService;
	private QuestionManageCredit questionManageCredit;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			questionManageCreditService.insert(questionManageCredit);
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
		boolean flag = questionManageCreditService.update(questionManageCredit);
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
			flag = questionManageCreditService.delete(idsParam);
		} else {
			flag = questionManageCreditService.delete(ids);
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
		DataStore<QuestionManageCredit> dataStore = new DataStore<QuestionManageCredit>();
		Page pageTemp = Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(questionManageCredit);
		Page resultPage = questionManageCreditService.pageQuery(paramMap, pageTemp);
		List<QuestionManageCredit> resultList = (List<QuestionManageCredit>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	
	public void getById() {
		Struts2Utils.renderJson(questionManageCreditService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public QuestionManageCredit getQuestionManageCredit() {
		return questionManageCredit;
	}

	public void setQuestionManageCredit(QuestionManageCredit questionManageCredit) {
		this.questionManageCredit = questionManageCredit;
	}

	public QuestionManageCreditService getQuestionManageCreditService() {
		return questionManageCreditService;
	}

	public void setQuestionManageCreditService(QuestionManageCreditService questionManageCreditService) {
		this.questionManageCreditService = questionManageCreditService;
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
