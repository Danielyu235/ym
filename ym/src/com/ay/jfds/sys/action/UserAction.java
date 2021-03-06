package com.ay.jfds.sys.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.shiro.SecurityUtils;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.common.ITreeService;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.jfds.sys.dto.UserDTO;
import com.ay.jfds.sys.pojo.User;
import com.ay.jfds.sys.service.DepartmentService;
import com.ay.jfds.sys.service.DepartmentUserTreeService;
import com.ay.jfds.sys.service.UserService;

/**
 * User Action 对象
 * 
 * @author zxy
 * 
 */
@SuppressWarnings("all")
public class UserAction extends BaseAction
{
    private UserService userService;
    /** 持有DepartmentService对象，部门树的生成做操作 */
    private DepartmentService deptService;
    private User user;
    private String page;
    private String rows;
    private String sort;
    private String order;
    private String userName;
    private String status;
    private String account;
    private String id;
    private String ids;
    private UserDTO userDTO;
    private String usertype;

    public String getUsertype()
    {
        return usertype;
    }

    public void setUsertype(String usertype)
    {
        this.usertype = usertype;
    }

    public String exp()
    {
        String where = " where 1=1 ";
        Map map = BeanUtil.Bean2Map(user);
        if (map != null)
        {
            for (Object o : map.keySet())
            {
                where += " and " + o.toString() + " like '%" + map.get(o)
                        + "%' ";
            }
        }
        excelQuerySql = "select * from sys_user" + where;
        System.out.println(excelQuerySql);
        excelSheetName = "测试名称";
        excelHeads = new String[]
        { "名字1", "名字2", "名字3" };
        return "exp";
    }

    public String imp()
    {
        excelInsertSql = "insert into sys_user(id,status,created,create_time,updated,update_time"
                + ",account,user_name,dept_id,user_type) values(?,?,?,?,?,?,?,?,?,?)";
        return "imp";
    }

    public void addUser()
    {
        OperateInfo operateInfo = new OperateInfo();
        user.setCreated((String) SecurityUtils.getSubject().getSession()
                .getAttribute("user_id"));
        user.setCreateTime(new Date());
        user.setLoseCount(0);
        try
        {
            if (userService.checkAccountExist(user.getAccount(),
                    user.getId() == null ? "null" : user.getId()))
            {
                operateInfo.setOperateMessage("账户已经存在");
                operateInfo.setOperateSuccess(false);
                String json = new JsonMapper().toJson(operateInfo);
                Struts2Utils.renderText(json);
                return;
            }
            userService.insert(user);
            operateInfo.setOperateMessage("添加用户成功");
            operateInfo.setOperateSuccess(true);
        }
        catch (Exception e)
        {
            operateInfo.setOperateMessage("添加用户失败");
            operateInfo.setOperateSuccess(false);
        }

        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }

    public void getByIdDTO()
    {
        UserDTO userDTO = new UserDTO();
        if (null != usertype && usertype.equals("3"))
        {
            userDTO = userService.getQyUserDTOById(id);
        }
        else
        {
            userDTO = userService.getUserDTOById(id);
        }
        Struts2Utils.renderJson(userDTO, EncodingHeaderUtil.HEADERENCODING);
    }

    public void updateUser()
    {
        OperateInfo operateInfo = new OperateInfo();
        user.setUpdated((String) SecurityUtils.getSubject().getSession()
                .getAttribute("user_id"));
        user.setUpdateTime(new Date());
        User updateUser = userService.getById(user.getId());
        updateUser.setAccount(user.getAccount());
        updateUser.setStatus(user.getStatus());
        updateUser.setDeptId(user.getDeptId());
        updateUser.setUserName(user.getUserName());
        if (!user.getPlainPassword().equals("password"))
        {
            updateUser.setPassword(user.getPassword());
            updateUser.setPlainPassword(user.getPlainPassword());
        }
        if (userService.checkAccountExist(updateUser.getAccount(), updateUser
                .getId() == null ? "null" : updateUser.getId()))
        {
            operateInfo.setOperateMessage("账户已经存在");
            operateInfo.setOperateSuccess(false);
            String json = new JsonMapper().toJson(operateInfo);
            Struts2Utils.renderText(json);
            return;
        }
        else
        {
            boolean flag = userService.update(updateUser);
            if (flag)
            {
                operateInfo.setOperateMessage("更新用户成功");
                operateInfo.setOperateSuccess(true);
            }
            else
            {
                operateInfo.setOperateMessage("更新用户失败");
                operateInfo.setOperateSuccess(false);
            }
        }

        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }

    public void deleteUser()
    {
        OperateInfo operateInfo = new OperateInfo();
        boolean flag = userService.delete(user);
        if (flag)
        {
            operateInfo.setOperateMessage("删除用户成功");
            operateInfo.setOperateSuccess(true);
        }
        else
        {
            operateInfo.setOperateMessage("删除用户失败");
            operateInfo.setOperateSuccess(false);
        }
        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }

    /**
     * 这种为分页查询User中的所有值，但是没有将Department关联起来
     */
    public void pageList()
    {
        DataStore<User> dataStore = new DataStore<User>();
        //获取分页对象
        Page pageTemp = Page.getNewInstance(page, rows);
        
        Map paramMap = BeanUtil.Bean2Map(user);
        if (null == paramMap)
        {
            paramMap = new HashMap();
            Struts2Utils.getRequest().setAttribute("usertype", usertype);
        }
        paramMap.put("userType", usertype);
   
        Page resultPage = userService.pageQuery(paramMap, pageTemp);
        List<User> resultList = (List<User>) resultPage.getCollection();
        dataStore.setTotal(new Long(resultPage.getCount()));
        dataStore.setRows(resultList);
        String json = new JsonMapper().toJson(dataStore);
        Struts2Utils.renderText(json);
    }

    /**
     * 查询DTO将Department外键关联也加上
     */
    public void PageListDTO()
    {
        DataStore<UserDTO> dataStore = new DataStore<UserDTO>();
        Page pageTemp = new Page();
        // 当前页 
        int intPage = Integer.parseInt((page == null || page == "0") ? "1"
                : page);
        // 每页显示条数 
        int number = Integer.parseInt((rows == null || rows == "0") ? "10"
                : rows);
        int start = (intPage - 1) * number;
        pageTemp.setCurrentPage(intPage);
        pageTemp.setRecPerPage(number);
        pageTemp.setFrom(start);
        Map paramMap = BeanUtil.Bean2Map(userDTO);
        Page resultPage = userService.pageDTOQuery(paramMap, pageTemp);
        List<UserDTO> resultList = (List<UserDTO>) resultPage.getCollection();
        dataStore.setTotal(new Long(resultPage.getCount()));
        dataStore.setRows(resultList);
        String json = new JsonMapper().toJson(dataStore);
        Struts2Utils.renderText(json);
    }

    public void getById()
    {
        User user = null;
        user = userService.getById(id);
        Struts2Utils.renderJson(user, EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);
    }

    public void deleteByIds()
    {
        String[] idsParam = ids.split("[,]");
        OperateInfo operateInfo = new OperateInfo();
        boolean flag = userService.deleteByIds(idsParam);
        if (flag)
        {
            operateInfo.setOperateMessage("删除用户成功");
            operateInfo.setOperateSuccess(true);
        }
        else
        {
            operateInfo.setOperateMessage("删除用户失败");
            operateInfo.setOperateSuccess(false);
        }
        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }

    public void reloadDeptUserTree()
    {
        DepartmentUserTreeService departmentUserTreeService = DepartmentUserTreeService
                .getInstance();
        departmentUserTreeService.reloadDepartmentUserTree();
        String treeJson = treeService.generateJsonCheckboxTree(
                departmentUserTreeService, false);
        Struts2Utils.renderJson(treeJson);
    }

    /**
     * 加载Dept-User的树
     */
    public void reloadComboUserTree()
    {
        DepartmentUserTreeService departmentUserTreeService = DepartmentUserTreeService
                .getInstance();
        departmentUserTreeService.reloadDepartmentUserTree();
        String treeJson = treeService
                .generateJsonComboTree(departmentUserTreeService);
        Struts2Utils.renderJson(treeJson);
    }

    private ITreeService treeService;

    public ITreeService getTreeService()
    {
        return treeService;
    }

    public void setTreeService(ITreeService treeService)
    {
        this.treeService = treeService;
    }

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    public UserService getUserService()
    {
        return userService;
    }

    public void setUserService(UserService userService)
    {
        this.userService = userService;
    }

    public String getPage()
    {
        return page;
    }

    public void setPage(String page)
    {
        this.page = page;
    }

    public String getRows()
    {
        return rows;
    }

    public void setRows(String rows)
    {
        this.rows = rows;
    }

    public String getSort()
    {
        return sort;
    }

    public void setSort(String sort)
    {
        this.sort = sort;
    }

    public String getOrder()
    {
        return order;
    }

    public void setOrder(String order)
    {
        this.order = order;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getIds()
    {
        return ids;
    }

    public void setIds(String ids)
    {
        this.ids = ids;
    }

    public DepartmentService getDeptService()
    {
        return deptService;
    }

    public void setDeptService(DepartmentService deptService)
    {
        this.deptService = deptService;
    }

    public String getAccount()
    {
        return account;
    }

    public void setAccount(String account)
    {
        this.account = account;
    }

    public UserDTO getUserDTO()
    {
        return userDTO;
    }

    public void setUserDTO(UserDTO userDTO)
    {
        this.userDTO = userDTO;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

}
