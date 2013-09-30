package com.ay.credit.examine.testPaperManage.service;

import java.util.List;
import java.util.Map;

import com.ay.credit.examine.questionManage.pojo.QuestionCredit;
import com.ay.credit.examine.testPaperManage.dao.TestPaperManageDao;
import com.ay.credit.examine.testPaperManage.pojo.TestPaperManage;
import com.ay.credit.examine.testPaperManage.pojo.selectPaper;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.service.BaseService;
/**
 * 试卷管理业务层
 * @author zhangxiang
 * 2013-06-24
 */
public class TestPaperManageService extends BaseService<TestPaperManage, TestPaperManageDao> {
	/**
     * 查看试题数据信息
     * @return
     */
    public List<QuestionCredit> getFindQuestion(String id){
    	return this.dao.getFindQuestion(id);
    }
    /**
     * 查看试题数据信息
     * @return
     */
    public List<selectPaper> getSelectPaper(String id){
    	return this.dao.getSelectPaper(id);
    }
    /**
     * 分页查询.
     * 
     * @param map the map
     * @param page the page
     * @return the page
     */
    public Page pageQueryOnline(Map map, Page page)
    {
        try {
			page.setCount(this.countOnline(map));
			List<TestPaperManage> list = dao.pageQueryOnline(map, page.getFrom(), page.getRecPerPage());
			page.setCollection(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return page;
    }
    /**
     * Count.
     * 
     * @param map the map
     * @return the int
     */
    public int countOnline(Map map)
    {
        return dao.countOnline(map);
    }
}