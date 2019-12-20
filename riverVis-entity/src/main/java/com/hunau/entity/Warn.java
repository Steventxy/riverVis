package com.hunau.entity;

/**
 * 预警设置
 *
 */
public class Warn{
	private String wid;//预警编号
	
	private String aid;//地区编号	
	private String aname;//区域名称	
	private String content;//预警策略
	private String leveal;//预警级别
	
	private String data;//预警值

	public String getWid() {
		return wid;
	}

	public void setWid(String wid) {
		this.wid = wid;
	}

	
	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getLeveal() {
		return leveal;
	}

	public void setLeveal(String leveal) {
		this.leveal = leveal;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	
	public String getAname() {
		return aname;
	}

	
	public void setAname(String aname) {
		this.aname = aname;
	}

	

	

}
