package com.hunau.entity;

/**
 * 机构部门
 * @ClassName Organization
 * @Description TODO
 * @author HTT
 * @date 2016年11月15日 下午1:01:52
 */
public class Organization {
	
	private String tid;//终端编号
	private String aid;//所属区域编号
	private String userid;
	private String tname;//终端名称
	private String address;//终端地址
	private String note;//备注
	private String phone;//管理员电话
	private String facid;//终端出口编号
	private String comstand;//终端接入通信网
	private String broadtel;//终端接入广播
	private String broadfre;//终端可收转广播
	private String manager;//终端管理员名称
	private String managertel;//终端管理员联系电话
	private String lasttime;//最后访问时间
	private String intertime;//交互时间
	private String createdtime;//创建时间
	private Boolean isuse;//是否启用
	private String aname;

	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getaddress() {
		return address;
	}
	public void setaddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFacid() {
		return facid;
	}
	public void setFacid(String facid) {
		this.facid = facid;
	}
	public String getComstand() {
		return comstand;
	}
	public void setComstand(String comstand) {
		this.comstand = comstand;
	}
	public String getBroadtel() {
		return broadtel;
	}
	public void setBroadtel(String broadtel) {
		this.broadtel = broadtel;
	}
	public String getBroadfre() {
		return broadfre;
	}
	public void setBroadfre(String broadfre) {
		this.broadfre = broadfre;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getManagertel() {
		return managertel;
	}
	public void setManagertel(String managertel) {
		this.managertel = managertel;
	}
	public String getIntertime() {
		return intertime;
	}
	public void setIntertime(String intertime) {
		this.intertime = intertime;
	}
	public String getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}
	public Boolean getIsuse() {
		return isuse;
	}
	public void setIsuse(Boolean isuse) {
		this.isuse = isuse;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	
	
}
