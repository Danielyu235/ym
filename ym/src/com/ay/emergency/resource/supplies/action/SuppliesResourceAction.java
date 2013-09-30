package com.ay.emergency.resource.supplies.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.emergency.resource.supplies.pojo.SuppliesResource;
import com.ay.emergency.resource.supplies.service.SuppliesResourceService;
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
 * 救援物资 表现层
 * @author yuzhou
 * 2013年3月19日 
 *
 */
@SuppressWarnings("all")
public class SuppliesResourceAction extends BaseAction {
	private SuppliesResourceService tbRescueSuppliesService;
	private SuppliesResource tbRescueSupplies;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	/**
	 * 新增救援物资
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		tbRescueSupplies.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbRescueSupplies.setCreateTime(new Date());
		try {
			tbRescueSuppliesService.insert(tbRescueSupplies);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
     * 修改救援物资
     */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		tbRescueSupplies.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbRescueSupplies.setUpdateTime(new Date());
		boolean flag = tbRescueSuppliesService.update(tbRescueSupplies);
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
	 */
	public void deleteByIds()
	{
		String[] idsParam = ids.split("[,]");
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = tbRescueSuppliesService.deleteByIds(idsParam);
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
     * 删除救援物资
     */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = tbRescueSuppliesService.delete(idsParam);
		} else {
			flag = tbRescueSuppliesService.delete(ids);
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
	 */
	public void list() {
		DataStore<SuppliesResource> dataStore = new DataStore<SuppliesResource>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(tbRescueSupplies);
		Page resultPage = tbRescueSuppliesService.pageQuery(paramMap, pageTemp);
		List<SuppliesResource> resultList = (List<SuppliesResource>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	/**
     * 根据ID查询救援物资
     */
	public void getById() {
		Struts2Utils.renderJson(tbRescueSuppliesService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	/**
     * 根据ID查询救援物资
     */
	public void getSuppList() {
		SuppliesResource supplies = new SuppliesResource();
		supplies.setSuppList(tbRescueSuppliesService.getSelectSupp());
		Struts2Utils.renderJson(supplies,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
    public SuppliesResource getTbRescueSupplies() {
		return tbRescueSupplies;
	}

	public void setTbRescueSupplies(SuppliesResource tbRescueSupplies) {
		this.tbRescueSupplies = tbRescueSupplies;
	}

	public SuppliesResourceService getTbRescueSuppliesService() {
		return tbRescueSuppliesService;
	}

	@Autowired
	public void setTbRescueSuppliesService(SuppliesResourceService tbRescueSuppliesService) {
		this.tbRescueSuppliesService = tbRescueSuppliesService;
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
