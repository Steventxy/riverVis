package com.hunau.entity;

/**
 * @author 刘家玮
 * 程序名称：now.java
 * 程序描述：现在实时的天气情况实体及其所对应的属性
 * 修改时间：2017-10-11
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public class now {
	private aqiDetail aqiDetail;  //空气质量指数(aqi)明细数据
	private String weather_code; //天气编号
	private String wind_direction; //风向
	private String temperature_time;  //获取气温的时间
	private String wind_power; //风力
	private int aqi;    //空气指数，越小越好
	private String sd; //空气湿度
	private String weather_pic;  //天气小图标
	private String weather;  //天气
	private String temperature;  //气温
	

	public aqiDetail getAqiDetail() {
		return aqiDetail;
	}

	public void setAqiDetail(aqiDetail aqiDetail) {
		this.aqiDetail = aqiDetail;
	}

	public String getWeather_code() {
		return weather_code;
	}

	public void setWeather_code(String weather_code) {
		this.weather_code = weather_code;
	}

	public String getWind_direction() {
		return wind_direction;
	}

	public void setWind_direction(String wind_direction) {
		this.wind_direction = wind_direction;
	}

	public String getTemperature_time() {
		return temperature_time;
	}

	public void setTemperature_time(String temperature_time) {
		this.temperature_time = temperature_time;
	}

	public String getWind_power() {
		return wind_power;
	}

	public void setWind_power(String wind_power) {
		this.wind_power = wind_power;
	}

	public int getAqi() {
		return aqi;
	}

	public void setAqi(int aqi) {
		this.aqi = aqi;
	}

	public String getSd() {
		return sd;
	}

	public void setSd(String sd) {
		this.sd = sd;
	}

	public String getWeather_pic() {
		return weather_pic;
	}

	public void setWeather_pic(String weather_pic) {
		this.weather_pic = weather_pic;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	} 
}
