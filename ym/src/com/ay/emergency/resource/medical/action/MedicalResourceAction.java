package com.ay.emergency.resource.medical.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.emergency.resource.medical.pojo.MedicalResource;
import com.ay.emergency.resource.medical.service.MedicalResourceService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.util.BeanUtil;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *医疗保障表现层
 * @author yuzhou
 * 2013年3月19日 
 *
 */
@SuppressWarnings("all")
public class MedicalResourceAction extends BaseAction {
	private MedicalResourceService rescueMedicalService;
	private MedicalResource rescueMedical;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	/**
	 * 新增医疗保障
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		rescueMedical.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		rescueMedical.setCreateTime(new Date());
		try {
			rescueMedicalService.insert(rescueMedical);
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
	 * 修改医疗保障
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		rescueMedical.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		rescueMedical.setUpdateTime(new Date());
		boolean flag = rescueMedicalService.update(rescueMedical);
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
		boolean flag = rescueMedicalService.deleteByIds(idsParam);
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
	 * 根据ID删除医疗保障
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = rescueMedicalService.delete(idsParam);
		} else {
			flag = rescueMedicalService.delete(ids);
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
		DataStore<MedicalResource> dataStore = new DataStore<MedicalResource>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(rescueMedical);
		Page resultPage = rescueMedicalService.pageQuery(paramMap, pageTemp);
		List<MedicalResource> resultList = (List<MedicalResource>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 根据ID查询医疗保障
	 */
	public void getById() {
		Struts2Utils.renderJson(rescueMedicalService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}

	public MedicalResourceService getRescueMedicalService() {
		return rescueMedicalService;
	}

	public void setRescueMedicalService(MedicalResourceService rescueMedicalService) {
		this.rescueMedicalService = rescueMedicalService;
	}

	public MedicalResource getRescueMedical() {
		return rescueMedical;
	}

	public void setRescueMedical(MedicalResource rescueMedical) {
		this.rescueMedical = rescueMedical;
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
