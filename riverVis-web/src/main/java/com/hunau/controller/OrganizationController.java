package com.hunau.controller;

import com.hunau.entity.Area;
import com.hunau.entity.Organization;
import com.hunau.entity.Page;
import com.hunau.entity.Pow;
import com.hunau.service.AreaManager;
import com.hunau.service.LogManager;
import com.hunau.service.OrganizationManager;
import com.hunau.service.impl.PowService;
import com.infopublic.util.AppUtil;
import com.infopublic.util.Const;
import com.hunau.util.Jurisdiction;
import com.infopublic.util.PageData;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/orgnz")
public class OrganizationController  extends BaseController{
	private static final String FUNCTION ="终端管理";
	@Resource(name="organizationService")
	private OrganizationManager organizationService;
	@Resource(name="areaService")
	private AreaManager areaService;
	@Resource(name="logService")
	private LogManager logService;
	@Resource(name="powService")
	private PowService powService;
	/**
	 * 终端列表(终端选择)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listOrgnz")
	@ResponseBody
	public Object listOrgnz()throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		String aid = pd.getString("aid");		
		List<PageData> orgnzs = organizationService.listAllOrgnzByAid(aid);
		return orgnzs;
	}
	

	/**
	 * 显示区域列表ztree(终端管理)--只有超级管理员有此权限
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listAllOrgnz")
	public ModelAndView listAllOrgnz(Model model, String aid)throws Exception{
		if(!Jurisdiction.hasJurisdiction("orgnz/listAllOrgnz.do")){return null;} //权限校验
		ModelAndView mv = this.getModelAndView();
		try{
			JSONArray arrArea = JSONArray.fromObject(areaService.listAllArea(""));
			String json = arrArea.toString();
			json = json.replaceAll("parentaid", "pId").replaceAll("aid", "id").replaceAll("aname", "name");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("aid",aid);
			mv.setViewName("organization/orgnz_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
//	
	/**
	 * 终端数据展示
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listOrgnzdata")
	public ModelAndView listOrgnzdata(Model model, String aid)throws Exception{
		if(!Jurisdiction.hasJurisdiction("orgnz/listOrgnzdata.do")){return null;} //权限校验
		ModelAndView mv = this.getModelAndView();
		try{
			JSONArray arrArea = JSONArray.fromObject(areaService.listAllArea(""));
			String json = arrArea.toString();
			json = json.replaceAll("parentaid", "pId").replaceAll("aid", "id").replaceAll("aname", "name");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("aid",aid);
			mv.setViewName("organization/orgnz_data");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 显示终端数据
	 * @param model
	 * @return
	 */
	@RequestMapping("/listdata")
	public ModelAndView listdata(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try{
			
			//List<PageData> orgnzList = new ArrayList<PageData>();
			//List<PageData> orgnzList =new ArrayList<PageData>();
			List<Pow> orgnzList =new ArrayList<Pow>();
			String aid = (null == pd.get("aid") || "".equals(pd.get("aid").toString()))?"":pd.get("aid").toString();
			if(null == aid || "".equals(aid)){
				//orgnzList = organizationService.listAllOrgnzdata(page);
				pd.put("area", "");
				pd.put("aid", "");
			}else{
				//orgnzList = organizationService.listAllOrgnzByAid(aid);
				//orgnzList = organizationService.getOrgnzdata(page);
				
				Area area = areaService.getAreaByAid(aid);
				pd.put("area", area);
				pd.put("aid", aid);
				
			}
			page.setPd(pd);
			 orgnzList = powService.getOrgnzdata(page);
			mv.addObject("pd", pd);	//传入父区域所有信息
			
			mv.addObject("orgnzList", orgnzList);
			mv.addObject("editQX", true);
			mv.setViewName("organization/orgnz_listdata");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 显示终端列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try{
			
			//List<PageData> orgnzList = new ArrayList<PageData>();
			List<Organization> orgnzList =new ArrayList<Organization>();
			String aid = (null == pd.get("aid") || "".equals(pd.get("aid").toString()))?"":pd.get("aid").toString();
			if(null == aid || "".equals(aid)){
				//orgnzList = organizationService.listAllOrgnz(page);
				pd.put("area", "");
				pd.put("aid", "");
			}else{
				//orgnzList = organizationService.listAllOrgnzByAid(aid);
				//orgnzList = organizationService.getOrgnz(page);
				
				Area area = areaService.getAreaByAid(aid);
				pd.put("area", area);
				pd.put("aid", aid);
			}
			page.setPd(pd);
			orgnzList = organizationService.getOrgnz(page);
			mv.addObject("pd", pd);	//传入父区域所有信息
			mv.addObject("orgnzList", orgnzList);
			mv.setViewName("organization/orgnz_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	

	/**
	 * 请求新增终端页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String aid = (null == pd.get("aid") || "".equals(pd.get("aid").toString()))?"":pd.get("aid").toString();//接收传过来的上级区域ID,如果上级为顶级就取值“0”
			Area area = areaService.getAreaByAid(aid);
			if(area!=null){
				mv.addObject("aname", area.getAname());					//传入区域名称，作为终端的父区域名称用
			}
			mv.addObject("aid", aid);					//传入区域ID，作为终端的父区域ID用
			mv.addObject("MSG", "add");							//执行状态 add 为添加
			mv.setViewName("organization/orgnz_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 添加终端信息
	 * @param orgnz
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(Organization orgnz)throws Exception{
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"添加终端");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("aid", orgnz.getAid());
		try{
			if(pd.get("isuse")==null||pd.get("isuse")==""){
				pd.put("isuse", 1);
			}else{
				pd.put("isuse", Integer.parseInt(pd.getString("isuse")));
			}
			int count = Integer.parseInt(organizationService.findCurLevelMaxId(pd).get("count").toString());
			String id = new DecimalFormat("00").format(count+1);
			orgnz.setTid(orgnz.getAid()+id);
			organizationService.saveOrgnz(orgnz); //保存机构
			//插入日志
			logService.saveLog(Const.LOGTYPE[1],FUNCTION,"新增",this.getRemortIP(),orgnz.getTname());
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("redirect:list.do?aid="+orgnz.getAid()); //保存成功跳转到列表页面
		return mv;
	}
	
	/**
	 * 删除终端
	 * @param oid
	 * @param out
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除机构");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		try{
				organizationService.deleteOrgnzByOid(pd.get("tid").toString());
				errInfo = "success";
				//插入日志
				logService.saveLog(Const.LOGTYPE[1],FUNCTION,"删除",this.getRemortIP(),pd.get("tid").toString());
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 批量删除
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteAllO")
	@ResponseBody
	public Object deleteAllO() throws Exception {
		logBefore(logger, Jurisdiction.getUsername()+"批量删除orgnz");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String tids = pd.getString("tids");
		if(null != tids && !"".equals(tids)){
			String Arraytids[] = tids.split(",");
			organizationService.deleteAllO(Arraytids);
			pd.put("msg", "ok");
			//插入日志
			logService.saveLog(Const.LOGTYPE[1],FUNCTION,"批量删除",this.getRemortIP(),tids);
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 请求编辑区域页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(String tid)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("tid",tid);				//接收过来的要修改的ID
			Organization orgnz = organizationService.getOrgnzByOid(tid);	//读取此ID的机构数据
			pd.put("orgnz", orgnz);
			Area area = areaService.getAreaByAid(orgnz.getAid());
			mv.addObject("pd", pd);			//放入视图容器			
			mv.addObject("aid", orgnz.getAid());	//传入父区域ID，作为机构父区域ID用
			mv.addObject("aname", area.getAname());					//传入区域名称，作为机构的父区域名称用
			mv.addObject("MSG", "edit");
			mv.setViewName("organization/orgnz_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 请求查看消息界面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/read")
	public ModelAndView read(String tid)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("tid",tid);				//接收过来的要修改的ID
			Organization orgnz = organizationService.getOrgnzByOid(tid);	//读取此ID的机构数据
			pd.put("orgnz", orgnz);
			Area area = areaService.getAreaByAid(orgnz.getAid());
			mv.addObject("pd", pd);			//放入视图容器			
			mv.addObject("aid", orgnz.getAid());	//传入父区域ID，作为机构父区域ID用
			mv.addObject("aname", area.getAname());					//传入区域名称，作为机构的父区域名称用
			mv.addObject("MSG", "edit");
			mv.setViewName("organization/orgnz_read");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * 保存编辑
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(Organization orgnz)throws Exception{
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			if(pd.get("isuse")!=null && pd.get("isuse")!=""){
				pd.put("isuse", pd.get("isuse").toString().equals("1")?1:0);
			}
			organizationService.editOrgnz(pd);
			
			//插入日志
			logService.saveLog(Const.LOGTYPE[1],FUNCTION,"编辑",this.getRemortIP(),pd.getString("tid"));
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.setViewName("redirect:list?aid="+orgnz.getAid()); //保存成功跳转到列表页面
		return mv;
	}
	
	/**
	 * 查看授权号码
	 * @param telid
	 * @param out
	 */
	@RequestMapping(value="/showTel")
		public ModelAndView showTel(Page page)throws Exception{
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			page.setPd(pd);
			try{
				List<PageData> tellist = organizationService.getTelByTid(page);	//读取此ID的申请信息
				mv.addObject("pd", pd);
				mv.addObject("tellist", tellist);
				mv.setViewName("organization/orgnz_phone");
			} catch(Exception e){
				logger.error(e.toString(), e);
			}
		return mv;
	}
	/**
	 * 删除授权号码
	 * @param out
	 */
	@RequestMapping(value="/deletetel")
	@ResponseBody
	public Object deletetel()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		try{
				organizationService.deleteTerTelByTelid(pd.get("telid").toString());
				errInfo = "success";
				//插入日志
				logService.saveLog(Const.LOGTYPE[1],FUNCTION,"删除授权号码",this.getRemortIP(),pd.get("telid").toString());
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 去添加授权号码
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toAddtel")
	public ModelAndView toAddtel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.addObject("tid", pd.get("tid").toString());
		mv.setViewName("organization/tertel_add");
		return mv;
	}
	
	/**
	 * 保存
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/addtel")
	@ResponseBody
	public Object addtel()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		//String uname = Jurisdiction.getUsername();
//		String tid = pd.getString("tid");
//		String tel = pd.getString("tel");
		pd.put("isuse", true);
		organizationService.addTerTel(pd);
		logService.saveLog(Const.LOGTYPE[1], FUNCTION, "添加授权号码", this.getRemortIP(), pd.getString("tid"));
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/dataview")
	public ModelAndView dataview() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<Pow> organdata=powService.getdataview(pd);
		
		mv.addObject("message",JSONArray.fromObject(organdata).toString());
		
		mv.setViewName("organization/dataview");
		
		mv.addObject("type",pd.getString("type") );
		
		
		return mv;
	}
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("datavis/excel.jsp");
		return mv;
	}
}
