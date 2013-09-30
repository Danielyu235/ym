package com.ay.hazards.dangerousplacematerials.action;

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
import com.ay.hazards.dangerousplacematerials.pojo.DangerousPlaceMaterialsInfo;
import com.ay.hazards.dangerousplacematerials.service.DangerousPlaceMaterialsService;
import com.ay.hazards.hazardousmaterials.pojo.Materials;

/**
 ** 危险场所危险物质Action类
 ** @author liuhu
 **
 **/
public class DangerousPlaceMaterialsAction extends BaseAction
{
	/**
	 ** 危险物质服务层实例
	 **/
	private DangerousPlaceMaterialsService dangerousPlaceMaterialsService;
	/**
	 ** 封装页面危险物质表单
	 **/
    private DangerousPlaceMaterialsInfo dangerousPlaceMaterialsInfo;
    /**
     * 当前页
     */
    private String page;
    /**
     * 每页显示的记录数
     */
    private String rows;
    private String sort;
    private String order;
    private String id;
    private String ids;
	
    /**
     *  自定义危险物质
     */
	public void add() 
	{
		OperateInfo operateInfo = new OperateInfo();
		String str = (String) SecurityUtils.getSubject().getSession().getAttribute("user_id");
		dangerousPlaceMaterialsInfo.setCreated(str);
		//危险物质信息入库的时间
		dangerousPlaceMaterialsInfo.setCreateTime(new Date());
		try 
		{
			dangerousPlaceMaterialsService.insert(dangerousPlaceMaterialsInfo);
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
	 * 修改危险场所危险物质信息
	 */
    public void update() 
    {
		OperateInfo operateInfo = new OperateInfo();
		try{
		boolean flag = dangerousPlaceMaterialsService.update(dangerousPlaceMaterialsInfo);
		if (flag) {
			operateInfo.setOperateMessage("更新成功");
			operateInfo.setOperateSuccess(true);
		} else {
			operateInfo.setOperateMessage("更新失败");
			operateInfo.setOperateSuccess(false);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
    /**
     * 删除危险场所中所包含物质
     */
	public void deleteByIds() 
	{
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = dangerousPlaceMaterialsService.deleteByIds(idsParam);
		} else {
			flag = dangerousPlaceMaterialsService.delete(ids);
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
	 * 删除危险场所中所包含物质
	 */
	public void delete() 
	{
	    OperateInfo operateInfo = new OperateInfo();
	    boolean flag = false;
	    if (ids.contains(",")) {
		String idsParam[] = ids.split(",");
		flag = dangerousPlaceMaterialsService.deleteByIds(idsParam);
	    } else {
		flag = dangerousPlaceMaterialsService.delete(ids);
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
	 * 分页展示危险源物质
	 */
	public void list() 
	{
		
		DataStore<Materials> dataStore = new DataStore<Materials>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(dangerousPlaceMaterialsInfo);
		Page resultPage = dangerousPlaceMaterialsService.pageQuery(paramMap, pageTemp);
		List<Materials> resultList = (List<Materials>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		//将数据转换成Json对象返回给页面
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 查看危险场所危险物质
	 */
	public void getById()
	{
		try
		{
			Struts2Utils.renderJson(dangerousPlaceMaterialsService.getById(id),
					EncodingHeaderUtil.HEADERENCODING,
					EncodingHeaderUtil.CACHEENCODING);		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
  	}


	public DangerousPlaceMaterialsService getDangerousPlaceMaterialsService() {
		return dangerousPlaceMaterialsService;
	}

	public void setDangerousPlaceMaterialsService(
			DangerousPlaceMaterialsService dangerousPlaceMaterialsService) {
		this.dangerousPlaceMaterialsService = dangerousPlaceMaterialsService;
	}



	public DangerousPlaceMaterialsInfo getDangerousPlaceMaterialsInfo() {
		return dangerousPlaceMaterialsInfo;
	}

	public void setDangerousPlaceMaterialsInfo(
			DangerousPlaceMaterialsInfo dangerousPlaceMaterialsInfo) {
		this.dangerousPlaceMaterialsInfo = dangerousPlaceMaterialsInfo;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) 
	{
		this.page = page;
	}

	public String getRows()
	{
		return rows;
	}

	public void setRows(String rows) 
	{
		this.rows = rows;
	}

	public String getSort() 
	{
		return sort;
	}

	public void setSort(String sort) 
	{
		this.sort = sort;
	}

	public String getOrder() 
	{
		return order;
	}

	public void setOrder(String order) 
	{
		this.order = order;
	}

	public String getId() 
	{
		return id;
	}

	public void setId(String id) 
	{
		this.id = id;
	}

	public String getIds() 
	{
		return ids;
	}

	public void setIds(String ids) 
	{
		this.ids = ids;
	}
	

}
