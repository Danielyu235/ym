package com.ay.credit.examine.questionManage.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
/**
 * 人员安全教育考核题库维护
 * @author zhangxiang
 * 2013-05-16
 */
//@ChineseName("题库维护 题目类型")
public class QuestionManageCredit extends BasePojo 
{
		@ChineseName("备注")
		private String questionRemarks;
		@ChineseName("题型中文名称")
		private String questionName;
		public String getQuestionRemarks() {
			return questionRemarks;
		}
		public void setQuestionRemarks(String questionRemarks) {
			this.questionRemarks = questionRemarks;
		}
		public String getQuestionName() {
			return questionName;
		}
		public void setQuestionName(String questionName) {
			this.questionName = questionName;
		}
		
}
