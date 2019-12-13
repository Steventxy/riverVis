package com.hunau.controller;

import com.hunau.util.Jurisdiction;
import com.hunau.entity.Area;
import com.hunau.entity.Organization;
import com.hunau.service.AreaManager;
import com.hunau.service.LogManager;
import com.hunau.service.OrganizationManager;
import com.hunau.service.UsersManager;
import com.infopublic.util.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/stream")
public class StreamController extends BaseController{

	@Resource(name="logService")
	private LogManager logService;
	@Resource(name="areaService")
	private AreaManager areaService;
	@Resource(name="usersService")
	private UsersManager usersService;
	@Resource(name="organizationService")
	private OrganizationManager organizationService;
	
	/**
	 * 流媒体直播
	 * @param 
	 * @return
	 */
	@RequestMapping("/streamlive")
	public ModelAndView stream() throws Exception{
		if(!Jurisdiction.hasJurisdiction("stream/streamlive.do")){return null;} //权限校验
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("stream/streamlive");
		mv.addObject("rtmpAddress", Tools.GetValueByKey(Const.CONFIG, "rtmpAddress"));
		mv.addObject("pd",pd);
		return mv;
	}
	@RequestMapping("/setStreamTer")
	public ModelAndView setStreamTer() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String selecttid = pd.getString("selecttid");
		String lastjson;
		if(selecttid!=null && !selecttid.equals("null") && selecttid!=""){
			List<String> selectaid = new ArrayList<String>();
			String[] tids = selecttid.split(",");
			for(int i=0;i<tids.length;i++){
				String parentaid = organizationService.getOrgnzByOid(tids[i]).getAid();
				selectaid.add(parentaid);
				while(!parentaid.equals("0")){
					parentaid = areaService.getAreaByAid(parentaid).getParentaid();
					selectaid.add(parentaid);
				}
			}
			lastjson  = getAreaAndTer(pd,selecttid,selectaid);
		}else{
			lastjson  = getAreaAndTer(pd,"",null);
		}
		mv.addObject("areaTerJson", lastjson);
		mv.setViewName("stream/streamter_set");
		mv.addObject("pd",pd);
		return mv;
	}
	@RequestMapping("/getTerByTid")
	@ResponseBody
	public Object getTerByTid() throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String tids = pd.getString("tids");
		List<String> teridlist = new ArrayList<String>();
		if(tids!=null && !tids.equals("")){
			String[] tidlist = tids.split(",");
			for(int i=0;i<tidlist.length;i++){
				teridlist.add(tidlist[i]);
			}
		}
		pd.put("terlist", teridlist);
		List<PageData> terlist = organizationService.getTerInfoBytids(pd);
		JSONArray terlistarr = JSONArray.fromObject(terlist);;
		map.put("terlistarr", terlistarr.toString());
		return AppUtil.returnObject(new PageData(), map);
	}
	@RequestMapping(value="/addLog")
	public void addLog(PrintWriter out) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		String type = pd.getString("type");
		String streamid = pd.getString("streamid");
		String logcontent = "";
		String note = "" ;
		if(type.equals("open")){
			logcontent = "开启直播";
			note = "直播编号:"+streamid+":"+pd.getString("imeilist");
		}else{
			logcontent = "关闭直播";
			note = "直播编号:"+streamid;
		}
		//插入日志
		logService.saveLog(Const.LOGTYPE[1],"流媒体直播",logcontent,this.getRemortIP(),note.length()>200?note.substring(0, 190)+"...等":note);
		out.write("success");
		out.close();
	}
	private String getAreaAndTer(PageData pd, String selecttid, List<String> selectaid) throws Exception{
		String lastjson = null;
		List<Area> arealist = new ArrayList<Area>();
		String aid = usersService.getAidByUserid(Jurisdiction.getUserid());
		if(aid==null||aid.equals("0")||"1".equals(Jurisdiction.getUserRid())) {
			aid="0";
		}else{
			Area a = new Area();
			a = areaService.getAreaByAid(aid);
			arealist.add(a); //获取当前用户所在区域编号加入当前区域
		}
		arealist.addAll(areaService.listAllSubByPAid(aid)); //所有子区域（级联）信息
		List<Organization> terminals = new ArrayList<Organization>();
		pd.put("aid", aid);
		if("1".equals(Jurisdiction.getUserRid())){
			pd.put("rid", 1);
		}
			terminals = organizationService.listTersByAids(pd);
		JSONArray lastarr = new JSONArray();
		JSONArray areaarr = JSONArray.fromObject(arealist); //所有分组列表
		for(int i=0;i<areaarr.size();i++){//设置jsonobject类型：0表示分组，1表示终端
			JSONObject obj= areaarr.getJSONObject(i);
			if(selectaid!=null&&selectaid.contains(obj.getString("aid"))){
				obj.element("checked", true);
			}
			obj.element("type", "0");
			obj.element("isParent", true);
			lastarr.add(obj);
		}
		JSONArray terarr = JSONArray.fromObject(terminals);//所有终端列表
		String terjson = terarr.toString().replaceAll("\"aid\"", "pId").replaceAll("\"tid\"", "id").replaceAll("\"tname\"", "name");
		terarr = JSONArray.fromObject(terjson);
		for(int i=0;i<terarr.size();i++){
			JSONObject obj= terarr.getJSONObject(i);
			if(!selecttid.equals("")&&selecttid.contains(obj.getString("id"))){
				obj.element("checked", true );
			}
			obj.element("type", "1");
			lastarr.add(obj);
		}
		lastjson = lastarr.toString().replaceAll("\"parentaid\"", "pId").replaceAll("\"aid\"", "id").replaceAll("\"aname\"", "name");
		return lastjson;
	}
}
