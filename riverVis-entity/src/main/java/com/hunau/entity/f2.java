package com.hunau.entity;

/**
 * @author 刘家玮
 * 程序名称：f2.java
 * 程序描述：今天+1天后的天气预报实体所对应的属性
 * 修改时间：2017-10-11
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public class f2 {
	private String day_weather; //白天天气
	private String night_weather; //晚上天气
	private String night_weather_code; //晚上天气编号
	private String air_press; //大气压
	private String jiangshui;  //降水概率
	private String night_wind_power; //晚上风力编号
	private String day_wind_power; //白天风力编号
	private String day_weather_code; //白天的天气编码
	private String sun_begin_end; //日出日落时间(中间用|分割)
	private String ziwaixian; //紫外线强度
	private String day_weather_pic; //白天天气图标
	private int weekday;  //星期几
	private String night_air_temperature; //晚上天气温度(摄氏度)
	private String day_air_temperature; //白天天气温度(摄氏度)
	private String day_wind_direction; //白天风向编号
	private String day; //当前天
	private String night_weather_pic;  //晚上天气图标
	private String night_wind_direction;  //晚上风向编号
	public String getDay_weather() {
		return day_weather;
	}
	public void setDay_weather(String day_weather) {
		this.day_weather = day_weather;
	}
	public String getNight_weather() {
		return night_weather;
	}
	public void setNight_weather(String night_weather) {
		this.night_weather = night_weather;
	}
	public String getNight_weather_code() {
		return night_weather_code;
	}
	public void setNight_weather_code(String night_weather_code) {
		this.night_weather_code = night_weather_code;
	}
	public String getAir_press() {
		return air_press;
	}
	public void setAir_press(String air_press) {
		this.air_press = air_press;
	}
	public String getJiangshui() {
		return jiangshui;
	}
	public void setJiangshui(String jiangshui) {
		this.jiangshui = jiangshui;
	}
	public String getNight_wind_power() {
		return night_wind_power;
	}
	public void setNight_wind_power(String night_wind_power) {
		this.night_wind_power = night_wind_power;
	}
	public String getDay_wind_power() {
		return day_wind_power;
	}
	public void setDay_wind_power(String day_wind_power) {
		this.day_wind_power = day_wind_power;
	}
	public String getDay_weather_code() {
		return day_weather_code;
	}
	public void setDay_weather_code(String day_weather_code) {
		this.day_weather_code = day_weather_code;
	}
	public String getSun_begin_end() {
		return sun_begin_end;
	}
	public void setSun_begin_end(String sun_begin_end) {
		this.sun_begin_end = sun_begin_end;
	}
	public String getZiwaixian() {
		return ziwaixian;
	}
	public void setZiwaixian(String ziwaixian) {
		this.ziwaixian = ziwaixian;
	}
	public String getDay_weather_pic() {
		return day_weather_pic;
	}
	public void setDay_weather_pic(String day_weather_pic) {
		this.day_weather_pic = day_weather_pic;
	}
	public int getWeekday() {
		return weekday;
	}
	public void setWeekday(int weekday) {
		this.weekday = weekday;
	}
	public String getNight_air_temperature() {
		return night_air_temperature;
	}
	public void setNight_air_temperature(String night_air_temperature) {
		this.night_air_temperature = night_air_temperature;
	}
	public String getDay_air_temperature() {
		return day_air_temperature;
	}
	public void setDay_air_temperature(String day_air_temperature) {
		this.day_air_temperature = day_air_temperature;
	}
	public String getDay_wind_direction() {
		return day_wind_direction;
	}
	public void setDay_wind_direction(String day_wind_direction) {
		this.day_wind_direction = day_wind_direction;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getNight_weather_pic() {
		return night_weather_pic;
	}
	public void setNight_weather_pic(String night_weather_pic) {
		this.night_weather_pic = night_weather_pic;
	}
	public String getNight_wind_direction() {
		return night_wind_direction;
	}
	public void setNight_wind_direction(String night_wind_direction) {
		this.night_wind_direction = night_wind_direction;
	}
}
