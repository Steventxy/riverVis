package com.hunau.entity;
/**
 * 用户
 * @author HTT
 *
 */
public class Users {
	private String userid; //用户编号
	private String usertypes;//账号级别，只有系统管理账号有此属性
	private String loginid;//登录名
	private String password;//登录密码
	private String username; //姓名
	private String usex;//性别
	private String linktel;//联系电话
	private String uemail; //邮箱
	private String qq; //qq
	private String ucardid; //身份证号码
	private String linkaddr; //住址
	private String note;//备注
	private String aid;//区域编号
	private String roleid;//角色编号
	private Boolean isuse;//是否可用
	private String lastdate;
	private int type;//账号类别，是终端管理用户1还是系统管理账号0
	
	//private String aname;//区域名称
	private String aname;//区域名称
	//private String rname;//角色名称
	private String rname;//角色名称
	
	private String roletype;
	private String menurights;
	private String buttonrights;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsertypes() {
		return usertypes;
	}
	public void setUsertypes(String usertypes) {
		this.usertypes = usertypes;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getLinktel() {
		return linktel;
	}
	public void setLinktel(String linktel) {
		this.linktel = linktel;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getUcardid() {
		return ucardid;
	}
	public void setUcardid(String ucardid) {
		this.ucardid = ucardid;
	}
	public String getLinkaddr() {
		return linkaddr;
	}
	public void setLinkaddr(String linkaddr) {
		this.linkaddr = linkaddr;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public Boolean getIsuse() {
		return isuse;
	}
	public void setIsuse(Boolean isuse) {
		this.isuse = isuse;
	}
	public String getLastdate() {
		return lastdate;
	}
	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRoletype() {
		return roletype;
	}
	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}
	public String getMenurights() {
		return menurights;
	}
	public void setMenurights(String menurights) {
		this.menurights = menurights;
	}
	public String getButtonrights() {
		return buttonrights;
	}
	public void setButtonrights(String buttonrights) {
		this.buttonrights = buttonrights;
	}
	
//	@Override
//	public int hashCode() {
//		String id = userid;
//		return id.hashCode();
//	}
//
//	@Override
//	public boolean equals(Object obj) {
//		InfoMUser user=(InfoMUser)obj; 
//		return loginid.equals(user.getUserinfo().getUsername()) ; 
//	}
}
