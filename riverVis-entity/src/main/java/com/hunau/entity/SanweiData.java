package com.hunau.entity;
/**
 * @author 刘家玮
 * 程序名称：
 * 时间：
 * 修改时间：
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public class SanweiData {
	private int id;
	private double waterlevel;
	private double flow;
	private double terraindata;
	private String address;
	private String time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getWaterlevel() {
		return waterlevel;
	}
	public void setWaterlevel(double waterlevel) {
		this.waterlevel = waterlevel;
	}
	public double getFlow() {
		return flow;
	}
	public void setFlow(double flow) {
		this.flow = flow;
	}
	public double getTerraindata() {
		return terraindata;
	}
	public void setTerraindata(double terraindata) {
		this.terraindata = terraindata;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
