package com.ay.knowlbase.msds.action;

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
import com.ay.knowlbase.msds.pojo.MsdsKnowlbase;
import com.ay.knowlbase.msds.service.MsdsKnowlbaseService;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 危化品特征库Action
 * @author yuzhou
 * @version 2013-3-20
 */
@SuppressWarnings("all")
public class MsdsKnowlbaseAction extends BaseAction {
    /** 危化品特征库的服务类 */
	private MsdsKnowlbaseService tbMsdsService;
	/** 危化品特征库的实体类 */
	private MsdsKnowlbase tbMsds;
	/** 分页对象 */
	private String page;
	/** 每页显示的数量 */
	private String rows;
	private String sort;
	private String order;
	/** 危化品特征库ID */
	private String id;
	/** ID的集合 */
	private String ids;
	/**
     * 添加危化品特征库方法 
     * @return void
     */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		tbMsds.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbMsds.setCreateTime(new Date());
		try {
		    //执行添加
			tbMsdsService.insert(tbMsds);
			//返回信息添加成功结果
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
     * 更新危化品特征库方法 
     * @return void
     */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		tbMsds.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbMsds.setUpdateTime(new Date());
		//执行更新危化品特征库操作
		boolean flag = tbMsdsService.update(tbMsds);
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
		//执行删除操作
		boolean flag = tbMsdsService.deleteByIds(idsParam);
		if (flag)
		{
		    operateInfo.setOperateMessage("删除成功！");
		    operateInfo.setOperateSuccess(true);
		}else{
		    operateInfo.setOperateMessage("删除失败");
		    operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	/**
     * 删除危化品特征库方法 
     * @return void
     */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = tbMsdsService.delete(idsParam);
		} else {
			flag = tbMsdsService.delete(ids);
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
		DataStore<MsdsKnowlbase> dataStore = new DataStore<MsdsKnowlbase>();
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
		Map paramMap = BeanUtil.Bean2Map(tbMsds);
		Page resultPage = tbMsdsService.pageQuery(paramMap, pageTemp);
		List<MsdsKnowlbase> resultList = (List<MsdsKnowlbase>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		//返回结果
		Struts2Utils.renderText(json);
	}
	/**
     * 危化品特征库查看方法 
     * @return void
     */
	public void getById() {
		Struts2Utils.renderJson(tbMsdsService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	

    public MsdsKnowlbase getTbMsds() {
		return tbMsds;
	}

	public void setTbMsds(MsdsKnowlbase tbMsds) {
		this.tbMsds = tbMsds;
	}

	public MsdsKnowlbaseService getTbMsdsService() {
		return tbMsdsService;
	}

	@Autowired
	public void setTbMsdsService(MsdsKnowlbaseService tbMsdsService) {
		this.tbMsdsService = tbMsdsService;
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
