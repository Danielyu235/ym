package com.ay.hazards.pressurevessel.action;

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
import com.ay.hazards.pressurevessel.pojo.PressureVesselHazards;
import com.ay.hazards.pressurevessel.service.PressureVesselHazardsService;
import com.ay.framework.core.action.BaseAction;
/** 
 * @Description 重大危险源 压力容器表现层
 * @date 2013-4-11
 * @author WangXin
 */
@SuppressWarnings("all")
public class PressureVesselHazardsAction extends BaseAction {
    	/** 压力容器服务类 */
	private PressureVesselHazardsService pressureVesselHazardsService;
	/** 压力容器实体类 */
	private PressureVesselHazards pressureVesselHazards;
	/** 分页当前页数 */
	private String page;
	/** 分页每页显示的行数 */
	private String rows;
	/** 排序 */
	private String sort;
	/** 排序 */
	private String order;
	/** ID */
	private String id;
	/** ID集合 */
	private String ids;
	/**
	 * 新增压力容器信息
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
		    	//调用业务层新增方法
			pressureVesselHazardsService.insert(pressureVesselHazards);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
		    	e.printStackTrace();
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		//返回结果
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	/**
	 * 修改压力容器信息
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		//调用业务层修改方法
		boolean flag = pressureVesselHazardsService.update(pressureVesselHazards);
		if (flag) {
			operateInfo.setOperateMessage("更新成功");
			operateInfo.setOperateSuccess(true);
		} else {
			operateInfo.setOperateMessage("更新失败");
			operateInfo.setOperateSuccess(false);
		}
		//返回操作信息结果
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	/**
	 * 删除压力容器信息的操作
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		//判断ids参数中是否含有"," 是表示由多个ID组合
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = pressureVesselHazardsService.deleteByIds(idsParam);
		} else {
			flag = pressureVesselHazardsService.delete(ids);
		}
		//判断删除是否成功
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
	 * 分页显示的列表方法
	 */
	public void list() {
		DataStore<PressureVesselHazards> dataStore = new DataStore<PressureVesselHazards>();
		//获取分页对象
		Page pageTemp =Page.getNewInstance(page, rows);
		//map 保存实体类属性值，用于条件查询
		Map paramMap = BeanUtil.Bean2Map(pressureVesselHazards);
		//调用服务类，获取查询结果集
		Page resultPage = pressureVesselHazardsService.pageQuery(paramMap, pageTemp);
		//获取对象集合
		List<PressureVesselHazards> resultList = (List<PressureVesselHazards>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	/**
	 * 根据ID 获取压力容器信息
	 */
	public void getById() {
	    	//调用业务层getByid方法，根据ID 查询结果
		Struts2Utils.renderJson(pressureVesselHazardsService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public PressureVesselHazards getPressureVesselHazards() {
		return pressureVesselHazards;
	}

	public void setPressureVesselHazards(PressureVesselHazards pressureVesselHazards) {
		this.pressureVesselHazards = pressureVesselHazards;
	}

	public PressureVesselHazardsService getPressureVesselHazardsService() {
		return pressureVesselHazardsService;
	}

	public void setPressureVesselHazardsService(PressureVesselHazardsService pressureVesselHazardsService) {
		this.pressureVesselHazardsService = pressureVesselHazardsService;
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
