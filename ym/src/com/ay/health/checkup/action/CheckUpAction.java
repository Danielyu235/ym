package com.ay.health.checkup.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.health.checkup.pojo.CheckUp;
import com.ay.health.checkup.service.CheckUpService;

@SuppressWarnings("all")
public class CheckUpAction extends BaseAction {
	private CheckUpService checkUpService;
	private CheckUp checkUp;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	private String pid;
	private String date;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
		   
			checkUpService.insert(checkUp);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
		    e.printStackTrace();
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	public void getView(){
		CheckUp hsp;
		try {
			hsp = checkUpService.getView(pid, date);
			String json = new JsonMapper().toJson(hsp);
			Struts2Utils.renderText(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			boolean flag = checkUpService.update(checkUp);
			if (flag) {
				operateInfo.setOperateMessage("更新成功");
				operateInfo.setOperateSuccess(true);
			} else {
				operateInfo.setOperateMessage("更新失败");
				operateInfo.setOperateSuccess(false);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = checkUpService.delete(idsParam);
		} else {
			flag = checkUpService.delete(ids);
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
		DataStore<CheckUp> dataStore = null;
		try {
			dataStore = new DataStore<CheckUp>();
			Page pageTemp = new Page();
			//当前页 
			int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
			//每页显示条数  
			int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
			int start = (intPage -1) * number;
			pageTemp.setCurrentPage(intPage);
			pageTemp.setRecPerPage(number);
			pageTemp.setFrom(start);
			Map paramMap = BeanUtil.Bean2Map(checkUp);
			Page resultPage = checkUpService.pageQuery(paramMap, pageTemp);
			List<CheckUp> resultList = (List<CheckUp>) resultPage.getCollection();
			dataStore.setTotal(new Long(resultPage.getCount()));
			dataStore.setRows(resultList);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(checkUpService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	public void getByPid() {
        Struts2Utils.renderJson(checkUpService.getPid(checkUp.getPid()),
                EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);      
    }
	
	/**
	 * 获取统计图数据
	 */
	public void charsData(){
		String data = checkUp.getDate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", data);
		List<CheckUp> list = checkUpService.charsData(map);
		
		int length = list.size();
		int blood = 0, pulseRate = 0, electrocardiogram = 0, bc = 0, pneumoconiosis = 0,
			bloodExamination = 0,lkExamination = 0, nervousSystem = 0, thyroid = 0, superficial = 0, skin = 0;
		CheckUp cu = null;
		for (int i = 0; i < length; i++) {
			cu = list.get(i);
			if(Integer.parseInt(cu.getBloodPressureLow()) < 90 || Integer.parseInt(cu.getBloodPressureHigh()) > 130){
				blood ++;
			}
			if(Integer.parseInt(cu.getPulseRate()) < 60 || Integer.parseInt(cu.getPulseRate()) > 100){
				pulseRate ++;
			}
			if(cu.getElectrocardiogram().equals("不正常")){
				electrocardiogram ++;
			}
			if(cu.getBc().equals("不正常")){
				bc ++;
			}
			if(cu.getPneumoconiosis().equals("有")){
				pneumoconiosis ++;
			}
			if(cu.getBloodExamination().equals("不正常")){
				bloodExamination ++;
			}
			if(cu.getLkExamination().equals("不正常")){
				lkExamination ++;
			}
			if(cu.getNervousSystem().equals("不正常")){
				nervousSystem ++;
			}
			if(cu.getThyroid().equals("不正常")){
				thyroid ++;
			}
			if(cu.getSuperficialLymphadenopathy().equals("不正常")){
				superficial ++;
			}
			if(cu.getSkinAndMucosa().equals("不正常")){
				skin ++;
			}
		}
		int[] result = new int[]{blood, pulseRate, electrocardiogram, bc, pneumoconiosis,
				bloodExamination,lkExamination, nervousSystem, thyroid, superficial, skin};
		Struts2Utils.renderJson(result,
                EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);  
	}
	
    public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public CheckUp getCheckUp() {
       
		return checkUp;
	}

	public void setCheckUp(CheckUp checkUp) {
		this.checkUp = checkUp;
	}

	public CheckUpService getCheckUpService() {
		return checkUpService;
	}

	public void setCheckUpService(CheckUpService checkUpService) {
		this.checkUpService = checkUpService;
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
