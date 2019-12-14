package com.hunau.entity;

import java.util.List;

/**
 * 区域类
 * @ClassName Area
 * @Description TODO
 * @author HTT
 * @date 2016年11月15日 下午1:03:56
 */
public class Area {

	private String aid;//区域编号
	private String parentaid;//父区域编号
	private String aname;//区域名称
	private String note;//备注
	private String userid;//备注
	
	private String parentaname;
	private List<Area> subArea;
	
	
public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getParentaid() {
		return parentaid;
	}
	public void setParentaid(String parentaid) {
		this.parentaid = parentaid;
	}
	//	public Integer getAid() {
//		return aid;
//	}
//	public void setAid(Integer aid) {
//		this.aid = aid;
//	}
//	public Integer getParentaid() {
//		return parentaid;
//	}
//	public void setParentaid(Integer parentaid) {
//		this.parentaid = parentaid;
//	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
//	public Area getParentArea() {
//		return parentArea;
//	}
//	public void setParentArea(Area parentArea) {
//		this.parentArea = parentArea;
//	}
	public List<Area> getSubArea() {
		return subArea;
	}
	public void setSubArea(List<Area> subArea) {
		this.subArea = subArea;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getParentaname() {
		return parentaname;
	}
	public void setParentaname(String parentaname) {
		this.parentaname = parentaname;
	}
	
	@Override
	public boolean equals(Object obj) {
		Area s=(Area)obj; 
		return aid.equals(s.aid) ; 
	}
	@Override
	public int hashCode() {
		String in = aid ;
		return in.hashCode();
	}
	public int compareTo(Area arg0) {
        return this.getAid().compareTo(arg0.getAid());
    }
	
}
