package com.ay.hazards.identification.log.action;

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
import com.ay.hazards.identification.log.pojo.IdentificationLog;
import com.ay.hazards.identification.log.service.IdentificationLogService;
import com.ay.framework.core.action.BaseAction;
/**
 * 重大危险源辨识
 * @author zhangxiang
 * 2013-04-18
 */
@SuppressWarnings("all")
public class IdentificationLogAction extends BaseAction {
	//重大危险源辨识服务类
	private IdentificationLogService identificationLogService;
	
	//重大危险源辨识实体类
	private IdentificationLog identificationLog;
	
	//当前页码
	private String page;
	
	//每页显示行数
	private String rows;
	/**
	 * 获取所有辨识结果数据
	 */
	public void list() {
		DataStore<IdentificationLog> dataStore = new DataStore<IdentificationLog>();
		Page pageTemp = Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(identificationLog);
		Page resultPage = identificationLogService.pageQuery(paramMap, pageTemp);
		List<IdentificationLog> resultList = (List<IdentificationLog>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
    public IdentificationLog getIdentificationLog() {
		return identificationLog;
	}

	public void setIdentificationLog(IdentificationLog identificationLog) {
		this.identificationLog = identificationLog;
	}

	public IdentificationLogService getIdentificationLogService() {
		return identificationLogService;
	}

	public void setIdentificationLogService(IdentificationLogService identificationLogService) {
		this.identificationLogService = identificationLogService;
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
}
