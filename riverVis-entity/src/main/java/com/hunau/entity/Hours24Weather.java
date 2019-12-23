package com.hunau.entity;

/**
 * @author 刘家玮
 * 程序名称：Hours24Weather.java
 * 程序描述：24小时内的天气数据实体对应的属性
 * 修改时间：2017-10-18
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public class Hours24Weather {
	private String code;
	private String error;
	private Hours24WeatherBody Hours24WeatherBody;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public Hours24WeatherBody getHours24WeatherBody() {
		return Hours24WeatherBody;
	}
	public void setHours24WeatherBody(Hours24WeatherBody hours24WeatherBody) {
		Hours24WeatherBody = hours24WeatherBody;
	}
}
