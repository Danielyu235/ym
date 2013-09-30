package com.ay.hiddenPerils.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.elect.pojo.ElectMonth;
import com.ay.framework.core.dao.BaseDao;
import com.ay.framework.util.DateUtil;
import com.ay.hiddenPerils.pojo.HiddenPerils;
import com.ay.hiddenPerils.pojo.PerilsData;
import com.ay.jfds.sys.pojo.SysRoleData;

public class HiddenPerilsDao extends BaseDao<HiddenPerils> {
	@Override
	public String getEntityName() {
		return "HiddenPerils";
	}
	@Override
	public String getTableName() {
		return "TB_HIDDEN_PERILS";
	}
	/**
	 * 
	 * 1.当用户为企业版的用户，并且他没有配置数据级的权限，那么他只能看自己所添加的数据
	 * 2.当用户为政府版的用户，并且他没有配置数据级的权限，那么他只能看自己所管辖的企业，并且可以看到自己的添加的数据
	 * 3.无论政府端的用户还是企业端的用户，只要有数据级的权限，都通过他所配置的数据级权限来筛选相应的数据
	 * 
	 * @param map
	 *            查询分页的参数
	 * @param from
	 *            一页显示多少
	 * @param prePageNum
	 *            页码
	 * @return list 查询出来的list对象
	 */
	@SuppressWarnings("unchecked")
	public List<HiddenPerils> pageQueryPerils(Map map, int from, int prePageNum) {
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
		return (List<HiddenPerils>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".findPerils", map, from, prePageNum);
	}
	public List<HiddenPerils> pageQueryPerils2(Map map, int from, int prePageNum) {
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
		return (List<HiddenPerils>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".findPerils2", map, from, prePageNum);
	}

	/**
	 * @param map
	 *            map
	 * @return int
	 */
	public int countPerils(Map map) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				getEntityName() + ".countPerils", map);
	}
	
	/**
	 * 根据主键更新实体
	 * 
	 * @param entity
	 *            entity
	 * @return 更新的记录数是否为1
	 */
	public boolean updatePerils(PerilsData entity) {
		String userId = (String) SecurityUtils.getSubject().getSession()
				.getAttribute("user_id");
		entity.setUpdateTime(DateUtil.getDateTime());
		entity.setUpdated(userId);
		int rows = getSqlMapClientTemplate().update(
				getEntityName() + ".updatePerils", entity);
		return rows == 1;
	}
	
	/**
	 * 根据隐患类型统计饼图
	 */
	@SuppressWarnings("unchecked")
    public List<HiddenPerils> getPie(Map paramMap){
        return (List<HiddenPerils>) getSqlMapClientTemplate().queryForList( 
                getEntityName() +".getPie",paramMap);
    }
}