package com.hunau.entity;

/**
 * @author 刘家玮
 * 程序名称：showapi_res_body.java
 * 程序描述：主要当前及未来一周的天气数据实体所对应的属性
 * 修改时间：2017-10-10
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public class showapi_res_body{
	private now now; //现在实时的天气情况
	private f1 f1; //今天的天气预报
	private f2 f2; //今天+1天后的天气预报
	private f3 f3; //今天+2天后的天气预报

	public now getNow() {
		return now;
	}

	public void setNow(now now) {
		this.now = now;
	}

	public f1 getF1() {
		return f1;
	}

	public void setF1(f1 f1) {
		this.f1 = f1;
	}

	public f2 getF2() {
		return f2;
	}

	public void setF2(f2 f2) {
		this.f2 = f2;
	}

	public f3 getF3() {
		return f3;
	}

	public void setF3(f3 f3) {
		this.f3 = f3;
	}

	
}