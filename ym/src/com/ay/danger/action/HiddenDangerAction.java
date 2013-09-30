package com.ay.danger.action;

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
import com.ay.danger.pojo.HiddenDanger;
import com.ay.danger.pojo.HiddenDangerMonth;
import com.ay.danger.service.HiddenDangerService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class HiddenDangerAction extends BaseAction {
	private HiddenDangerService hiddenDangerService;
	private HiddenDanger hiddenDanger;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			hiddenDangerService.insert(hiddenDanger);
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
		boolean flag = hiddenDangerService.update(hiddenDanger);
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
			flag = hiddenDangerService.delete(idsParam);
		} else {
			flag = hiddenDangerService.delete(ids);
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
		DataStore<HiddenDanger> dataStore = new DataStore<HiddenDanger>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(hiddenDanger);
		Page resultPage = hiddenDangerService.pageQuery(paramMap, pageTemp);
		List<HiddenDanger> resultList = (List<HiddenDanger>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
     * 安全主题系统月统计
     */
    public void getStaff(){
        List<HiddenDangerMonth> list = hiddenDangerService.getStaff(hiddenDanger.getDiscoveryTime());
        //计数器
        int index =0;
        String[] temp = new String[list.size()];
        if(list.size()>0){
            //循环读取数据
            for (HiddenDangerMonth hiddenDanger : list) {
                String jsonStr = "";
                index +=1;
                jsonStr += "{";
                jsonStr += "type: 'column',";
                jsonStr += "name:'<b style=\"color:white;\">"+hiddenDanger.getSpecialtyType()+"</b>',";
                jsonStr += "data: ["+Integer.parseInt(hiddenDanger.getY())+ "," +Integer.parseInt(hiddenDanger.getE())+","+Integer.parseInt(hiddenDanger.getS())+","
                          +Integer.parseInt(hiddenDanger.getSi())+","+Integer.parseInt(hiddenDanger.getW())+","+Integer.parseInt(hiddenDanger.getL())+","+Integer.parseInt(hiddenDanger.getQ())+","
                          +Integer.parseInt(hiddenDanger.getB())+","+Integer.parseInt(hiddenDanger.getJ())+","+Integer.parseInt(hiddenDanger.getShi())+","+Integer.parseInt(hiddenDanger.getSy())+","
                          +Integer.parseInt(hiddenDanger.getSe())+"]";
                jsonStr += "}";
                temp[index -1] = jsonStr;
            }
        }
        Struts2Utils.renderJson(new Object[]{temp},
                EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);
    }
	
	public void getById() {
		Struts2Utils.renderJson(hiddenDangerService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public HiddenDanger getHiddenDanger() {
		return hiddenDanger;
	}

	public void setHiddenDanger(HiddenDanger hiddenDanger) {
		this.hiddenDanger = hiddenDanger;
	}

	public HiddenDangerService getHiddenDangerService() {
		return hiddenDangerService;
	}

	public void setHiddenDangerService(HiddenDangerService hiddenDangerService) {
		this.hiddenDangerService = hiddenDangerService;
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
