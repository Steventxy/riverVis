package com.hunau.entity;

import org.json.JSONArray;


/**
 * @author 刘家玮
 * 程序名称:Hours24WeatherBody.java
 * 程序描述：24小时内的天气数据实体对应的属性
 * 修改时间：2017-10-18
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public class Hours24WeatherBody {
	private String ret_code;
	private String area;
	private String areaid;
	private JSONArray hourList;
	public String getRet_code() {
		return ret_code;
	}
	public void setRet_code(String ret_code) {
		this.ret_code = ret_code;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	public String getAreaid() {
		return areaid;
	}
	public void setAreaid(String areaid) {
		this.areaid = areaid;
	}
	public JSONArray getHourList() {
		return hourList;
	}

	public void setHourList(JSONArray hourList) {
		// TODO Auto-generated method stub
		this.hourList = hourList;
	}
}
