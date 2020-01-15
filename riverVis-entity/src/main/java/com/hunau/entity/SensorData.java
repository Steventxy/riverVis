package com.hunau.entity;

/**
 * @author 刘家玮
 * 程序名称：SensorData.java
 * 程序描述：传感器采集的数据的相关属性
 * 修改时间：2017-10-25
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public class SensorData {
	private int id; //数据编号
	private String rain; //雨量数据
	private String flow; //河流流量数据
	private String wlevel; //河流水位数据
	private String ph; //河流酸碱度
	private String pm; //空气质量
	private String temp; //温度
	private String hum; //湿度
	private String soilHum;//土壤湿度
	private String isBody;
	private String aid; //数据采集区域编号
	private String time; //数据采集时间
	private boolean remark; //数据是否有效
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRain() {
		return rain;
	}
	public void setRain(String rain) {
		this.rain = rain;
	}
	public String getFlow() {
		return flow;
	}
	public void setFlow(String flow) {
		this.flow = flow;
	}
	public String getWlevel() {
		return wlevel;
	}
	public void setWlevel(String wlevel) {
		this.wlevel = wlevel;
	}
	public String getPh() {
		return ph;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}

	public String getSoilHum() {
		return soilHum;
	}

	public void setSoilHum(String soilHum) {
		this.soilHum = soilHum;
	}

	public String getIsBody() {
		return isBody;
	}

	public void setIsBody(String isBody) {
		this.isBody = isBody;
	}

	/**
	 * @return pm
	 */
	public String getPm() {
		return pm;
	}
	/**
	 * @param pm 要设置的 pm
	 */
	public void setPm(String pm) {
		this.pm = pm;
	}
	/**
	 * @return temp
	 */
	public String getTemp() {
		return temp;
	}
	/**
	 * @param temp 要设置的 temp
	 */
	public void setTemp(String temp) {
		this.temp = temp;
	}
	/**
	 * @return hum
	 */
	public String getHum() {
		return hum;
	}
	/**
	 * @param hum 要设置的 hum
	 */
	public void setHum(String hum) {
		this.hum = hum;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public boolean isRemark() {
		return remark;
	}
	public void setRemark(boolean remark) {
		this.remark = remark;
	}
}
