package com.ay.elect.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.ay.elect.pojo.Elect;
import com.ay.elect.pojo.ElectMonth;
import com.ay.elect.service.ElectService;
import com.ay.framework.core.action.BaseAction;
import com.ay.themezt.coalzt.pojo.CoalMiningGraph;

@SuppressWarnings("all")
public class ElectAction extends BaseAction {
	private ElectService electService;
	private Elect elect;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			electService.insert(elect);
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
		boolean flag = electService.update(elect);
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
			flag = electService.delete(idsParam);
		} else {
			flag = electService.delete(ids);
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
		DataStore<Elect> dataStore = new DataStore<Elect>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		
		//获取当前日期，格式：yyyy-MM
		//Calendar cal = Calendar.getInstance();//使用日历类
		//int year = cal.get(Calendar.YEAR);//得到年份
		//int month = cal.get(Calendar.MONTH)+1;//得到月份
		//String ysrq = year+"-"+month;
		//System.out.println("当前年月："+ysrq);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String dateNowStr = sdf.format(d);
		if(elect.getYsrq()==null || "".equals(elect.getYsrq())){
		    elect.setYsrq(dateNowStr);
		}
		Map paramMap = BeanUtil.Bean2Map(elect);
		Page resultPage = electService.pageQuery(paramMap, pageTemp);
		List<Elect> resultList = (List<Elect>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 机电系统部门峰谷比月统计
	 */
	public void getStaff(){
        List<ElectMonth> list = electService.getStaff(elect.getYsrq());
        //计数器
        int index =0;
        String[] temp = new String[list.size()];
        if(list.size()>0){
            //循环读取数据
            for (ElectMonth elect : list) {
                String jsonStr = "";
                index +=1;
                jsonStr += "{";
                jsonStr += "type: 'line',";
                jsonStr += "name:'<b style=\"color:white;\">"+elect.getXmType()+"</b>',";
                jsonStr += "data: ["+Double.parseDouble(elect.getY())+ "," +Double.parseDouble(elect.getE())+","+Double.parseDouble(elect.getS())+","
                          +Double.parseDouble(elect.getSi())+","+Double.parseDouble(elect.getW())+","+Double.parseDouble(elect.getL())+","+Double.parseDouble(elect.getQ())+","
                          +Double.parseDouble(elect.getB())+","+Double.parseDouble(elect.getJ())+","+Double.parseDouble(elect.getShi())+","+Double.parseDouble(elect.getSy())+","
                          +Double.parseDouble(elect.getSe())+"]";
                jsonStr += "}";
                temp[index -1] = jsonStr;
            }
        }
        Struts2Utils.renderJson(new Object[]{temp},
                EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);
    }
	
	/**
     * 机电系统部门电耗月统计
     */
    public void getCol(){
        List<ElectMonth> list = electService.getCol(elect.getYsrq());
        //计数器
        int index =0;
        String[] temp = new String[list.size()];
        if(list.size()>0){
            //循环读取数据
            for (ElectMonth elect : list) {
                String jsonStr = "";
                index +=1;
                jsonStr += "{";
                jsonStr += "type: 'column',";
                jsonStr += "name:'<b style=\"color:white;\">"+elect.getXmType()+"</b>',";
                jsonStr += "data: ["+Double.parseDouble(elect.getY())+ "," +Double.parseDouble(elect.getE())+","+Double.parseDouble(elect.getS())+","
                          +Double.parseDouble(elect.getSi())+","+Double.parseDouble(elect.getW())+","+Double.parseDouble(elect.getL())+","+Double.parseDouble(elect.getQ())+","
                          +Double.parseDouble(elect.getB())+","+Double.parseDouble(elect.getJ())+","+Double.parseDouble(elect.getShi())+","+Double.parseDouble(elect.getSy())+","
                          +Double.parseDouble(elect.getSe())+"]";
                jsonStr += "}";
                temp[index -1] = jsonStr;
            }
        }
        Struts2Utils.renderJson(new Object[]{temp},
                EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);
    }
	
	public void getById() {
		Struts2Utils.renderJson(electService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public Elect getElect() {
		return elect;
	}

	public void setElect(Elect elect) {
		this.elect = elect;
	}

	public ElectService getElectService() {
		return electService;
	}

	public void setElectService(ElectService electService) {
		this.electService = electService;
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
