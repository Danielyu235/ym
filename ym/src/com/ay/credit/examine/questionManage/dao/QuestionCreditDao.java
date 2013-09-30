package com.ay.credit.examine.questionManage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.credit.examine.questionManage.pojo.QuestionCredit;
import com.ay.framework.core.dao.BaseDao;
import com.ay.jfds.sys.pojo.SysRoleData;
/**
 * 题目信息数据库控制层
 * @author zhangxiang
 *2013-05-16
 */
public class QuestionCreditDao extends BaseDao<QuestionCredit> {
	@Override
	public String getEntityName() {
		return "QuestionCredit";
	}
	@Override
	public String getTableName() {
		return "TB_QUESTION_CREDIT";
	}
	/**
	 * 查询试题数据
	 * @param map
	 * @param from
	 * @param prePageNum
	 * @return
	 */
	public List<QuestionCredit> pageQueryList(Map map, int from, int prePageNum) {
		String tableName = getTableName();
		Map<String, SysRoleData> roleMap = (Map<String, SysRoleData>) SecurityUtils
				.getSubject().getSession().getAttribute("user_data_role");
		SysRoleData userRoleData = roleMap.get(tableName);
		// 获得用户的 类型 ID 部门ID
		String userType = (String) SecurityUtils.getSubject().getSession()
				.getAttribute("usertype");
		String userId = (String) SecurityUtils.getSubject().getSession()
				.getAttribute("user_id");
		String userDeptId = (String) SecurityUtils.getSubject().getSession()
				.getAttribute("user_dept_id");
		// 当传入进来的查询map为空时，应该new出一个对象出来
		if (map == null) {
			map = new HashMap();
		}

		StringBuilder roleDataUserFilter = new StringBuilder();
		StringBuilder roleDataDeptFilter = new StringBuilder();
		if (userRoleData != null) {
			if (userRoleData.getDeptIds() != null) {
				if (userType != null && userType.equals("3")) {
					if (userRoleData.getDeptIds() != null) {
						roleDataDeptFilter.append(",'").append(userDeptId)
								.append("'");
					}
				}
			}
		}
		
		// 任何一个用户都可以看到自己添加的数据
		if (userRoleData != null && userRoleData.getUserIds() != null) {
		    if (!userRoleData.getUserIds().equals("''")) {
		        roleDataUserFilter.append(userRoleData.getUserIds());
		    }
		}
		roleDataUserFilter.append(",'").append(userId).append("'");
		if (roleDataUserFilter.indexOf(",") == 0) {
		    roleDataUserFilter.deleteCharAt(0);
		}
		if (roleDataDeptFilter.indexOf(",") == 0) {
		    roleDataDeptFilter.deleteCharAt(0);
		}
		if (roleDataUserFilter.equals("") || roleDataUserFilter.equals("''")) {
			map.put("created", null);
		} else {
			map.put("created", roleDataUserFilter.toString());
		}
		if (roleDataDeptFilter.equals("") || roleDataDeptFilter.equals("''")) {
			map.put("deptId", null);
		} else {
			map.put("deptId", roleDataDeptFilter.toString());
		}
		
		// 如果这里是超级用户，那么就可以看到所有的数据
		if (userType != null && userType.equals("0")) {
			map.put("created", null);
			map.put("deptId", null);
		}
		return (List<QuestionCredit>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".findList", map, from, prePageNum);
	}
	/**
	 * 查询试题数据数量
	 * @param map
	 * @return
	 */
	public int countList(Map map) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				getEntityName() + ".countList", map);
	}
	
}