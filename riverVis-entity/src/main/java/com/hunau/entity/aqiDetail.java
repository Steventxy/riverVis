package com.hunau.entity;

/**
 * @author 刘家玮
 * 程序名称：aqiDetail.java
 * 程序描述：空气质量系数实体所对应的相关属性
 * 修改时间：2017-10-10
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public class aqiDetail{
	private double co=0; //一氧化碳1小时平均
	private int so2=0; //二氧化硫1小时平均
	private String area; //地区名称
	private int o3=0; //臭氧1小时平均
	private int no2=0; //二氧化氮1小时平均
	//private String area_code; //地区名称(英文名)
	private String quality; //空气质量指数类别，有“优、良、轻度污染、中度污染、重度污染、严重污染”6类
	private int aqi=0;  //空气指数，越小s越好
	private String pm10="0";  //颗粒物（粒径小于等于10μm）1小时平均
	private int pm2_5=0;  //颗粒物（粒径小于等于2.5μm）1小时平均
	private int o3_8h=0; //臭氧8小时平均
	private String primary_pollutant; //首要污染物
	public double getCo() {
		return co;
	}
	public void setCo(double co) {
		this.co = co;
	}
	public int getSo2() {
		return so2;
	}
	public void setSo2(int so2) {
		this.so2 = so2;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getO3() {
		return o3;
	}
	public void setO3(int o3) {
		this.o3 = o3;
	}
	public String getPm10() {
		return pm10;
	}
	public void setPm10(String pm10) {
		this.pm10 = pm10;
	}
	public int getNo2() {
		return no2;
	}
	public void setNo2(int no2) {
		this.no2 = no2;
	}
/*	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
*/
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public int getAqi() {
		return aqi;
	}
	public void setAqi(int aqi) {
		this.aqi = aqi;
	}
	public String getPrimary_pollutant() {
		return primary_pollutant;
	}
	public void setPrimary_pollutant(String primary_pollutant) {
		this.primary_pollutant = primary_pollutant;
	}
	public int getO3_8h() {
		return o3_8h;
	}
	public void setO3_8h(int o3_8h) {
		this.o3_8h = o3_8h;
	}
	public int getPm2_5() {
		return pm2_5;
	}
	public void setPm2_5(int pm2_5) {
		this.pm2_5 = pm2_5;
	}
}