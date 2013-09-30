package com.ay.reputation.pojo;

public class HistoryScope {
	
	private String scope;
	
	private String month;

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "HistoryScope [month=" + month + ", scope=" + scope + "]";
	}	
	
}
