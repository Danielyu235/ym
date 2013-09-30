package com.ay.hazards.all.action;

import java.util.ArrayList;
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
import com.ay.hazards.all.pojo.Hazards;
import com.ay.hazards.all.pojo.HazardsResult;
import com.ay.hazards.all.service.HazardsResultService;
import com.ay.hazards.all.service.HazardsService;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IdentificationFactory;
import com.ay.hazards.identification.IdentificationResult;

@SuppressWarnings("all")
public class HazardsAction extends BaseAction {
    private HazardsService hazardsService;
    private HazardsResultService hazardsResultService;
    private Hazards hazards;
    private String page;
    private String rows;
    private String sort;
    private String order;
    private String id;
    private String ids;
    private String types;
    private String isMajor;
    /**
     * 辨识页面list(所有危险源数据)
     * @return void
     */
    public void list() {
	DataStore<Hazards> dataStore = new DataStore<Hazards>();
	Page pageTemp = Page.getNewInstance(page, rows);
	Map paramMap = BeanUtil.Bean2Map(hazards);
	Page resultPage = hazardsService.pageQuery(paramMap, pageTemp);
	List<Hazards> resultList = (List<Hazards>) resultPage.getCollection();
	dataStore.setTotal(new Long(resultPage.getCount()));
	dataStore.setRows(resultList);
	String json = new JsonMapper().toJson(dataStore);
	Struts2Utils.renderText(json);
    }

    /**
     * 批量辨识方法
     * 
     * @return void
     */
    public void identificationBatch() {
	OperateInfo operateInfo = new OperateInfo();
	Map paramMap = BeanUtil.Bean2Map(hazards);
	List<Hazards> list = hazardsService.query(paramMap);
	List<Hazards> results = new ArrayList<Hazards>();
	int successNum = 0;
	int failNum = 0;
	int errorNum = 0;
	long startTime = System.currentTimeMillis();
	for (Hazards ha : list) {
	    IHazards hazards = hazardsService.findHazards(ha.getNameSpace(),
		    ha.getId());
	    IdentificationResult result = IdentificationFactory
		    .identification(hazards);
	    HazardsResult hr = new HazardsResult();
	    hr.setHazardsId(ha.getId());
	    hr.setInfo(result.getInfo());
	    hr.setReason(result.getReason());
	    hazardsResultService.insertOrUpdate(hr);
	    if (result.getInfo().equals(IdentificationResult.YES)) {
		successNum++;
	    } else if (result.getInfo().equals(IdentificationResult.NO)) {
		failNum++;
	    } else {
		errorNum++;
		ha.setInfo(result.getInfo());
		ha.setReason(result.getReason());
		results.add(ha);
	    }
	}
	long endTime = System.currentTimeMillis();
	float time = (endTime - startTime)/1000f;//秒
	String json = new JsonMapper().toJson(new Object[]{time, successNum, failNum, errorNum, results});
	Struts2Utils.renderText(json);
    }

    /**
     * 辨识方法
     * 
     * @return void
     */
    public void identification() {
	OperateInfo operateInfo = new OperateInfo();
	int successNum = 0;
	int errorNum = 0;
	if (ids.contains(",")) {
	    String idsParam[] = ids.split(",");
	    String typesParam[] = types.split(",");
	    for (int i = 0; i < idsParam.length; i++) {
		IHazards hazards = hazardsService.findHazards(typesParam[i],
			idsParam[i]);
		IdentificationResult result = IdentificationFactory
			.identification(hazards);
		HazardsResult hr = new HazardsResult();
		hr.setHazardsId(idsParam[i]);
		hr.setInfo(result.getInfo());
		hr.setReason(result.getReason());
		hazardsResultService.insertOrUpdate(hr);
		if (!result.getInfo().equals(IdentificationResult.ERROR)) {
		    successNum++;
		} else {
		    errorNum++;
		}
	    }
	    operateInfo.setOperateMessage("辨识成功数量:" + successNum
		    + "<BR/>辨识失败数量:" + errorNum);
	} else {
	    IHazards hazards = hazardsService.findHazards(types, ids);
	    IdentificationResult result = IdentificationFactory
		    .identification(hazards);
	    HazardsResult hr = new HazardsResult();
	    hr.setHazardsId(ids);
	    hr.setInfo(result.getInfo());
	    hr.setReason(result.getReason());
	    hazardsResultService.insertOrUpdate(hr);
	    if (!result.getInfo().equals(IdentificationResult.ERROR)) {
		operateInfo.setOperateMessage("辨识成功");
	    } else {
		operateInfo.setOperateMessage("辨识失败");
	    }
	}
	operateInfo.setOperateSuccess(true);
	String json = new JsonMapper().toJson(operateInfo);
	Struts2Utils.renderText(json);
    }

    /**
     * 手动设置重大 非重大危险源方法
     * 
     * @return void
     */
    public void updateIsMajor() {
	OperateInfo operateInfo = new OperateInfo();
	String info = IdentificationResult.YES;
	if (isMajor != null && isMajor.equals("no")) {
	    info = IdentificationResult.NO;
	}
	try {
	    if (ids.contains(",")) {
		String idsParam[] = ids.split(",");
		for (int i = 0; i < idsParam.length; i++) {
		    HazardsResult hr = new HazardsResult();
		    hr.setHazardsId(idsParam[i]);
		    hr.setInfo(info);
		    hr.setReason(null);
		    hazardsResultService.insertOrUpdate(hr);
		}
	    } else {
		HazardsResult hr = new HazardsResult();
		hr.setHazardsId(ids);
		hr.setInfo(info);
		hr.setReason(null);
		hazardsResultService.insertOrUpdate(hr);
	    }
	    operateInfo.setOperateMessage("设置成功");
	    operateInfo.setOperateSuccess(true);
	} catch (Exception e) {
	    operateInfo.setOperateMessage("设置失败");
	    operateInfo.setOperateSuccess(false);
	    e.printStackTrace();
	}
	operateInfo.setOperateSuccess(true);
	String json = new JsonMapper().toJson(operateInfo);
	Struts2Utils.renderText(json);
    }

    public void getById() {
	Struts2Utils.renderJson(hazardsService.getById(id),
		EncodingHeaderUtil.HEADERENCODING,
		EncodingHeaderUtil.CACHEENCODING);
    }

    public Hazards getHazards() {
	return hazards;
    }

    public void setHazards(Hazards hazards) {
	this.hazards = hazards;
    }

    public HazardsService getHazardsService() {
	return hazardsService;
    }

    public void setHazardsService(HazardsService hazardsService) {
	this.hazardsService = hazardsService;
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

    public String getTypes() {
	return types;
    }

    public void setTypes(String types) {
	this.types = types;
    }

    public HazardsResultService getHazardsResultService() {
	return hazardsResultService;
    }

    public void setHazardsResultService(
	    HazardsResultService hazardsResultService) {
	this.hazardsResultService = hazardsResultService;
    }

    public String getIsMajor() {
	return isMajor;
    }

    public void setIsMajor(String isMajor) {
	this.isMajor = isMajor;
    }

}
