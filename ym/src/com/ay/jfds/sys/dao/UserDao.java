package com.ay.jfds.sys.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ay.framework.core.dao.BaseDao;
import com.ay.jfds.sys.dto.RoleDTO;
import com.ay.jfds.sys.dto.UserDTO;
import com.ay.jfds.sys.pojo.Department;
import com.ay.jfds.sys.pojo.SysRoleData;
import com.ay.jfds.sys.pojo.User;

/**
 * 用户dao封装
 * 
 * @author zxy
 *
 */
@SuppressWarnings("all")
public class UserDao extends BaseDao<User> {

	@Override
	public String getEntityName() {
		return "user";
	}

	/**
	 * 查找现在当前这个用户所属部门的信息
	 * 
	 * @param user
	 * @return
	 */
	public Department getUsersDept(User user) {
		Department department = null;
		department = (Department) this.getSqlMapClientTemplate().queryForObject(getEntityName() + ".getUsersDept", user);
		return department;
	}
	
	/**
	 * 用与分布展示的时候要显示这个用户为哪个部门的时候进行的操作
	 * 
	 * @param map
	 * @param from
	 * @param prePageNum
	 * @return
	 */
	public List<UserDTO> pageDTOQuery(Map map, int from, int prePageNum) {
		return (List<UserDTO>) getSqlMapClientTemplate().queryForList(getEntityName() + ".findUserDto", map, from, prePageNum);
	}
	
	/**
	 * 根据登录名查找用户，为了shiro在登录认证回调时可以进行验证操作
	 * 
	 * @param account
	 * @return
	 */
	public User findUserByName(String account) {
		return (User) getSqlMapClientTemplate().queryForObject(getEntityName() + ".findUserByName", account);
	}

	/**
	 * 根据id查找userDTO对象
	 * 
	 * @param id
	 * @return
	 */
    public UserDTO getUserDTOById(String id) {
        return (UserDTO) getSqlMapClientTemplate().queryForObject(getEntityName() + ".getUserDTOById", id);
    }
    
    /**
	 * 根据id查找userDTO对象
	 * 
	 * @param id
	 * @return
	 */
    public UserDTO getQyUserDTOById(String id) {
        return (UserDTO) getSqlMapClientTemplate().queryForObject(getEntityName() + ".getQyUserDTOById", id);
    }

	/**
	 * 根据用户ID 查找出用户所具有的所有权限
	 * 
	 * @param id
	 * @return
	 */
    public List<RoleDTO> getUserRoleDTOById(String id) {
        return (List<RoleDTO>) getSqlMapClientTemplate().queryForList(getEntityName() + ".getUserRoleDTOById", id);
    }
    
	/**
	 * 根据登陆名查找出当前用户
	 * 
	 * @param account
	 * @return
	 */
    public UserDTO getUserDTOByName(String account){
    	return (UserDTO)getSqlMapClientTemplate().queryForObject(getEntityName() + ".findUserDTOByName", account);
    }
    
	/**
	 * 锁定用户
	 * 
	 * @param id
	 */
    public void lockUser(String id){
    	getSqlMapClientTemplate().update(getEntityName() + ".lockUser", id);
    }
    
	/**
	 * 根据id更新用户信息
	 * 
	 * @param id
	 */
    public void updateUserDTO(UserDTO userDTO){
    	getSqlMapClientTemplate().update(getEntityName() + ".updateUserDTO", userDTO);
    }
    
	/**
	 * 判断用户是否有登陆权限,返回用户的角色数量
	 * 
	 * @param account
	 * @return Integer
	 */
    public Integer isHasRole(String account){
    	return (Integer)getSqlMapClientTemplate().queryForObject(getEntityName() +".hasRole", account);
    }

    /**
     * 用户<->用户组<->部门
     * tableName -> userIds
     * tableName -> deptIds
     * 
     * @param id 用户的id
     * @return 用户所具有的所有权限下可以查看的数据Map
     */
    public Map<String, SysRoleData> getUserDataRoleById(String id) {
    	List<SysRoleData> roleDataList = (List<SysRoleData>) getSqlMapClientTemplate().queryForList(getEntityName() + ".getUserDataRoleById", id);
    	Map<String, SysRoleData> resultMap = new HashMap<String, SysRoleData>();
    	for (Iterator<SysRoleData> iterator=roleDataList.iterator(); iterator.hasNext();) {
    		SysRoleData roleData = iterator.next();
    		resultMap.put(roleData.getTableName(), roleData);
    	}
    	return resultMap;
    }
    
	/**
	 * 防止注册时帐号重复
	 * 
	 * @param account
	 * @return
	 */
   public Integer checkAccountExist(String account, String id) {
	   Map map = new HashMap();
	   map.put("account", account);
	   map.put("id", id);
	   return (Integer) getSqlMapClientTemplate().queryForObject(getEntityName() + ".checkAccountExist", map);
   }

	@Override
	public String getTableName() {
		return "sys_user";
	}
}
