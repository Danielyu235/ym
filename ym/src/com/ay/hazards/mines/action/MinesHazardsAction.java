package com.ay.hazards.mines.action;

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
import com.ay.hazards.mines.pojo.MinesHazards;
import com.ay.hazards.mines.service.MinesHazardsService;
import com.ay.framework.core.action.BaseAction;

/***
 * 金属非金属矿山表现层
 * @author zhangxiang
 *  2013-04-07
 */
@SuppressWarnings("all")
public class MinesHazardsAction extends BaseAction {
	//金属非金属矿山业务类
	private MinesHazardsService minesHazardsService;
	
	//金属非金属矿山实体类
	private MinesHazards minesHazards;
	
	//当前页码
	private String page;
	
	//每页显示行数
	private String rows;
	
	//排序
	private String sort;
	
	//排序
	private String order;
	
	//金属非金属矿山id
	private String id;
	
	//金属非金属矿山ID
	private String ids;
	
	/***
	 * 新增金属非金属矿山
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			minesHazardsService.insert(minesHazards);
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
	 * 修改金属非金属矿山
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = minesHazardsService.update(minesHazards);
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
	 * 删除金属非金属矿山信息
	 */
	public void deleteByIds() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = minesHazardsService.deleteByIds(idsParam);
		} else {
			flag = minesHazardsService.delete(ids);
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
	 * 删除金属非金属矿山信息
	 */
	public void delete() {
	    OperateInfo operateInfo = new OperateInfo();
	    boolean flag = false;
	    if (ids.contains(",")) {
		String idsParam[] = ids.split(",");
		flag = minesHazardsService.deleteByIds(idsParam);
	    } else {
		flag = minesHazardsService.delete(ids);
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
	 * 金属非金属矿山list方法
	 */
	public void list() {
		DataStore<MinesHazards> dataStore = new DataStore<MinesHazards>();
		//数据分页对象
		Page pageTemp = Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(minesHazards);
		Page resultPage = minesHazardsService.pageQuery(paramMap, pageTemp);
		List<MinesHazards> resultList = (List<MinesHazards>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 根据ID 获取金属非金属矿山对象
	 */
	public void getById() {
		Struts2Utils.renderJson(minesHazardsService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public MinesHazards getMinesHazards() {
		return minesHazards;
	}

	public void setMinesHazards(MinesHazards minesHazards) {
		this.minesHazards = minesHazards;
	}

	public MinesHazardsService getMinesHazardsService() {
		return minesHazardsService;
	}

	public void setMinesHazardsService(MinesHazardsService minesHazardsService) {
		this.minesHazardsService = minesHazardsService;
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
