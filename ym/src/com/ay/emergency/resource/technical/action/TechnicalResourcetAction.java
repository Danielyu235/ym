package com.ay.emergency.resource.technical.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.emergency.resource.technical.pojo.TechnicalResourcet;
import com.ay.emergency.resource.technical.service.TechnicalResourcetService;
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
 * 技术支持ACTION层
 * @author lihe	
 * @version 2313.03.11
 */
@SuppressWarnings("all")
public class TechnicalResourcetAction extends BaseAction {
	/** 技术支持的服务类 */
	private TechnicalResourcetService rescueTechnicalService;
	/** 技术支持的实体类 */
	private TechnicalResourcet rescueTechnical;
	/** 分页对象 */
	private String page;
	/** 每页显示的数量 */
	private String rows;
	private String sort;
	private String order;
	/** 技术支持ID */
	private String id;
	/** ID的集合 */
	private String ids;
	
	/**
	 * 新增技术支持
	 * @return void
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		rescueTechnical.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		rescueTechnical.setCreateTime(new Date());
		try {
			//执行添加
			rescueTechnicalService.insert(rescueTechnical);
			//返回信息添加成功结果
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			//e.printStackTrace();
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 修改技术支持
	 * @return void
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		rescueTechnical.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		rescueTechnical.setUpdateTime(new Date());
		//执行更新技术支持操作
		boolean flag = rescueTechnicalService.update(rescueTechnical);
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
		boolean flag = rescueTechnicalService.deleteByIds(idsParam);
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
	 * 删除技术支持
	 * @return void
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = rescueTechnicalService.delete(idsParam);
		} else {
			flag = rescueTechnicalService.delete(ids);
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
		DataStore<TechnicalResourcet> dataStore = new DataStore<TechnicalResourcet>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(rescueTechnical);
		Page resultPage = rescueTechnicalService.pageQuery(paramMap, pageTemp);
		List<TechnicalResourcet> resultList = (List<TechnicalResourcet>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		//返回结果
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 根据ID查询技术支持
	 * @return void
	 */
	public void getById() {
		Struts2Utils.renderJson(rescueTechnicalService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	public TechnicalResourcetService getRescueTechnicalService() {
		return rescueTechnicalService;
	}

	public void setRescueTechnicalService(
			TechnicalResourcetService rescueTechnicalService) {
		this.rescueTechnicalService = rescueTechnicalService;
	}

	public TechnicalResourcet getRescueTechnical() {
		return rescueTechnical;
	}
	public void setRescueTechnical(TechnicalResourcet rescueTechnical) {
		this.rescueTechnical = rescueTechnical;
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
