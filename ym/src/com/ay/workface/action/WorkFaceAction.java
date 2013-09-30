package com.ay.workface.action;

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
import com.ay.workface.pojo.WorkFace;
import com.ay.workface.service.WorkFaceService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class WorkFaceAction extends BaseAction {
	private WorkFaceService workFaceService;
	private WorkFace workFace;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			workFaceService.insert(workFace);
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
		boolean flag = workFaceService.update(workFace);
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
			flag = workFaceService.delete(idsParam);
		} else {
			flag = workFaceService.delete(ids);
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
		DataStore<WorkFace> dataStore = new DataStore<WorkFace>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(workFace);
		Page resultPage = workFaceService.pageQuery(paramMap, pageTemp);
		List<WorkFace> resultList = (List<WorkFace>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(workFaceService.getById(id),EncodingHeaderUtil.HEADERENCODING,EncodingHeaderUtil.CACHEENCODING);		
	}
	
	/**
     * 导出方法
     * @return exp
     */
     public String exp(){
            String where = " where 1=1 and [STATUS]='1' ";
            Map map = BeanUtil.Bean2Map(workFace);
            String id = request.getParameter("id");
            String repace_id = id.replace("''","");
            if(repace_id.length()>0){
                where += " and id in ("+id+")";
            }
            excelQuerySql = " SELECT NUMBER,WORK_FACE_NAME,WORK_FACE_PLACE,WORK_FACE_CASE,DANGEROUS,LOSS,STEP,BZ FROM TB_WORK_FACE " + where;
            System.out.println(excelQuerySql);
            excelSheetName = "煤矿危险源库";
            excelHeads = new String[]
            { "工作面编号", "工作面名称", "工作面位置", "工作面情况", "危险源", "可能造成的伤害和损失", "当事人应该采取的措施", "备注" };
            return "exp";
        }
	
    public WorkFace getWorkFace() {
		return workFace;
	}

	public void setWorkFace(WorkFace workFace) {
		this.workFace = workFace;
	}

	public WorkFaceService getWorkFaceService() {
		return workFaceService;
	}

	public void setWorkFaceService(WorkFaceService workFaceService) {
		this.workFaceService = workFaceService;
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
