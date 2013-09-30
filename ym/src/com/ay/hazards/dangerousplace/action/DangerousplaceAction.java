    package com.ay.hazards.dangerousplace.action;

	import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.hazards.dangerousplace.pojo.DangerousplaceInfo;
import com.ay.hazards.dangerousplace.service.DangerousplaceService;
import com.ay.hazards.dangerousplacematerials.pojo.DangerousPlaceMaterialsInfo;
import com.ay.hazards.dangerousplacematerials.service.DangerousPlaceMaterialsService;
import com.opensymphony.xwork2.ActionContext;

public class DangerousplaceAction extends BaseAction
{
    	/**
    	 * 危险场所服务层实体类
    	 */
    private DangerousplaceService dangerousplaceService;
    	/**
    	 * 封装危险场所信息
    	 */
    private DangerousplaceInfo dangerousplaceInfo;
		/** 
		 * 当前页
		 */
	private String page;
		/** 
		 * 每页显示的数量
		 */
	private String rows;
		/**
		 * 排序
		 */
	private String sort;
		/**
		 * 排序方式
		 */
	private String order;
		/** 
		 * 联系人ID
		 */
	private String id;
		/** 
		 * ID的集合 
		 */
	private String ids;
	
	
	/**
	 * 添加危险场所信息
	 */
    public void add()
    {
		OperateInfo opr = new OperateInfo();
		String str = (String) SecurityUtils.getSubject().getSession().getAttribute("user_id");
		dangerousplaceInfo.setCreated(str);
		//危险场所信息入库的时间
		dangerousplaceInfo.setCreateTime(new Date());
		
		try{
			//执行危险场所增加的操作
			dangerousplaceService.insert(dangerousplaceInfo);
			opr.setOperateMessage("添加成功");
			opr.setOperateSuccess(true);
			}
		catch(Exception e)
		{
			e.printStackTrace();
			opr.setOperateMessage("添加失败");
			opr.setOperateSuccess(false);
		}
			
		String json = new JsonMapper().toJson(opr);
		Struts2Utils.renderText(json);
	}
	
	
	/**
	 * 修改危险场所信息
	 */
	public void update() 
	{
		OperateInfo operateInfo = new OperateInfo();
		dangerousplaceInfo.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		dangerousplaceInfo.setUpdateTime(new Date());
		boolean flag = dangerousplaceService.update(dangerousplaceInfo);
		if (flag)
		{
			operateInfo.setOperateMessage("更新成功");
			operateInfo.setOperateSuccess(true);
		} 
		else 
		{
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
		boolean flag = dangerousplaceService.deleteByIds(idsParam);
		if (flag)
		{
		    operateInfo.setOperateMessage("删除成功！");
		    operateInfo.setOperateSuccess(true);
		}
		else
		{
		    operateInfo.setOperateMessage("删除失败");
		    operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 删除危险场所
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) 
		{
			String idsParam[] = ids.split(",");
			flag = dangerousplaceService.delete(idsParam);
		} else
		{
			flag = dangerousplaceService.delete(ids);
		}
		if (flag)
		{
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
	public void list()
	{
		DataStore<DangerousplaceInfo> dataStore = new DataStore<DangerousplaceInfo>();
		Page pageTemp =Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(dangerousplaceInfo);
		Page resultPage = dangerousplaceService.pageQuery(paramMap, pageTemp);
		List<DangerousplaceInfo> resultList = (List<DangerousplaceInfo>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 查询危险场所信息
	 */
    public String getByIds() 
    {
		try 
		{
			//获取危险场所对象
			DangerousplaceInfo dangerousplaceInfo = dangerousplaceService.getById(id);
			ActionContext ctx = ActionContext.getContext();
			ctx.getSession().put("dangerousplaceInfo", dangerousplaceInfo);
			return SUCCESS;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return ERROR;
		
			
	}
    /**
	 * 查询危险场所信息
	 */
    public void getById() 
    {
		try 
		{
			//获取危险场所对象
			DangerousplaceInfo dangerousplaceInfo = dangerousplaceService.getById(id);
			Struts2Utils.renderJson(dangerousplaceInfo,
					EncodingHeaderUtil.HEADERENCODING,
					EncodingHeaderUtil.CACHEENCODING);	
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
			
	}
    
	



	public DangerousplaceService getDangerousplaceService() {
		return dangerousplaceService;
	}
	public void setDangerousplaceService(DangerousplaceService dangerousplaceService) {
		this.dangerousplaceService = dangerousplaceService;
	}
	public DangerousplaceInfo getDangerousplaceInfo() {
		return dangerousplaceInfo;
	}
	public void setDangerousplaceInfo(DangerousplaceInfo dangerousplaceInfo) {
		this.dangerousplaceInfo = dangerousplaceInfo;
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
