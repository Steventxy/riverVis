package com.hunau.entity;
/**
 * 终端流量使用信息
 * @author HTT
 *
 */
public class Traffic {
	private Integer ttid;//编号
	private Integer tid;//终端编号
	private String usetraffic;//已使用流量
	private String lasttime;//最后流量统计时间
	private String remark;
	public Integer getTtid() {
		return ttid;
	}
	public void setTtid(Integer ttid) {
		this.ttid = ttid;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getUsetraffic() {
		return usetraffic;
	}
	public void setUsetraffic(String usetraffic) {
		this.usetraffic = usetraffic;
	}
	public String getLasttime() {
		return lasttime;
	}
	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
