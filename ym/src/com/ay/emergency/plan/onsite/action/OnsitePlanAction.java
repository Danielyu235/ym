package com.ay.emergency.plan.onsite.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.ay.emergency.plan.onsite.pojo.OnsitePlan;
import com.ay.emergency.plan.onsite.service.OnsitePlanService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;

/**
 * 现场处置应急预案ACTION层
 * @author lihe
 * @version 2013.3.14 
 */
@SuppressWarnings("all")
public class OnsitePlanAction extends BaseAction {
	
	/**现场处置应急预案服务类*/
	private OnsitePlanService tbPlanDisposalService;
	/**现场处置应急预案实体类*/
	private OnsitePlan tbPlanDisposal;
	/** 分页对象 */
	private String page;
	/** 每页显示的数量 */
	private String rows;
	private String sort;
	private String order;
	/** 现场处置ID */
	private String id;
	/** ID的集合 */
	private String ids;
	
	/**
	 * 新增现场处置应急预案
	 * @return void
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		tbPlanDisposal.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbPlanDisposal.setCreateTime(new Date());
		//将当前时间转换成字符串
		Date date=new Date();  
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");  
		String time=formatter.format(date);  
		tbPlanDisposal.setTime(time);
		try {
			tbPlanDisposalService.insert(tbPlanDisposal);
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
	 * 修改现场处置应急预案
	 * @return void
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		tbPlanDisposal.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		tbPlanDisposal.setUpdateTime(new Date());
		boolean flag = tbPlanDisposalService.update(tbPlanDisposal);
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
	 * @return void
	 */
	public void deleteByIds()
	{
		String[] idsParam = ids.split("[,]");
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = tbPlanDisposalService.deleteByIds(idsParam);
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
	 * 删除现场处置应急预案
	 * @return void
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = tbPlanDisposalService.delete(idsParam);
		} else {
			flag = tbPlanDisposalService.delete(ids);
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
	 * @return void
	 */
	public void list() {
		DataStore<OnsitePlan> dataStore = new DataStore<OnsitePlan>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(tbPlanDisposal);
		Page resultPage = tbPlanDisposalService.pageQuery(paramMap, pageTemp);
		List<OnsitePlan> resultList = (List<OnsitePlan>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 根据ID查询现场处置应急预案
	 * @return void
	 */
	public void getById() {
		Struts2Utils.renderJson(tbPlanDisposalService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	

    public OnsitePlan getTbPlanDisposal() {
		return tbPlanDisposal;
	}

	public void setTbPlanDisposal(OnsitePlan tbPlanDisposal) {
		this.tbPlanDisposal = tbPlanDisposal;
	}

	public OnsitePlanService getTbPlanDisposalService() {
		return tbPlanDisposalService;
	}

	@Autowired
	public void setTbPlanDisposalService(OnsitePlanService tbPlanDisposalService) {
		this.tbPlanDisposalService = tbPlanDisposalService;
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
