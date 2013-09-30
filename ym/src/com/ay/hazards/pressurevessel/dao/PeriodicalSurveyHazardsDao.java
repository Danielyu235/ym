package com.ay.hazards.pressurevessel.dao;

import com.ay.hazards.pressurevessel.pojo.PeriodicalSurveyHazards;
import com.ay.framework.core.dao.BaseDao;
/** 
 * @Description 重大危险源 压力容器中定期检查情况数据库控制层
 * @date 2013-4-11
 * @author WangXin
 */
public class PeriodicalSurveyHazardsDao extends BaseDao<PeriodicalSurveyHazards> {
	@Override
	public String getEntityName() {
		return "PeriodicalSurveyHazards";
	}
	@Override
	public String getTableName() {
		return "TB_PERIODICAL_SURVEY_HAZARDS";
	}

}