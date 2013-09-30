package com.ay.dailyStatus.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.dailyStatus.pojo.DailyStatus;
import com.ay.dailyStatus.service.DailyStatusService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.jfds.dev.pojo.Data;

@SuppressWarnings("all")
public class DailyStatusAction extends BaseAction {
	private DailyStatusService dailyStatusService;
	private DailyStatus dailyStatus;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	private String pid;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			dailyStatusService.insert(dailyStatus);
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
		boolean flag = dailyStatusService.update(dailyStatus);
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
			flag = dailyStatusService.delete(idsParam);
		} else {
			flag = dailyStatusService.delete(ids);
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
		DataStore<DailyStatus> dataStore = new DataStore<DailyStatus>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(dailyStatus);
		Page resultPage = dailyStatusService.pageQuery(paramMap, pageTemp);
		List<DailyStatus> resultList = (List<DailyStatus>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
	    System.out.println(dailyStatusService.getById(id));
	    System.out.println(dailyStatusService.getById(id));
		Struts2Utils.renderJson(dailyStatusService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	public void getPersonTypeText(){
		String[] strArray = pid.split(",");
		List<String> result = dailyStatusService.codeToText(strArray);
		System.out.println(result);
		String json = new JsonMapper().toJson(result);
		Struts2Utils.renderText(json);
	}
	
	public void getColumnData(){		
		String time = dailyStatus.getTime();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("time", time);
		List<DailyStatus> dasList = dailyStatusService.getChartsData(map);			
		List<Data> departmentList = dailyStatusService.getDepartment();
		
		int dLength = departmentList.size();
		String[] departments = new String[dLength];
		int[] counts = new int[dLength];
		int dasLength = dasList.size();
		
		for (int i = 0; i < dasLength; i++) {
			String done = dasList.get(i).getDone();
			for (int j = 0; j < dLength; j++) {
				if(done.equals(departmentList.get(j).getDataName())){
					counts[j] ++;
				}
			}
		}			
		for (int h = 0; h < dLength; h++) {
			departments[h] = departmentList.get(h).getDataName();
		}
		Object[] result = new Object[]{departments, counts};
		Struts2Utils.renderJson(result,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
	
	public void getLineData(){
		String done = dailyStatus.getDone();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("done", done);
		List<DailyStatus> dasList = dailyStatusService.getLineData(map);
		
		int length = dasList.size();
		String[] month = new String[length];
		int[] count = new int[length];
		
		DailyStatus ds = null;
		for (int i = 0; i < length; i++) {
			ds = dasList.get(i);
			month[i] = ds.getTime();
			count[i] = ds.getCount();
		}
		Object[] result = new Object[]{month, count};
		Struts2Utils.renderJson(result,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}


    public DailyStatus getDailyStatus()
    {
        return dailyStatus;
    }

    public void setDailyStatus(DailyStatus dailyStatus)
    {
        this.dailyStatus = dailyStatus;
    }

    public DailyStatusService getDailyStatusService() {
		return dailyStatusService;
	}

	public void setDailyStatusService(DailyStatusService dailyStatusService) {
		this.dailyStatusService = dailyStatusService;
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

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
	
}
