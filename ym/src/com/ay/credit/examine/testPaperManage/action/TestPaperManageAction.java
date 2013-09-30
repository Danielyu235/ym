package com.ay.credit.examine.testPaperManage.action;

import java.util.List;
import java.util.Map;

import com.ay.credit.examine.testPaperManage.pojo.TestPaperManage;
import com.ay.credit.examine.testPaperManage.service.TestPaperManageService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
/**
 * 试卷管理表现层
 * @author zhangxiang
 * 2013-06-24
 */
@SuppressWarnings("all")
public class TestPaperManageAction extends BaseAction {
	private TestPaperManageService testPaperManageService;
	private TestPaperManage testPaperManage;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	private String testId;//查看试卷
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			testPaperManageService.insert(testPaperManage);
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
		boolean flag=false;
		try {
			flag = testPaperManageService.update(testPaperManage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
			flag = testPaperManageService.delete(idsParam);
		} else {
			flag = testPaperManageService.delete(ids);
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
		DataStore<TestPaperManage> dataStore = new DataStore<TestPaperManage>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(testPaperManage);
		Page resultPage = testPaperManageService.pageQuery(paramMap, pageTemp);
		List<TestPaperManage> resultList = (List<TestPaperManage>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	public void listOnline() {
		DataStore<TestPaperManage> dataStore=null;
		try {
			dataStore = new DataStore<TestPaperManage>();
			Page pageTemp = new Page();
			//当前页 
			int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
			//每页显示条数  
			int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
			int start = (intPage -1) * number;
			pageTemp.setCurrentPage(intPage);
			pageTemp.setRecPerPage(number);
			pageTemp.setFrom(start);
			Map paramMap = BeanUtil.Bean2Map(testPaperManage);
			Page resultPage = testPaperManageService.pageQueryOnline(paramMap, pageTemp);
			List<TestPaperManage> resultList = (List<TestPaperManage>) resultPage.getCollection();
			dataStore.setTotal(new Long(resultPage.getCount()));
			dataStore.setRows(resultList);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	public void getById() {
		testPaperManage=testPaperManageService.getById(id);
		try {
			testPaperManage.setList(testPaperManageService.getFindQuestion(id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Struts2Utils.renderJson(testPaperManage,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	//查看成绩
	public void getByIds() {
		testPaperManage=testPaperManageService.getById(id);
		try {
			//试题
			testPaperManage.setList(testPaperManageService.getFindQuestion(id));
			//查看试卷
			testPaperManage.setListPaper(testPaperManageService.getSelectPaper(testId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		Struts2Utils.renderJson(testPaperManage,
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

	public TestPaperManageService getTestPaperManageService() {
		return testPaperManageService;
	}

	public void setTestPaperManageService(
			TestPaperManageService testPaperManageService) {
		this.testPaperManageService = testPaperManageService;
	}

	public TestPaperManage getTestPaperManage() {
		return testPaperManage;
	}

	public void setTestPaperManage(TestPaperManage testPaperManage) {
		this.testPaperManage = testPaperManage;
	}

	public String getTestId() {
		return testId;
	}

	public void setTestId(String testId) {
		this.testId = testId;
	}

}
