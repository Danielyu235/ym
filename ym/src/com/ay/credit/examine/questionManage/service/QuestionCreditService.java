package com.ay.credit.examine.questionManage.service;

import java.util.List;
import java.util.Map;

import com.ay.credit.examine.questionManage.dao.QuestionCreditDao;
import com.ay.credit.examine.questionManage.pojo.QuestionCredit;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.service.BaseService;
/**
 * 题目信息业务服务层
 * @author zhangxiang
 *2013-05-16
 */
public class QuestionCreditService extends BaseService<QuestionCredit, QuestionCreditDao> {
	/**
     * 分页查询.
     * 
     * @param map the map
     * @param page the page
     * @return the page
     */
    public Page pageQueryList(Map map, Page page)
    {
        try {
			page.setCount(this.dao.countList(map));
			List<QuestionCredit> list = dao.pageQueryList(map, page.getFrom(), page.getRecPerPage());
			page.setCollection(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return page;
    }
    
   
}