package com.ay.emergency.resource.headquarters.action;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.InvalidSessionException;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.DateUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.util.StringUtil;
import com.ay.emergency.resource.headquarters.pojo.Headquarters;
import com.ay.emergency.resource.headquarters.pojo.Hperson;
import com.ay.emergency.resource.headquarters.service.HeadquartersService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class HeadquartersAction extends BaseAction {
	private HeadquartersService headquartersService;
	private Headquarters headquarters;
	private Hperson hperson;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			headquartersService.insert(headquarters);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = headquartersService.update(headquarters);
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
	
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = headquartersService.delete(idsParam);
		} else {
			flag = headquartersService.delete(ids);
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
	
	public void list() {		
		DataStore<Headquarters> dataStore = new DataStore<Headquarters>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(headquarters);
		Page resultPage = headquartersService.pageQuery(paramMap, pageTemp);
		List<Headquarters> resultList = (List<Headquarters>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);	
	}
	
	public void plist() {		
		DataStore<Hperson> dataStore = new DataStore<Hperson>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		List<Hperson> resultList = headquartersService.getHpersonList(hperson);
		dataStore.setTotal((long)resultList.size());
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);		
	}
	
	public void addHperson() {
		hperson.setId(StringUtil.getUUID());
		String uid = (String) SecurityUtils.getSubject().getSession().getAttribute("user_id");
		Date time = DateUtil.getDateTime();
		hperson.setCreated(uid);
		hperson.setCreateTime(time);
		hperson.setUpdated(uid);
		hperson.setUpdateTime(time);
		hperson.setStatus("1");
		int count = headquartersService.addHperson(hperson);
		if(count > 0){
			Struts2Utils.renderText("添加成功！");
		}else{
			Struts2Utils.renderText("添加失败！");
		}		
	}
	
	public void pdel(){		
		try {
			String[] ids = id.split(",");
			int row = 0;
			for(String id : ids){
				row += headquartersService.delHperson(id);
			}
			Struts2Utils.renderText("删除成功！");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updatePerson(){
		try {
			String uid = (String) SecurityUtils.getSubject().getSession().getAttribute("user_id");
			Date time = DateUtil.getDateTime();
			hperson.setUpdated(uid);
			hperson.setUpdateTime(time);
			int row = headquartersService.updateHperson(hperson);
			if(row > 0){
				Struts2Utils.renderText("更新成功！");
			}else{
				Struts2Utils.renderText("更新失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void getById() {
		Struts2Utils.renderJson(headquartersService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public Hperson getHperson() {
		return hperson;
	}

	public void setHperson(Hperson hperson) {
		this.hperson = hperson;
	}

	public Headquarters getHeadquarters() {
		return headquarters;
	}

	public void setHeadquarters(Headquarters headquarters) {
		this.headquarters = headquarters;
	}

	public HeadquartersService getHeadquartersService() {
		return headquartersService;
	}

	public void setHeadquartersService(HeadquartersService headquartersService) {
		this.headquartersService = headquartersService;
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
