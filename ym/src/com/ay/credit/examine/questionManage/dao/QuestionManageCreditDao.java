package com.ay.credit.examine.questionManage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.credit.examine.questionManage.pojo.QuestionCredit;
import com.ay.credit.examine.questionManage.pojo.QuestionManageCredit;
import com.ay.framework.core.dao.BaseDao;
import com.ay.jfds.sys.pojo.SysRoleData;
/**
 * 题库信息数据库控制层
 * @author zhangxiang
 *2013-05-16
 */
public class QuestionManageCreditDao extends BaseDao<QuestionManageCredit> {
	@Override
	public String getEntityName() {
		return "QuestionManageCredit";
	}
	@Override
	public String getTableName() {
		return "TB_QUESTION_MANAGE_CREDIT";
	}
	
	
}