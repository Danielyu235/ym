package com.ay.hazards.tailingspond.action;

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
import com.ay.hazards.tailingspond.pojo.TailingspondHazards;
import com.ay.hazards.tailingspond.service.TailingspondHazardsService;
import com.ay.framework.core.action.BaseAction;
/**
 * 重大危险源尾矿库
 * @author yuzhou
 *  2013-04-11
 */
@SuppressWarnings("all")
public class TailingspondHazardsAction extends BaseAction {
	//尾矿库服务类
	private TailingspondHazardsService hazhardsTailingspondService;
	//尾矿库实体类
	private TailingspondHazards hazhardsTailingspond;
	//分页当前页码
	private String page;
	//每页显示的行数
	private String rows;
	//排序
	private String sort;
	//排序
	private String order;
	private String id;
	private String ids;
	
	/**
	 * 新增尾矿库信息
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			//调用新增方法
			hazhardsTailingspondService.insert(hazhardsTailingspond);
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
	 * 修改尾矿库信息
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		//调用服务类法修改方法，放回true与false
		boolean flag = hazhardsTailingspondService.update(hazhardsTailingspond);
		
		//判断更新是否成功
		if (flag) 
		{
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
	 * 删除尾矿库信息
	 */
	public void deleteByIds() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		//判断ids中是否有“，” 从而判断出是否多条删除
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			//调用多条删除 方法
			flag = hazhardsTailingspondService.deleteByIds(idsParam);
		} else {
			//调用单个删除方法
			flag = hazhardsTailingspondService.delete(ids);
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
	 * 删除尾矿库信息
	 */
	public void delete() {
	    OperateInfo operateInfo = new OperateInfo();
	    boolean flag = false;
	    //判断ids中是否有“，” 从而判断出是否多条删除
	    if (ids.contains(",")) {
		String idsParam[] = ids.split(",");
		//调用多条删除 方法
		flag = hazhardsTailingspondService.deleteByIds(idsParam);
	    } else {
		//调用单个删除方法
		flag = hazhardsTailingspondService.delete(ids);
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
	 * 获取尾矿库list
	 */
	public void list() {
		DataStore<TailingspondHazards> dataStore = new DataStore<TailingspondHazards>();
		//获取分页对象 
		Page pageTemp =Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(hazhardsTailingspond);
		Page resultPage = hazhardsTailingspondService.pageQuery(paramMap, pageTemp);
		//得到分页结果
		List<TailingspondHazards> resultList = (List<TailingspondHazards>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	/**
	 * 根据ID 获取尾矿库内容
	 */
	public void getById() {
		Struts2Utils.renderJson(hazhardsTailingspondService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public TailingspondHazards getHazhardsTailingspond() {
		return hazhardsTailingspond;
	}

	public void setHazhardsTailingspond(TailingspondHazards hazhardsTailingspond) {
		this.hazhardsTailingspond = hazhardsTailingspond;
	}

	public TailingspondHazardsService getHazhardsTailingspondService() {
		return hazhardsTailingspondService;
	}

	public void setHazhardsTailingspondService(TailingspondHazardsService hazhardsTailingspondService) {
		this.hazhardsTailingspondService = hazhardsTailingspondService;
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
