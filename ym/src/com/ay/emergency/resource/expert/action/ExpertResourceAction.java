	package com.ay.emergency.resource.expert.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.emergency.resource.expert.pojo.ExpertResource;
import com.ay.emergency.resource.expert.service.ExpertResourceService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.util.BeanUtil;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 救援专家ACTION层
 * @author lihe	
 * @version 2313.03.11
 */
@SuppressWarnings("all")
public class ExpertResourceAction extends BaseAction {
	/** 救援专家的服务类 */
	private ExpertResourceService rescueExpertService;
	/** 救援专家的实体类 */
	private ExpertResource rescueExpert;
	/** 分页对象 */
	private String page;
	/** 每页显示的数量 */
	private String rows;
	private String sort;
	private String order;
	/** 救援专家ID */
	private String id;
	/** ID的集合 */
	private String ids;
	
	/**
	 * 新增救援专家
	 * @return void
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		rescueExpert.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		rescueExpert.setCreateTime(new Date());
		try {
			//执行添加
			rescueExpertService.insert(rescueExpert);
			//返回信息添加成功结果
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 修改救援专家
	 * @return void
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		rescueExpert.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		rescueExpert.setUpdateTime(new Date());
		//执行更新救援专家操作
		boolean flag = rescueExpertService.update(rescueExpert);
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
	
	/**
	 * 根据多个ID进行删除的操作
	 * @return void
	 */
	public void deleteByIds()
	{
		String[] idsParam = ids.split("[,]");
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = rescueExpertService.deleteByIds(idsParam);
		if (flag)
		{
		    operateInfo.setOperateMessage("删除成功！");
		    operateInfo.setOperateSuccess(true);
		}else
		{
		    operateInfo.setOperateMessage("删除失败");
		    operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 删除救援专家
	 * @return void
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = rescueExpertService.delete(idsParam);
		} else {
			flag = rescueExpertService.delete(ids);
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
	
	/**
	 * 分页进行显示的工作
	 * @return void
	 */
	public void list() {
		DataStore<ExpertResource> dataStore = new DataStore<ExpertResource>();
		//获取分页对象
		Page pageTemp =Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(rescueExpert);
		Page resultPage = rescueExpertService.pageQuery(paramMap, pageTemp);
		List<ExpertResource> resultList = (List<ExpertResource>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		//返回结果
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 根据ID查询救援专家
	 * @return void
	 */
	public void getById() {
		Struts2Utils.renderJson(rescueExpertService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	

	public ExpertResourceService getRescueExpertService() {
		return rescueExpertService;
	}

	public void setRescueExpertService(ExpertResourceService rescueExpertService) {
		this.rescueExpertService = rescueExpertService;
	}

	public ExpertResource getRescueExpert() {
		return rescueExpert;
	}

	public void setRescueExpert(ExpertResource rescueExpert) {
		this.rescueExpert = rescueExpert;
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
