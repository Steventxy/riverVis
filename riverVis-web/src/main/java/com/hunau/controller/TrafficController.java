package com.hunau.controller;

import com.hunau.entity.Area;
import com.hunau.entity.Organization;
import com.hunau.entity.Page;
import com.hunau.service.*;
import com.infopublic.util.AppUtil;
import com.infopublic.util.Const;
import com.hunau.util.Jurisdiction;
import com.infopublic.util.PageData;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** 
 * 类名称：TrafficController
 * @version
 */
@Controller
@RequestMapping(value="/traffic")
public class TrafficController extends BaseController {
	
	@Resource(name="logService")
	private LogManager logService;
	@Resource(name="areaService")
	private AreaManager areaService;
	@Resource(name="trafficService")
	private TrafficManager trafficService;
	@Resource(name="usersService")
	private UsersManager usersService;
	@Resource(name="organizationService")
	private OrganizationManager organizationService;
	
	
	//*********终端流量信息***********
	/**
	 * 终端流量信息列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listTerTraffic")
	@ResponseBody
	public ModelAndView listTerTraffic(Page page)throws Exception{
		if(!Jurisdiction.hasJurisdiction("traffic/listTerTraffic.do")){return null;} //权限校验
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<String> aidlist = new ArrayList<String>();
		String aid ="";
		if(pd.get("groupnamekey")!=null && !"".equals(pd.getString("groupnamekey"))){//有分组查询时，按该分组查询其及其下分组的终端
			aidlist = areaService.getAidByAname(pd.getString("groupnamekey"));
//			if(aidlist!=null&& aidlist.size()>0){
//				for(String item:aidlist){
//					arealist.addAll(areaService.listAllSubByPAid(item)); //所有子区域（级联）信息
//				}
//			}
		}else{//没有分组查询
			aid = usersService.getAidByUserid(Jurisdiction.getUserid());
			if(aid==null||aid.equals("0")) {
				aid="0";
			}
			aidlist.add(aid);
//			arealist.addAll(areaService.listAllSubByPAid(aid)); //所有子区域（级联）信息
		}
		pd.put("aidlist", aidlist);
		page.setPd(pd);
		List<PageData> trafficlist = trafficService.listTerTraffic(page);
		mv.addObject("pd",pd);
		mv.addObject("trafficlist",trafficlist);
		
		mv.setViewName("traffic/traffic_list");
		return mv;
	}
	/**
	 * 去设置终端流量限制
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toSetTrafficLimit")
	public ModelAndView toSetTrafficLimit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
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
		mv.addObject("areaTerJson", lastjson);//区域和终端列表
		mv.setViewName("traffic/trafficlimit_set");
		return mv;
	}
	/**
	 * 保存设置
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/saveSet")
	@ResponseBody
	public Object saveSet(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String[] tids = pd.getString("terids").split(",");
		List<PageData> pdlist = new ArrayList<PageData>();
		for(int i=0;i<tids.length;i++){
			PageData itempd = new PageData();
			itempd.put("tid", tids[i]);
			itempd.put("trafficlimit", pd.getString("trafficlimit"));
			pdlist.add(itempd);
		}
		//批量设置
		try {
			trafficService.updateTerTrafficLimit(pdlist);
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", "error");
			e.printStackTrace();
		}
		try {
			String tidstr = pd.getString("terids");
			logService.saveLog(Const.LOGTYPE[1], "流量信息", "批量设置流量限制", this.getRemortIP(), tidstr.length()>200?tidstr.substring(0, 190)+"...等":tidstr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 批量设置终端启用
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/setTerIsuseOn")
	@ResponseBody
	public Object setTerIsuseOn(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String[] tids = pd.getString("checkedidlist").split(",");
		List<String> pdlist = new ArrayList<String>();
		for(int i=0;i<tids.length;i++){
			pdlist.add(tids[i]);
		}
		//批量设置
		try {
			organizationService.setTerIsuseOn(pdlist);
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", "error");
			e.printStackTrace();
		};
		try {
			String idstr =pd.getString("checkedidlist");
			logService.saveLog(Const.LOGTYPE[1], "流量信息", "批量设置终端启用", this.getRemortIP(), idstr.length()>200?idstr.substring(0, 190)+"...等":idstr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	@RequestMapping(value="/setTerIsuseOff")
	@ResponseBody
	public Object setTerIsuseOff(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String[] tids = pd.getString("checkedidlist").split(",");
		List<String> pdlist = new ArrayList<String>();
		for(int i=0;i<tids.length;i++){
			pdlist.add(tids[i]);
		}
		//批量设置
		try {
			organizationService.setTerIsuseOff(pdlist);
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", "error");
			e.printStackTrace();
		};
		try {
			String idstr =pd.getString("checkedidlist");
			logService.saveLog(Const.LOGTYPE[1], "流量信息", "批量设置终端停用", this.getRemortIP(), idstr.length()>200?idstr.substring(0, 190)+"...等":idstr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
}
