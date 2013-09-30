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
import com.ay.hazards.tank.pojo.TankHazards;
import com.ay.hazards.tank.service.TankHazardsService;
import com.ay.framework.core.action.BaseAction;
/**
 * 重大危险源贮罐
 * @author zhangxiang
 *2013-04-09
 */
@SuppressWarnings("all")
public class TankHazardsAction extends BaseAction {
	//贮罐服务类
	private TankHazardsService tankHazardsService;
	
	//贮罐实体类
	private TankHazards tankHazards;
	
	//当前页码
	private String page;
	//每页显示的行数
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	/**
	 * 新增贮罐信息
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			tankHazardsService.insert(tankHazards);
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
	 * 修改贮罐信息方法
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = tankHazardsService.update(tankHazards);
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
	 * 删除贮罐信息
	 */
	public void deleteByIds() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = tankHazardsService.deleteByIds(idsParam);
		} else {
			flag = tankHazardsService.delete(ids);
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
	 * 删除贮罐信息
	 */
	public void delete() {
	    OperateInfo operateInfo = new OperateInfo();
	    boolean flag = false;
	    if (ids.contains(",")) {
		String idsParam[] = ids.split(",");
		flag = tankHazardsService.deleteByIds(idsParam);
	    } else {
		flag = tankHazardsService.delete(ids);
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
	 * 查询贮罐信息
	 */
	public void list() {
		DataStore<TankHazards> dataStore = new DataStore<TankHazards>();
		//获取分页对象
		Page pageTemp =Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(tankHazards);
		Page resultPage = tankHazardsService.pageQuery(paramMap, pageTemp);
		List<TankHazards> resultList = (List<TankHazards>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	/**
	 * 根据ID查询实体类
	 */
	public void getById() {
		Struts2Utils.renderJson(tankHazardsService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public TankHazards getTankHazards() {
		return tankHazards;
	}

	public void setTankHazards(TankHazards tankHazards) {
		this.tankHazards = tankHazards;
	}

	public TankHazardsService getTankHazardsService() {
		return tankHazardsService;
	}

	public void setTankHazardsService(TankHazardsService tankHazardsService) {
		this.tankHazardsService = tankHazardsService;
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
