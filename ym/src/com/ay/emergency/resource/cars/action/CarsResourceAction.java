package com.ay.emergency.resource.cars.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.emergency.resource.cars.pojo.CarsResource;
import com.ay.emergency.resource.cars.service.CarsResourceService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;

/**
 * 救援车辆Action
 * @author yuzhou
 * @version 2013年3月19日 
 */
@SuppressWarnings("all")
public class CarsResourceAction extends BaseAction {
    /** 救援车辆的服务类 */
	private CarsResourceService rescueCarsService;
	/** 救援车辆的实体类 */
	private CarsResource rescueCars;
	/** 分页对象 */
	private String page;
	/** 每页显示的数量 */
	private String rows;
	private String sort;
	private String order;
	/** 救援车辆ID */
	private String id;
	/** ID的集合 */
	private String ids;
	/**
     * 添加救援车辆方法 
     * @return void
     */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		rescueCars.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		rescueCars.setCreateTime(new Date());
		try {
		    //执行添加
			rescueCarsService.insert(rescueCars);
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
     * 更新救援车辆方法 
     * @return void
     */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		rescueCars.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		rescueCars.setUpdateTime(new Date());
		//执行更新救援车辆操作
		boolean flag = rescueCarsService.update(rescueCars);
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
		boolean flag = rescueCarsService.deleteByIds(idsParam);
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
     * 删除救援车辆方法 
     * @return void
     */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = rescueCarsService.delete(idsParam);
		} else {
			flag = rescueCarsService.delete(ids);
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
		DataStore<CarsResource> dataStore = new DataStore<CarsResource>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		//构建查询map
		Map paramMap = BeanUtil.Bean2Map(rescueCars);
		Page resultPage = rescueCarsService.pageQuery(paramMap, pageTemp);
		List<CarsResource> resultList = (List<CarsResource>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		//返回结果
		Struts2Utils.renderText(json);
	}
	/**
     * 救援车辆查看方法 
     * @return void
     */
	public void getById() {
		Struts2Utils.renderJson(rescueCarsService.getById(id),
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

	public CarsResourceService getRescueCarsService() {
		return rescueCarsService;
	}

	public void setRescueCarsService(CarsResourceService rescueCarsService) {
		this.rescueCarsService = rescueCarsService;
	}

	public CarsResource getRescueCars() {
		return rescueCars;
	}

	public void setRescueCars(CarsResource rescueCars) {
		this.rescueCars = rescueCars;
	}
	
}
