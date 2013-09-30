package com.ay.framework.shiro;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ay.framework.bean.OperateInfo;
import com.ay.framework.bean.UserInfo;
import com.ay.framework.core.utils.spring.SpringContextHolder;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.DateUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.jfds.sys.dto.UserDTO;
import com.ay.jfds.sys.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 增加Session的监听操作，如果有用户已经在线则对其进行Session销毁的操作
 * 
 * @author zxy
 * @author wgw
 */
@SuppressWarnings("all")
public class LoginAction extends ActionSupport
{
    private static Logger log = LoggerFactory.getLogger(LoginAction.class);
    private String username;
    private String password;
    private String usertype;
    private SecurityManager securityManager;
    private String validCode;
    private UserService userService;

    public String login()
    {
        // 初始化操作信息對象
        OperateInfo operateInfo = new OperateInfo();
        userService = SpringContextHolder.getBean(UserService.class);
        UsernamePasswordToken token = new UsernamePasswordToken(username,
                password);
        SecurityUtils.setSecurityManager(securityManager);
        Subject subject = SecurityUtils.getSubject();
        try
        {
            // 验证验证码是否正确
            String vCode = (String) ServletActionContext.getRequest()
                    .getSession().getAttribute("validCode");
            if (SystemParameter.getLogin_authcode_switch().equals("0")
                    || (vCode != null && vCode.equalsIgnoreCase(validCode)))
            {
            	//根据用户名获得用户信息对象
                UserDTO user = userService.getUserDTOByName(username);
                if (user != null
                        && (usertype == null || (usertype != null && usertype
                                .equals(user.getUserType()))))
                {
                    if (!"admin".equals(user.getAccount()))
                    {
                    	//判断用户是否有权限
                        if (!userService.isHasRole(user))
                        {
                        	//若没有权限则返回错误信息，并重新返回到login页面
                            operateInfo.setOperateSuccess(false);
                            operateInfo.setOperateMessage("该用户没有权限");
                            Struts2Utils.renderJson(operateInfo,
                                    EncodingHeaderUtil.HEADERENCODING,
                                    EncodingHeaderUtil.CACHEENCODING);
                            return "login";
                        }
                    }
                    //判断用户类型，如果status = 2 则为锁定状态，然后判断用户上次登录时间
                    if (!checkLoginTime(user) && "2".equals(user.getStatus()))
                    {
                        operateInfo.setOperateSuccess(false);
                        operateInfo.setOperateMessage("用户被锁定了");
                        Struts2Utils.renderJson(operateInfo,
                                EncodingHeaderUtil.HEADERENCODING,
                                EncodingHeaderUtil.CACHEENCODING);
                        return "login";
                    }
                    // 这一步已经做验证了，验证用户名与密码
                    if (!subject.isAuthenticated())
                    {
                    	//shiro 根据用户名和密码验证
                        subject.login(token);

                        // 对已经存在的用户进行销毁的操作
                        HttpServletRequest request = ServletActionContext
                                .getRequest();
                        HttpSession session = request.getSession();
                        // 取出application中的session列表（存储了所有当前已登录用户的session）
                        List<UserInfo> userInfos = (List<UserInfo>) session
                                .getServletContext()
                                .getAttribute(
                                        ApplicationSessionSchema.APPLIACTION_ONLINE_INFO);
                        if (userInfos == null)
                        {
                            userInfos = new ArrayList<UserInfo>();
                        }
                        boolean isFirst = true;
                        String delSessionId = null;
                        HttpSession delSession = null;
                        // 加上开关
                        if (SystemParameter.getLogin_onlyone_switch() != null
                                && SystemParameter.getLogin_onlyone_switch()
                                        .equals("0"))
                        {
                            // 判断这个用户是不是第一次登录，返回状态位：isFirst
                            for (UserInfo userInfo : userInfos)
                            {
                                if (userInfo.getUserName().equals(
                                        user.getUserName())
                                        && !session.getId().equals(
                                                userInfo.getSessionId()))
                                {
                                    delSessionId = userInfo.getSessionId();
                                    delSession = userInfo.getSession();
                                    isFirst = false;
                                    break;
                                }
                            }
                            if (!isFirst)
                            {
                            	//删除当前用户上次登录的session
                                ApplicationSessionSchema.userOnlineMap
                                        .remove(delSessionId);
                                try
                                {
                                    delSession.invalidate();
                                }
                                catch (Exception e)
                                {
                                    e.printStackTrace();
                                }

                            }
                        }
                        //设置用户信息
                        UserInfo userInfo = new UserInfo();
                        userInfo.setPassword(password);
                        userInfo.setUserName(user.getUserName());
                        userInfo.setSessionId(session.getId());
                        userInfo.setSession(session);
                        userInfo.setUserId(user.getId());

                        // 往在线用户里添加当前用户的信息
                        session.setAttribute(
                                ApplicationSessionSchema.SESSION_ONLINE_INFO,
                                userInfo);
                        session.setAttribute("usertype", usertype);
                        SecurityUtils.getSubject().isPermitted("test");
                        user.setLoseCount(0);
                        
                        //更改用户登录状态
                        userService.updateUserDTO(user);
                    }
                    usertype = usertype == null ? "" : usertype;
                    return "index" + usertype;
                }
                else
                {
                    operateInfo.setOperateSuccess(false);
                    operateInfo.setOperateMessage("用户不存在");
                    Struts2Utils.renderJson(operateInfo,
                            EncodingHeaderUtil.HEADERENCODING,
                            EncodingHeaderUtil.CACHEENCODING);
                    return null;
                }
                }
                else
                {
                    operateInfo.setOperateSuccess(false);
                    operateInfo.setOperateMessage("验证码错误");
                    Struts2Utils.renderJson(operateInfo,
                            EncodingHeaderUtil.HEADERENCODING,
                            EncodingHeaderUtil.CACHEENCODING);
                    return "login";
                }

            // subject.checkPermission("admin");
        }
        catch (Exception e)
        {
            // 判断系统是否设置登录错误次数限制
            if (SystemParameter.getLogin_limit_switch().equals("1"))
                this.loseLogin(username);
            log.error("登陆时候发生错误信息为:", e);
            if (e instanceof IncorrectCredentialsException)
            {
                operateInfo.setOperateSuccess(false);
                operateInfo.setOperateMessage("密码错误");
                Struts2Utils.renderJson(operateInfo,
                        EncodingHeaderUtil.HEADERENCODING,
                        EncodingHeaderUtil.CACHEENCODING);
                return null;
            }
            return "login";
        }
    }

    /**
     * 检查用户登录错误次数
     * 登陆失败则减少一次剩余登录次数
     * 当用户登录登录错误次数为0后，锁定用户
     * 
     * @param userName
     */
    private void loseLogin(String userName)
    {
        String login_limit_times = SystemParameter.getLogin_limit_times();
        String login_limit_period = SystemParameter.getLogin_limit_period();
        int times = Integer.parseInt(login_limit_times);
        int period = Integer.parseInt(login_limit_period);
        // 初始化操作信息對象
        OperateInfo opo = new OperateInfo();
        opo.setOperateSuccess(false);
        // SpringContextHolder.getBean("userService");
        // 获取当前登陆名的用户信息
        UserDTO user = userService.getUserDTOByName(userName);
        int loseCount = user.getLoseCount();

        // 初始化当前时间
        Date nowDate = DateUtil.getDateTime();
        ;
        // 判断是否是第一次错误登陆
        if (loseCount == 0)
        {
            user.setLoseCount(loseCount + 1);
            opo.setOperateMessage("登陆失败，" + login_limit_period + "分钟内登陆"
                    + login_limit_times + "次失败将会锁定账户，还剩"
                    + (times - 1 - loseCount) + "次机会。");
            Struts2Utils.renderJson(opo, EncodingHeaderUtil.HEADERENCODING,
                    EncodingHeaderUtil.CACHEENCODING);
            user.setLoginTime(nowDate);
            userService.updateUserDTO(user);
        }
        else
        {
            // 获取这个周期的第一次错误登陆时间
            Date loseDate = user.getLoginTime();

            long dateMinus = (nowDate.getTime() - loseDate.getTime()) / 1000;
            if (dateMinus < period * 60)
            {
                if (loseCount >= times - 1)
                {
                    user.setStatus("2");
                    opo.setOperateMessage("登陆错误次数超过限制，账户已锁定");
                }
                else
                {
                    opo.setOperateMessage("登陆失败，" + login_limit_period
                            + "分钟内登陆" + login_limit_times + "次失败将会锁定账户，还剩"
                            + (times - 1 - loseCount) + "次机会。");
                }
                user.setLoseCount(loseCount + 1);

                userService.updateUserDTO(user);

            }
            else
            {
                user.setLoseCount(1);
                opo.setOperateMessage("登陆失败，" + login_limit_period + "分钟内登陆"
                        + login_limit_times + "次失败将会锁定账户，还剩" + (times - 1)
                        + "次机会。");
                user.setLoginTime(DateUtil.getDateTime());
                userService.updateUserDTO(user);
            }
            Struts2Utils.renderJson(opo, EncodingHeaderUtil.HEADERENCODING,
                    EncodingHeaderUtil.CACHEENCODING);
        }
    }

    /**
     * 判断用户上次登录时间与当前时间的差距。
     * 大于系统设置的时间则返回true
     * @param user
     * @return
     * 
     */
    boolean checkLoginTime(UserDTO user)
    {
        String login_limit_period = SystemParameter.getLogin_limit_period();
        int period = Integer.parseInt(login_limit_period);
        Date loseDate = user.getLoginTime();
        if (loseDate == null)
        {
            return true;
        }
        Date nowDate = DateUtil.getDateTime();
        long dateMinus = (nowDate.getTime() - loseDate.getTime()) / 1000;
        if (dateMinus < period * 60)
        {
            return false;// 还未到解锁时间
        }
        return true;
    }

    public void logout()
    {
        SecurityUtils.getSubject().logout();
    }

    public SecurityManager getSecurityManager()
    {
        return securityManager;
    }

    public void setSecurityManager(SecurityManager securityManager)
    {
        this.securityManager = securityManager;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }


    public String getValidCode()
    {
        return validCode;
    }

    public void setValidCode(String validCode)
    {
        this.validCode = validCode;
    }

    public String getUsertype()
    {
        return usertype;
    }

    public void setUsertype(String usertype)
    {
        this.usertype = usertype;
    }

}
