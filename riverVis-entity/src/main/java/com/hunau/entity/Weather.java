package com.hunau.entity;


public class Weather {
	private int showapi_res_code;
	private String howapi_res_error;
	private showapi_res_body showapi_res_body;
	public int getShowapi_res_code() {
		return showapi_res_code;
	}
	public void setShowapi_res_code(int showapi_res_code) {
		this.showapi_res_code = showapi_res_code;
	}
	public String getHowapi_res_error() {
		return howapi_res_error;
	}
	public void setHowapi_res_error(String howapi_res_error) {
		this.howapi_res_error = howapi_res_error;
	}
	public showapi_res_body getShowapi_res_body() {
		return showapi_res_body;
	}
	public void setShowapi_res_body(showapi_res_body showapi_res_body) {
		this.showapi_res_body = showapi_res_body;
	}
}
/*
class showapi_res_body{
	private now now;

	public now getNow() {
		return now;
	}

	public void setNow(now now) {
		this.now = now;
	}
}

class now{
	private aqiDetail aqiDetail;

	public aqiDetail getAqiDetail() {
		return aqiDetail;
	}

	public void setAqiDetail(aqiDetail aqiDetail) {
		this.aqiDetail = aqiDetail;
	} 
}
*/
/*
"co": 0.38,
"so2": 8,
"area": "����",
"o3": 42,
"no2": 9,
"area_code": "lijiang",
"quality": "��",
"aqi": 19,
"pm10": 18,
"pm2_5": 12,
"o3_8h": 37,
"primary_pollutant": ""
*/
/*
class aqiDetail{
	private int co;  //һ����̼����
	private int so2; //����������
	private String area; //�������
	private int o3; //��������
	private int no2;
	private String area_code;
	private String quality;
	private int aqi;
	private int pm10;
	private int pm2_5;
	private int o3_8h;
	private String primary_pollutant;
	public int getCo() {
		return co;
	}
	public void setCo(int co) {
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
	public int getPm10() {
		return pm10;
	}
	public void setPm10(int pm10) {
		this.pm10 = pm10;
	}
	public int getNo2() {
		return no2;
	}
	public void setNo2(int no2) {
		this.no2 = no2;
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
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
*/






