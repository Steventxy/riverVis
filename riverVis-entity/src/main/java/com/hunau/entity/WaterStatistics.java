package com.hunau.entity;

public class WaterStatistics {
	private int id;//雨量数据编号
	private int type;//数据类型标识
	private String rid;//地域编号
	private String rname;//地域名称
	private String data;//雨量数据大小
	private String time;//采集日期和时间
	
	private String timeM;//采集日期和时间
	private String timeD;//采集日期和时间	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

	public String getTimeM() {
		return timeM;
	}
	public void setTimeM(String timeM) {
		this.timeM = timeM;
	}
	public String getTimeD() {
		return timeD;
	}
	public void setTimeD(String timeD) {
		this.timeD = timeD;
	}
}
