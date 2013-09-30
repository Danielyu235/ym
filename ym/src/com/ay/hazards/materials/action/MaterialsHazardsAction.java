package com.ay.hazards.materials.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.util.BeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.ay.hazards.materials.pojo.MaterialsHazards;
import com.ay.hazards.materials.service.MaterialsHazardsService;

/**
 * 生产场所 中存放物质action
 * @author yuzhou
 *  2013-04-22
 */
@SuppressWarnings("all")
public class MaterialsHazardsAction extends BaseAction {
	private MaterialsHazardsService tbHazhardsMaterialsService;
	private MaterialsHazards tbHazhardsMaterials;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		tbHazhardsMaterials.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbHazhardsMaterials.setCreateTime(new Date());
		try {
			tbHazhardsMaterialsService.insert(tbHazhardsMaterials);
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
	
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		tbHazhardsMaterials.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbHazhardsMaterials.setUpdateTime(new Date());
		boolean flag = tbHazhardsMaterialsService.update(tbHazhardsMaterials);
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
		boolean flag = tbHazhardsMaterialsService.deleteByIds(idsParam);
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
	
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = tbHazhardsMaterialsService.delete(idsParam);
		} else {
			flag = tbHazhardsMaterialsService.delete(ids);
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
		DataStore<MaterialsHazards> dataStore = new DataStore<MaterialsHazards>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(tbHazhardsMaterials);
		Page resultPage = tbHazhardsMaterialsService.pageQuery(paramMap, pageTemp);
		List<MaterialsHazards> resultList = (List<MaterialsHazards>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(tbHazhardsMaterialsService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	

    public MaterialsHazards getTbHazhardsMaterials() {
		return tbHazhardsMaterials;
	}

	public void setTbHazhardsMaterials(MaterialsHazards tbHazhardsMaterials) {
		this.tbHazhardsMaterials = tbHazhardsMaterials;
	}

	public MaterialsHazardsService getTbHazhardsMaterialsService() {
		return tbHazhardsMaterialsService;
	}

	@Autowired
	public void setTbHazhardsMaterialsService(MaterialsHazardsService tbHazhardsMaterialsService) {
		this.tbHazhardsMaterialsService = tbHazhardsMaterialsService;
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
