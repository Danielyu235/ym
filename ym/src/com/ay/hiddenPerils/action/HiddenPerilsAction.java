package com.ay.hiddenPerils.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.elect.pojo.ElectMonth;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.hiddenPerils.pojo.HiddenPerils;
import com.ay.hiddenPerils.pojo.PerilsData;
import com.ay.hiddenPerils.service.HiddenPerilsService;

@SuppressWarnings("all")
public class HiddenPerilsAction extends BaseAction {
	private HiddenPerilsService hiddenPerilsService;
	private HiddenPerils hiddenPerils;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	private PerilsData perilsData;
	
	//安全管理主题拼图字段
	private String discoveryTime;
	
	public String getDiscoveryTime()
    {
        return discoveryTime;
    }

    public void setDiscoveryTime(String discoveryTime)
    {
        this.discoveryTime = discoveryTime;
    }

    public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			hiddenPerilsService.insert(hiddenPerils);
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
		boolean flag = hiddenPerilsService.update(hiddenPerils);
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
	 * 审核隐患
	 */
	public void updatePerils() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = hiddenPerilsService.updatePerils(perilsData);
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
			flag = hiddenPerilsService.delete(idsParam);
		} else {
			flag = hiddenPerilsService.delete(ids);
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
		DataStore<HiddenPerils> dataStore = new DataStore<HiddenPerils>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(hiddenPerils);
		Page resultPage = hiddenPerilsService.pageQuery(paramMap, pageTemp);
		List<HiddenPerils> resultList = (List<HiddenPerils>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	public void listPerils() {
		DataStore<HiddenPerils> dataStore = new DataStore<HiddenPerils>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(hiddenPerils);
		Page resultPage = hiddenPerilsService.pageQueryPerils(paramMap, pageTemp);
		List<HiddenPerils> resultList = (List<HiddenPerils>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	public void listPerils2() {
		DataStore<HiddenPerils> dataStore = new DataStore<HiddenPerils>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(hiddenPerils);
		Page resultPage = hiddenPerilsService.pageQueryPerils2(paramMap, pageTemp);
		List<HiddenPerils> resultList = (List<HiddenPerils>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 按隐患类型饼图统计
	 */
    public void getPie(){
       Map paramMap = new HashMap();
       if(discoveryTime!=null && !"".equals(discoveryTime)){
           paramMap.put("discoveryTime", discoveryTime);
       }else{
           Date d = new Date();
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
           String dateNowStr = sdf.format(d);
           paramMap.put("discoveryTime", dateNowStr);
       }
       List result = hiddenPerilsService.getPie(paramMap);
       String json = new JsonMapper().toJson(result);
       Struts2Utils.renderText(json, EncodingHeaderUtil.HEADERENCODING,EncodingHeaderUtil.CACHEENCODING);
    }
	public void getById() {
		Struts2Utils.renderJson(hiddenPerilsService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public HiddenPerils getHiddenPerils() {
		return hiddenPerils;
	}

	public void setHiddenPerils(HiddenPerils hiddenPerils) {
		this.hiddenPerils = hiddenPerils;
	}

	public HiddenPerilsService getHiddenPerilsService() {
		return hiddenPerilsService;
	}

	public void setHiddenPerilsService(HiddenPerilsService hiddenPerilsService) {
		this.hiddenPerilsService = hiddenPerilsService;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public PerilsData getPerilsData() {
		return perilsData;
	}

	public void setPerilsData(PerilsData perilsData) {
		this.perilsData = perilsData;
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
