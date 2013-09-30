package com.ay.scoremanagement.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.scoremanagement.pojo.ScoreManagement;
import com.ay.scoremanagement.service.ScoreManagementService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class ScoreManagementAction extends BaseAction {
	private ScoreManagementService scoreManagementService;
	private ScoreManagement scoreManagement;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void update(){
		System.out.println(scoreManagement);
		OperateInfo operateInfo = new OperateInfo();
		try {
			scoreManagementService.update(scoreManagement);
			operateInfo.setOperateMessage("更新成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("更新失败");
			operateInfo.setOperateSuccess(false);
		}		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void getDate(){
		Struts2Utils.renderJson(scoreManagementService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
	
    public ScoreManagement getScoreManagement() {
		return scoreManagement;
	}

	public void setScoreManagement(ScoreManagement scoreManagement) {
		this.scoreManagement = scoreManagement;
	}

	public ScoreManagementService getScoreManagementService() {
		return scoreManagementService;
	}

	public void setScoreManagementService(ScoreManagementService scoreManagementService) {
		this.scoreManagementService = scoreManagementService;
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
