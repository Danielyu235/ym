package com.ay.emergency.rescue.platform.action;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.emergency.rescue.platform.pojo.PlatformRescue;
import com.ay.emergency.rescue.platform.service.PlatformRescueService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;

@SuppressWarnings("all")
public class PlatformRescueAction extends BaseAction {
	private PlatformRescueService platformRescueService;
	private PlatformRescue platformRescue;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		platformRescue.setOrder(rand());
		try {
			platformRescueService.insert(platformRescue);
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
	/**
	 * 产生随机数
	 */
	private String rand() {
		String[] beforeShuffle = new String[] {"1", "2", "3", "4", "5", "6", "7","8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",   "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",  "W", "X", "Y", "Z" };  
		List list = Arrays.asList(beforeShuffle);  
		Collections.shuffle(list);  
		StringBuilder sb = new StringBuilder();  
	     for (int i = 0; i < list.size(); i++) {  
		       sb.append(list.get(i));  
	     }  
		String afterShuffle = sb.toString();  
		String result = afterShuffle.substring(5, 9);
		 return result;
	}
	
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		platformRescue.setOrder(rand());
		boolean flag = platformRescueService.update(platformRescue);
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
	   public void updateState() {
	        OperateInfo operateInfo = new OperateInfo();
	        platformRescue.setState("3");
	        boolean flag = platformRescueService.update(platformRescue);
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
			flag = platformRescueService.delete(idsParam);
		} else {
			flag = platformRescueService.delete(ids);
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
		DataStore<PlatformRescue> dataStore = new DataStore<PlatformRescue>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(platformRescue);
		Page resultPage = platformRescueService.pageQuery(paramMap, pageTemp);
		List<PlatformRescue> resultList = (List<PlatformRescue>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(platformRescueService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	public void getChartsData(){		
		List<String> typeList = platformRescueService.findType();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accidentOfTime", platformRescue.getAccidentOfTime());
		List<PlatformRescue> platList = platformRescueService.getChartsData(map);
		int typeLength = typeList.size();
		int platLength = platList.size();
		int[] num = new int[typeLength];
		
		String bigText = "";
		for (int i = 0; i < platLength; i++) {
			bigText = platList.get(i).getBigText();
			for (int j = 0; j < typeLength; j++) {				
				if(bigText.equals(typeList.get(j))){
					num[j]++;
				}
			}
		}
		Object[] result = new Object[]{typeList, num};
		Struts2Utils.renderJson(result, EncodingHeaderUtil.HEADERENCODING, EncodingHeaderUtil.CACHEENCODING);			
	}
	
    public PlatformRescue getPlatformRescue() {
		return platformRescue;
	}

	public void setPlatformRescue(PlatformRescue platformRescue) {
		this.platformRescue = platformRescue;
	}

	public PlatformRescueService getPlatformRescueService() {
		return platformRescueService;
	}

	public void setPlatformRescueService(PlatformRescueService platformRescueService) {
		this.platformRescueService = platformRescueService;
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
