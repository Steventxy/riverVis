package com.infopublic.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.infopublic.util.DTree;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infopublic.entity.Area;
import com.infopublic.entity.Page;
import com.infopublic.entity.Terminal;
import com.infopublic.service.AreaManager;
//import com.infopublic.service.DataAnalysisManager;
import com.infopublic.service.LogManager;
import com.infopublic.service.MessageManager;
import com.infopublic.service.TerManager;
import com.infopublic.service.UsersManager;
//import com.infopublic.service.impl.DataAnalysisService;
import com.infopublic.util.AppUtil;
import com.infopublic.util.Const;
import com.infopublic.util.DateUtil;
import com.infopublic.util.Jurisdiction;
import com.infopublic.util.PageData;
//import com.infopublic.util.SmsMain;

import java.io.IOException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpClientParams;

/** 
 * 类名称：ProgBroadController
 * @version
 */
@SuppressWarnings("unused")
@Controller
@RequestMapping(value="/smsbroad")
public class SmsBroadController extends BaseController {
	private final String FUNCTION ="短信发送";
	@Resource(name="logService")
	private LogManager logService;
	@Resource(name="areaService")
	private AreaManager areaService;
	@Resource(name="terService")
	private TerManager terService;
	@Resource(name="messageService")
	private MessageManager messageService;
	@Resource(name="usersService")
	private UsersManager usersService;

	/**
	 * 去发送短信(同时构建用户列表)
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toSendSms")
	public ModelAndView toAddBroad()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String lastjson = null;
		List<Area> arealist = new ArrayList<Area>();
		String userid="";
		if(!Jurisdiction.getUserRid().equals("1")){
			userid=Jurisdiction.getUserid();
		}
		pd.put("userid", userid);
		List<String> aidlist = new ArrayList<String>();
		String aid = usersService.getAidByUserid(Jurisdiction.getUserid());
		if(aid==null||aid.equals("0")) {
			aid="0";
		}else{
			Area a = new Area();
			a = areaService.getAreaByAid(aid);
			arealist.add(a); //获取当前用户所在区域编号加入当前区域
			aidlist.add(a.getAid());
			
		}
		arealist.addAll(areaService.listAllSubByPAid(aid)); //所有子区域（级联）信息
		for(Area area:arealist){
			aidlist.add(area.getAid());
		}
		List<Terminal> terminals = new ArrayList<Terminal>();
		if(aidlist.size()>0){
			pd.put("aidlist", aidlist);
			terminals = terService.listTersByAids(pd);
		}
		JSONArray lastarr = new JSONArray();
		JSONArray areaarr = JSONArray.fromObject(arealist); //所有分组列表
		for(int i=0;i<areaarr.size();i++){//设置jsonobject类型：0表示分组，1表示终端
			JSONObject obj= areaarr.getJSONObject(i);
			obj.element("type", "0");
			obj.element("isParent", true);
			lastarr.add(obj);
		}
		JSONArray terarr = JSONArray.fromObject(terminals);//所有终端列表
		String terjson = terarr.toString().replaceAll("\"aid\"", "pId").replaceAll("\"tid\"", "id").replaceAll("\"tname\"", "name");
		terarr = JSONArray.fromObject(terjson);
		for(int i=0;i<terarr.size();i++){
			JSONObject obj= terarr.getJSONObject(i);
			obj.element("type", "1");
			lastarr.add(obj);
		}
		lastjson = lastarr.toString().replaceAll("\"parentaid\"", "pId").replaceAll("\"aid\"", "id").replaceAll("\"aname\"", "name");
		mv.addObject("areaTerJson", lastjson);
		mv.addObject("pd", pd);
		mv.setViewName("message/sms_send");
		return mv;
	}
		
	/**
	 * 发送短信
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/sendsms")
	@ResponseBody
	public Object addProBroad()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String userid=Jurisdiction.getUserid();
		String[] terids = pd.getString("terids").split(",");
		String[] phones = pd.getString("phones").split(",");
		String note ="短信预警";
		List<String> phonelist = new ArrayList<String>();  //接收短信手机号码，有多个，即同时可发多个
		String content = pd.getString("content");
		for(int i=0;i<terids.length;i++){
			phonelist.add(phones[i]);
			pd.put("tid", terids[i]);
			pd.put("sendtime", DateUtil.getTime());
			pd.put("scontent", content);
			pd.put("smobile", phones[i]);
			pd.put("remark", note);
			pd.put("issend", 1);
			//添加发送短信表
			messageService.addSendMessage(pd);
		}
		
		
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn"); 
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
		NameValuePair[] data ={ new NameValuePair("Uid", "zhanghongquan"),new NameValuePair("Key", "d41d8cd98f00b204e980"),new NameValuePair("smsMob",phonelist.get(0)),new NameValuePair("smsText",content)};
		post.setRequestBody(data);
		client.executeMethod(post);
		
		
		

		
//    	SmsMain.sendSmsAll(phonelist, content);
//		logService.saveLog(Const.LOGTYPE[1], FUNCTION, "发送短信", this.getRemortIP(), note);
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}

	/**删除短信
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteMsg")
	public void deleteRole(PrintWriter out) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		messageService.deleteMsg(pd.getString("smid")); //要删除的用户id
		out.write("success");
		out.close();
		//插入日志
		logService.saveLog(Const.LOGTYPE[1],"收件箱","删除",this.getRemortIP(),pd.getString("smid"));
	}


	/**
	 * 发件箱列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listSendMessage")
	public ModelAndView listSendMessage(Page page)throws Exception{
		if(!Jurisdiction.hasJurisdiction("smsbroad/listSendMessage.do")){return null;} //权限校验
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userid", Jurisdiction.getUserid());
		String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
		String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
		if(lastLoginStart != null && !"".equals(lastLoginStart)){
			pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
		}
		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
			pd.put("lastLoginEnd", lastLoginEnd+" 23:59:59");
		} 
		
		List<PageData> sendlist = new ArrayList<PageData>();
		page.setPd(pd);
		sendlist = messageService.listSendMessage(page);					
		mv.addObject("sendlist",sendlist);
		mv.addObject("pd", pd);
		mv.setViewName("message/send_list");
		return mv;
	}
}
