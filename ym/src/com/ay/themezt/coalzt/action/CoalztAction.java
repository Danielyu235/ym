package com.ay.themezt.coalzt.action;

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
import com.ay.themezt.coalzt.pojo.CoalMiningGraph;
import com.ay.themezt.coalzt.pojo.Coalzt;
import com.ay.themezt.coalzt.service.CoalztService;

@SuppressWarnings("all")
public class CoalztAction extends BaseAction {
	private CoalztService coalztService;
	private Coalzt coalzt;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			coalztService.insert(coalzt);
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
		boolean flag = coalztService.update(coalzt);
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
			flag = coalztService.delete(idsParam);
		} else {
			flag = coalztService.delete(ids);
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
		DataStore<Coalzt> dataStore = new DataStore<Coalzt>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(coalzt);
		Page resultPage = coalztService.pageQuery(paramMap, pageTemp);
		List<Coalzt> resultList = (List<Coalzt>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(coalztService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	/**
	 * 查询一个月各队的回采率
	 */
	public void getMonthlyData(){	
		String month = coalzt.getMonth();//月份	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("month", month);
		List<Coalzt> list = coalztService.getMonthlyData(map);
		int length = list.size();
		String[] groups = new String[length];
		String[] recoverys = new String[length];
		String[] months = new String[]{month};
		for (int i = 0; i < length; i++) {
			Coalzt coalzt = list.get(i);
			groups[i] = coalzt.getGroup_type();
			recoverys[i] = coalzt.getRecoveryRatio();
		}
		Object[] result = new Object[]{groups,recoverys,months};
		Struts2Utils.renderJson(result,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
	
	/**
	 * 查询年度中各月各队的回采率
	 */
	public void getYearData(){		
		String year = coalzt.getMonth();//年份
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		List<Coalzt> list = coalztService.getMonthlyData(map);
		int length = list.size();
		float[] recovery_1 = new float[list.size() / 4];
		float[] recovery_2 = new float[list.size() / 4];
		float[] recovery_3 = new float[list.size() / 4];
		float[] recovery_4 = new float[list.size() / 4];
		String[] months = new String[list.size() / 4];
		int a=0,b=0,c=0,d=0;
		for (int i = 0; i < length; i++) {
			Coalzt coalzt = list.get(i);
			String group = coalzt.getGroup_type();
			if(group.equals("综一队")){
				recovery_1[a] = Float.parseFloat(coalzt.getRecoveryRatio());
				months[a++] = coalzt.getMonth();
			}else if(group.equals("综二队")){
				recovery_2[b++] = Float.parseFloat(coalzt.getRecoveryRatio());
			}else if(group.equals("综三队")){
				recovery_3[c++] = Float.parseFloat(coalzt.getRecoveryRatio());
			}else if(group.equals("综四队")){
				recovery_4[d++] = Float.parseFloat(coalzt.getRecoveryRatio());
			}
		}
		Object[] result = new Object[]{recovery_1,recovery_2,recovery_3,recovery_4,months};
		Struts2Utils.renderJson(result,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	/**
	 * 查询品种煤比例
	 */
	public void getKindData(){
		String month = coalzt.getMonth();
		String group = coalzt.getGroup_type();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("month", month);
		if(!group.equals("全部队组")){
			map.put("group", group);			
		}
		List<Coalzt> list = coalztService.getKindData(map);
		
		double coalOne = 0,coalTwo = 0,block = 0,small = 0;
		int length = list.size();
		Coalzt coalzt = null;
		for (int i = 0; i < length; i++) {
			coalzt = list.get(i);
			coalOne += Double.parseDouble(coalzt.getBoutiqueCoalOne());
			coalTwo += Double.parseDouble(coalzt.getBoutiqueCoalTwo());
			block += Double.parseDouble(coalzt.getCarbonBlock());
			small += Double.parseDouble(coalzt.getSmalls());
		}
		Object[] result = new Object[]{coalOne, coalTwo, block, small};
		Struts2Utils.renderJson(result,
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
	
	public void getYieldData(){
		try {
			String month = coalzt.getMonth();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("month", month);
			List<Coalzt> list = coalztService.getYieldData(map);
			
			int length = list.size();
			String[] group = new String[length];
			double[] yield = new double[length];
			Coalzt coalzt = null;
			for (int i = 0; i < length; i++) {
				coalzt = list.get(i);
				group[i] = coalzt.getGroup_type();
				yield[i] = Double.parseDouble(coalzt.getPlanYield());
			}
			Object[] result = new Object[]{group, yield};
			Struts2Utils.renderJson(result,
					EncodingHeaderUtil.HEADERENCODING,
					EncodingHeaderUtil.CACHEENCODING);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 获取掘进采煤产量数据
	 */
	public void getTunnlle(){
		try {
			List<Coalzt> list = coalztService.getTunne(coalzt.getMonth());
			//队组
			String[] group=new String[list.size()];
			
			//计划
			int[] plan=new int[list.size()];
			
			//日产
			int[] daily=new int[list.size()];
			
			//奋斗计划
			int[] struggle=new int[list.size()];
			for (int i = 0; i < list.size(); i++) {
				Coalzt coalzt = list.get(i);
				group[i] =coalzt.getGroup_type();
				plan[i] = Integer.parseInt(coalzt.getPlanYield());
				daily[i] = Integer.parseInt(coalzt.getDailyOutput());
				struggle[i] = Integer.parseInt(coalzt.getStruggleYield());
			}
			Struts2Utils.renderJson(new Object[]{group,plan,daily,struggle},
					EncodingHeaderUtil.HEADERENCODING,
					EncodingHeaderUtil.CACHEENCODING);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 掘进进尺深度
	 */
	public void getTunnlleDepth(){
		try {
			List<Coalzt> list = coalztService.getTunne(coalzt.getMonth());
			//队组
			String[] group=new String[list.size()];
			
			//计划
			Double[] plan=new Double[list.size()];
			
			//日产
			Double[] daily=new Double[list.size()];
			
			//奋斗计划
			Double[] struggle=new Double[list.size()];
			for (int i = 0; i < list.size(); i++) {
				Coalzt coalzt = list.get(i);
				group[i] =coalzt.getGroup_type();
				plan[i] = Double.parseDouble(coalzt.getFootagePlan());
				daily[i] = Double.parseDouble(coalzt.getFootageDaily());
				struggle[i] = Double.parseDouble(coalzt.getFstruggleYield());
			}
			Struts2Utils.renderJson(new Object[]{group,plan,daily,struggle},
					EncodingHeaderUtil.HEADERENCODING,
					EncodingHeaderUtil.CACHEENCODING);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/***
	 * 掘进人员效率
	 */
	public void getStaff(){
		List<CoalMiningGraph> list = coalztService.getStaff(coalzt.getMonth());
		//计数器
		int index =0;
		String[] temp = new String[list.size()];
		if(list.size()>0){
			//循环读取数据
			for (CoalMiningGraph coal : list) {
				String jsonStr = "";
				index +=1;
				jsonStr += "{";
				jsonStr += "type: 'line',";
				jsonStr += "name:'<b style=\"color:white;\">"+coal.getGroup_type()+"</b>',";
				jsonStr += "data: ["+Double.parseDouble(coal.getY())+ "," +Double.parseDouble(coal.getE())+","+Double.parseDouble(coal.getS())+","
						  +Double.parseDouble(coal.getSi())+","+Double.parseDouble(coal.getW())+","+Double.parseDouble(coal.getL())+","+Double.parseDouble(coal.getQ())+","
						  +Double.parseDouble(coal.getB())+","+Double.parseDouble(coal.getJ())+","+Double.parseDouble(coal.getShi())+","+Double.parseDouble(coal.getSy())+","
						  +Double.parseDouble(coal.getSe())+"]";
				jsonStr += "}";
				temp[index -1] = jsonStr;
			}
		}
		Struts2Utils.renderJson(new Object[]{temp},
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
	
	public void yearChartsData(){
		try {
			String month = coalzt.getMonth();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("month", month);
			
			List<Coalzt> list = coalztService.yearChartsData(map);
			
			int length = list.size();
			String[] months = new String[length];
			int[] coalOne = new int[length];
			int[] coalTwo = new int[length];
			int[] block = new int[length];
			int[] smalls = new int[length];
			Coalzt coalzt = null;
			for (int i = 0; i < length; i++) {
				coalzt = list.get(i);
				months[i] = coalzt.getMonth();
				coalOne[i] = Integer.parseInt(coalzt.getBoutiqueCoalOne());
				coalTwo[i] = Integer.parseInt(coalzt.getBoutiqueCoalTwo());
				block[i] = Integer.parseInt(coalzt.getCarbonBlock());
				smalls[i] = Integer.parseInt(coalzt.getSmalls());
			}
			Object[] result = new Object[]{months, coalOne, coalTwo, block, smalls};
			Struts2Utils.renderJson(result,
					EncodingHeaderUtil.HEADERENCODING,
					EncodingHeaderUtil.CACHEENCODING);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
	
    public Coalzt getCoalzt() {
		return coalzt;
	}

	public void setCoalzt(Coalzt coalzt) {
		this.coalzt = coalzt;
	}

	public CoalztService getCoalztService() {
		return coalztService;
	}

	public void setCoalztService(CoalztService coalztService) {
		this.coalztService = coalztService;
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
