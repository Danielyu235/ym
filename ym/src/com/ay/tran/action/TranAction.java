package com.ay.tran.action;

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
import com.ay.tran.pojo.Tran;
import com.ay.tran.pojo.TranMonth;
import com.ay.tran.service.TranService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class TranAction extends BaseAction {
	private TranService tranService;
	private Tran tran;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			tranService.insert(tran);
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
		boolean flag = tranService.update(tran);
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
			flag = tranService.delete(idsParam);
		} else {
			flag = tranService.delete(ids);
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
		DataStore<Tran> dataStore = new DataStore<Tran>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(tran);
		Page resultPage = tranService.pageQuery(paramMap, pageTemp);
		List<Tran> resultList = (List<Tran>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
     * 矿车运行周期月统计
     */
    public void getStaff(){
        List<TranMonth> list = tranService.getStaff(tran.getStatisticalTime());
        //计数器
        int index =0;
        String[] temp = new String[list.size()];
        if(list.size()>0){
            //循环读取数据
            for (TranMonth tran : list) {
                String jsonStr = "";
                index +=1;
                jsonStr += "{";
                jsonStr += "type: 'line',";
                jsonStr += "name:'<b style=\"color:white;\">"+tran.getWorkFaceByName()+"</b>',";
                jsonStr += "data: ["+Double.parseDouble(tran.getY())+ "," +Double.parseDouble(tran.getE())+","+Double.parseDouble(tran.getS())+","
                          +Double.parseDouble(tran.getSi())+","+Double.parseDouble(tran.getW())+","+Double.parseDouble(tran.getL())+","+Double.parseDouble(tran.getQ())+","
                          +Double.parseDouble(tran.getB())+","+Double.parseDouble(tran.getJ())+","+Double.parseDouble(tran.getShi())+","+Double.parseDouble(tran.getSy())+","
                          +Double.parseDouble(tran.getSe())+"]";
                jsonStr += "}";
                temp[index -1] = jsonStr;
            }
        }
        Struts2Utils.renderJson(new Object[]{temp},
                EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);
    }
    
    /**
     * 矿车运行周期月统计
     */
    public void getCol(){
        List<TranMonth> list = tranService.getCol(tran.getStatisticalTime());
        //计数器
        int index =0;
        String[] temp = new String[list.size()];
        if(list.size()>0){
            //循环读取数据
            for (TranMonth tran : list) {
                String jsonStr = "";
                index +=1;
                jsonStr += "{";
                jsonStr += "type: 'column',";
                jsonStr += "name:'<b style=\"color:white;\">"+tran.getWorkFaceByName()+"</b>',";
                jsonStr += "data: ["+Double.parseDouble(tran.getY())+ "," +Double.parseDouble(tran.getE())+","+Double.parseDouble(tran.getS())+","
                          +Double.parseDouble(tran.getSi())+","+Double.parseDouble(tran.getW())+","+Double.parseDouble(tran.getL())+","+Double.parseDouble(tran.getQ())+","
                          +Double.parseDouble(tran.getB())+","+Double.parseDouble(tran.getJ())+","+Double.parseDouble(tran.getShi())+","+Double.parseDouble(tran.getSy())+","
                          +Double.parseDouble(tran.getSe())+"]";
                jsonStr += "}";
                temp[index -1] = jsonStr;
            }
        }
        Struts2Utils.renderJson(new Object[]{temp},
                EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);
    }
	
	public void getById() {
		Struts2Utils.renderJson(tranService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public Tran getTran() {
		return tran;
	}

	public void setTran(Tran tran) {
		this.tran = tran;
	}

	public TranService getTranService() {
		return tranService;
	}

	public void setTranService(TranService tranService) {
		this.tranService = tranService;
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
