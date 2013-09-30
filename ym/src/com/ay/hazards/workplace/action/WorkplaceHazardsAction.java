package com.ay.hazards.workplace.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.hazards.materials.pojo.MaterialsHazards;
import com.ay.hazards.materials.service.MaterialsHazardsService;
import com.ay.hazards.workplace.pojo.WorkplaceHazards;
import com.ay.hazards.workplace.service.WorkplaceHazardsService;

/**
 * 生产场所action
 * @author yuzhou
 *  2013-04-22
 */
@SuppressWarnings("all")
public class WorkplaceHazardsAction extends BaseAction {
	//生产场所服务类
	private WorkplaceHazardsService tbHazhardsWorkplaceService;
	
	//生产场所实体类
	private WorkplaceHazards tbHazhardsWorkplace;
	
	//所属物品服务类
	private MaterialsHazardsService tbHazhardsMaterialsService;
	
	//所属物品实体类
	private MaterialsHazards tbHazhardsMaterials;
	
	//分页对象
	private String page;
	
	//每页显示的行数
	private String rows;
	private String sort;
	private String order;
	
	//生产场所ID
	private String id;
	
	private String ids;
	
	/**
	 * 新增生产场所
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		tbHazhardsWorkplace.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbHazhardsWorkplace.setCreateTime(new Date());
		try {
			tbHazhardsWorkplaceService.insert(tbHazhardsWorkplace);
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
	 * 修改生产场所
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		tbHazhardsWorkplace.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbHazhardsWorkplace.setUpdateTime(new Date());
		boolean flag = tbHazhardsWorkplaceService.update(tbHazhardsWorkplace);
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
		boolean flag = tbHazhardsWorkplaceService.deleteByIds(idsParam);
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
	 * 删除生产场所
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = tbHazhardsWorkplaceService.delete(idsParam);
		} else {
			flag = tbHazhardsWorkplaceService.delete(ids);
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
		DataStore<WorkplaceHazards> dataStore = new DataStore<WorkplaceHazards>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(tbHazhardsWorkplace);
		Page resultPage = tbHazhardsWorkplaceService.pageQuery(paramMap, pageTemp);
		List<WorkplaceHazards> resultList = (List<WorkplaceHazards>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	/**
	 * 查询生产场所信息
	 */
	public void getById() {
		//获取对应的生产物品
		List<MaterialsHazards> list;
		try {
			list = tbHazhardsMaterialsService.getEntityList(id);
			//获取生产场所对象
			WorkplaceHazards hazhards=tbHazhardsWorkplaceService.getById(id);
			//将对应的物品放入生产场所中
			hazhards.setList(list);
			Struts2Utils.renderJson(hazhards,
					EncodingHeaderUtil.HEADERENCODING,
					EncodingHeaderUtil.CACHEENCODING);		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
    public WorkplaceHazards getTbHazhardsWorkplace() {
		return tbHazhardsWorkplace;
	}

	public void setTbHazhardsWorkplace(WorkplaceHazards tbHazhardsWorkplace) {
		this.tbHazhardsWorkplace = tbHazhardsWorkplace;
	}

	public WorkplaceHazardsService getTbHazhardsWorkplaceService() {
		return tbHazhardsWorkplaceService;
	}

	@Autowired
	public void setTbHazhardsWorkplaceService(WorkplaceHazardsService tbHazhardsWorkplaceService) {
		this.tbHazhardsWorkplaceService = tbHazhardsWorkplaceService;
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

	public MaterialsHazardsService getTbHazhardsMaterialsService() {
		return tbHazhardsMaterialsService;
	}

	public void setTbHazhardsMaterialsService(
			MaterialsHazardsService tbHazhardsMaterialsService) {
		this.tbHazhardsMaterialsService = tbHazhardsMaterialsService;
	}

	public MaterialsHazards getTbHazhardsMaterials() {
		return tbHazhardsMaterials;
	}

	public void setTbHazhardsMaterials(MaterialsHazards tbHazhardsMaterials) {
		this.tbHazhardsMaterials = tbHazhardsMaterials;
	}
	
}
