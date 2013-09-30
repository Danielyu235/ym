package com.ay.hazards.tank.action;

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
import com.ay.hazards.tank.pojo.TankAraeHazards;
import com.ay.hazards.tank.service.TankAraeHazardsService;
import com.ay.framework.core.action.BaseAction;
/**
 * 重大危险源贮罐区表现成
 * @author zhangxiang
 * 2013-04-09
 */
@SuppressWarnings("all")
public class TankAraeHazardsAction extends BaseAction {
	//贮罐区服务类
	private TankAraeHazardsService tankAraeHazardsService;
	//贮罐区实体类
	private TankAraeHazards tankAraeHazards;
	
	//当前页码
	private String page;
	
	//每页显示的行数
	private String rows;
	private String sort;
	private String order;
	
	//ID
	private String id;
	
	//ID集合
	private String ids;
	
	/**
	 * 新增贮罐区信息
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			tankAraeHazardsService.insert(tankAraeHazards);
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
	 * 修改贮罐区信息
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = tankAraeHazardsService.update(tankAraeHazards);
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
	 * 根据ID删除贮罐区消息
	 */
	public void deleteByIds() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = tankAraeHazardsService.deleteByIds(idsParam);
		} else {
			flag = tankAraeHazardsService.delete(ids);
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
	 * 根据ID删除贮罐区消息
	 */
	public void delete() {
	    OperateInfo operateInfo = new OperateInfo();
	    boolean flag = false;
	    if (ids.contains(",")) {
		String idsParam[] = ids.split(",");
		flag = tankAraeHazardsService.deleteByIds(idsParam);
	    } else {
		flag = tankAraeHazardsService.delete(ids);
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
	 * 查询贮罐区信息
	 */
	public void list() {
		DataStore<TankAraeHazards> dataStore = new DataStore<TankAraeHazards>();
		//获取分页对象
		Page pageTemp =Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(tankAraeHazards);
		Page resultPage = tankAraeHazardsService.pageQuery(paramMap, pageTemp);
		List<TankAraeHazards> resultList = (List<TankAraeHazards>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 根据ID查询贮罐信息
	 */
	public void getById() {
		Struts2Utils.renderJson(tankAraeHazardsService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public TankAraeHazards getTankAraeHazards() {
		return tankAraeHazards;
	}

	public void setTankAraeHazards(TankAraeHazards tankAraeHazards) {
		this.tankAraeHazards = tankAraeHazards;
	}

	public TankAraeHazardsService getTankAraeHazardsService() {
		return tankAraeHazardsService;
	}

	public void setTankAraeHazardsService(TankAraeHazardsService tankAraeHazardsService) {
		this.tankAraeHazardsService = tankAraeHazardsService;
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
