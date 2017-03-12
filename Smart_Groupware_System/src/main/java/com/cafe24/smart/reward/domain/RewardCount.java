package com.cafe24.smart.reward.domain;

public class RewardCount {
	String month;
	int count;

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "RewardCount [month=" + month + ", count=" + count + "]";
	}
}