package com.ay.jfds.sys.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.common.ITreeService;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.util.StringUtil;
import com.ay.jfds.dev.pojo.Data;
import com.ay.jfds.dev.service.DataService;
import com.ay.jfds.sys.pojo.Department;
import com.ay.jfds.sys.pojo.User;
import com.ay.jfds.sys.service.DepartmentService;
import com.ay.jfds.sys.service.DepartmentTreeService;

/**
 * 部门的action
 * 
 * @author zxy
 *
 */
@SuppressWarnings("all")
public class DepartmentAction extends BaseAction {
	private DepartmentService deptService;
	private Department dept;
	private int page;
	private int rows;
	private String sort;
	private String order;
	private String deptName;
	private String parentId;
	private String id;
	private String ids;
    private ITreeService treeService;
	public DataService getDataService() {
		return dataService;
	}

	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}

	private DataService dataService;
    
    private final static Logger logger = LoggerFactory.getLogger(DepartmentAction.class);

	public void addDept() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			// 封装CommonTree以及ITreeService的时候，当父结点为-1的这个值时，代码是根目录下的根结点
			if (StringUtil.isNullOrEmpty(dept.getParentId())) {
				dept.setParentId("-1");
			}
			deptService.insert(dept);
			//sysDeptIndustryService.insert(dept);
			operateInfo.setOperateMessage("添加部门成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("添加部门失败");
			operateInfo.setOperateSuccess(false);
		}
		Struts2Utils.renderJson(operateInfo, EncodingHeaderUtil.HEADERENCODING);
		
	}
	
	public void updateDept() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = deptService.update(dept);
		//sysDeptIndustryService.insert(dept);
		if (flag) {
			operateInfo.setOperateMessage("更新部门成功");
			operateInfo.setOperateSuccess(true);
		} else {
			operateInfo.setOperateMessage("更新部门失败");
			operateInfo.setOperateSuccess(false);
		}
		
		Struts2Utils.renderJson(operateInfo, EncodingHeaderUtil.HEADERENCODING);
	}
	
	public void deleteDept() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = deptService.delete(dept);
		//sysDeptIndustryService.deleteByDeptId(dept.getId());
		boolean userDelFlag = deptService.deleteUserByDept(dept.getId());
		if (flag && userDelFlag) {
			operateInfo.setOperateMessage("删除部门成功");
			operateInfo.setOperateSuccess(true);
		} else {
			operateInfo.setOperateMessage("删除部门失败");
			operateInfo.setOperateSuccess(false);
		}
		Struts2Utils.renderJson(operateInfo, EncodingHeaderUtil.HEADERENCODING);
	}

    public void deleteDeptById() {
        OperateInfo operateInfo = new OperateInfo();
        boolean flag = deptService.delete(id);
        //sysDeptIndustryService.deleteByDeptId(id);
        if (flag) {
        	boolean userDelFlag = deptService.deleteUserByDept(id);
            operateInfo.setOperateMessage("删除部门成功");
            operateInfo.setOperateSuccess(true);
        } else {
            operateInfo.setOperateMessage("删除部门失败");
            operateInfo.setOperateSuccess(false);
        }
        Struts2Utils.renderJson(operateInfo, EncodingHeaderUtil.HEADERENCODING);
    }
	
	public void pageList() {
		DataStore<Department> dataStore = new DataStore<Department>();
		Page pageTemp = new Page();
		pageTemp.setCurrentPage(this.page);
		pageTemp.setRecPerPage(this.rows);
		Map paramMap = new HashMap();
		paramMap.put("deptName", deptName);
		paramMap.put("parentId", parentId);
		Page resultPage = deptService.pageQuery(paramMap, pageTemp);
		List<Department> resultList = (List<Department>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		Struts2Utils.renderJson(dataStore, EncodingHeaderUtil.HEADERENCODING);
	}
	
	public void pageListUser() {
		DataStore<User> dataStore = new DataStore<User>();
		Page pageTemp = new Page();
		pageTemp.setCurrentPage(this.page);
		pageTemp.setRecPerPage(this.rows);
		Page resultPage = deptService.findAllDepartmentUser(id, pageTemp);
		List<User> list = (List<User>) resultPage.getCollection();
		dataStore.setRows(list);
		dataStore.setTotal(new Long(resultPage.getCount()));
		Struts2Utils.renderJson(dataStore, EncodingHeaderUtil.HEADERENCODING);
	}
	
	public void getById() {
		Department department = deptService.getById(id);
		/*Map map = new HashMap();
		map.put("deptId", department.getId());
		map.put("status", "1");
		List industrys = sysDeptIndustryService.query(map);
		String industryTypeStr = "";
		String industryTypeNameStr = "";
		if(industrys.size()>0){
			for(int i=0;i<industrys.size();i++){
				SysDeptIndustry industry = (SysDeptIndustry)industrys.get(i);
				industryTypeStr = industryTypeStr + industry.getIndustryId()+";";
				
				Map dataMap = new HashMap();
				dataMap.put("typeId", "564bb95106d04970ae494b32982360ea");
				dataMap.put("dataCode", industry.getIndustryId());
				dataMap.put("status", "1");
				Data data = dataService.query(dataMap).get(0);
				industryTypeNameStr = industryTypeNameStr + data.getDataName()+";";
			}
		}
		department.setIndustryStr(industryTypeStr);
		department.setIndustryTypeNameStr(industryTypeNameStr);*/
		
		Struts2Utils.renderJson(department, EncodingHeaderUtil.HEADERENCODING);
	}
	
	public void saveOrUpdate() {
		OperateInfo operateInfo = new OperateInfo();
		if (StringUtil.isNullOrEmpty(dept.getId())) {
			Department department = new Department();
			department.setDeptName(this.dept.getDeptName());
			department.setDeptOrder(this.dept.getDeptOrder());
			department.setParentId(this.dept.getParentId());
			Department newDepart = deptService.insert(department);
			//sysDeptIndustryService.insert(newDepart);
			operateInfo.setOperateMessage("保存成功");
			operateInfo.setOperateSuccess(true);
		} else {
			Department depart = deptService.getById(dept.getId());
			depart.setId(depart.getId());
			depart.setDeptName(dept.getDeptName());
			depart.setDeptOrder(dept.getDeptOrder());
			boolean flag = deptService.update(depart);
			//sysDeptIndustryService.insert(dept);
			if (flag) {
				operateInfo.setOperateMessage("更新成功");
				operateInfo.setOperateSuccess(true);
			} else {
				operateInfo.setOperateMessage("更新失败");
				operateInfo.setOperateSuccess(false);
			}
		}
		// 注意此处，如果是在IE下的话，就使用这样的方式
		// 当response.setContextType("text/html")或者为text等等
		// 在IE下，是不会被识别出来的。IE会当做文件下载来处理
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void deleteByIds() {
		String idsParam[] = ids.split("[,]");
		boolean flag = deptService.delete(idsParam);
		boolean userDelFlag = true;
		OperateInfo operateInfo = new OperateInfo();
		for (String idParam : idsParam) {
			userDelFlag = deptService.deleteUserByDept(idParam);
		}
		if (flag && userDelFlag) {
			operateInfo.setOperateMessage("删除部门成功");
			operateInfo.setOperateSuccess(true);
		} else {
			operateInfo.setOperateMessage("删除部门失败");
			operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}

    /**
     * reload tree 方法
     */
    public void reloadDeptTree() {
        DepartmentTreeService departmentTreeService = DepartmentTreeService.getInstance();
        departmentTreeService.reloadDepartmentTree();
        String treeJson = treeService.generateJsonCheckboxTree(departmentTreeService, false);
        logger.info(treeJson);
        Struts2Utils.renderJson(treeJson);
    }
    
    /**
     * 重载部门ComboTree json生成
     */
    public void reloadDeptComboTree() {
    	DepartmentTreeService departmentTreeService = DepartmentTreeService.getInstance();
    	departmentTreeService.reloadDepartmentTree();
    	String treeJson = treeService.generateJsonComboTree(departmentTreeService);
    	logger.info(treeJson);
    	Struts2Utils.renderJson(treeJson);
    }
    
	public DepartmentService getDeptService() {
		return deptService;
	}

	public void setDeptService(DepartmentService deptService) {
		this.deptService = deptService;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
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

    public ITreeService getTreeService() {
        return treeService;
    }

    public void setTreeService(ITreeService treeService) {
        this.treeService = treeService;
    }
}
