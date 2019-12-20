package com.hunau.controller;

import com.hunau.entity.Area;
import com.hunau.service.AreaManager;
import com.hunau.service.LogManager;
import com.infopublic.util.AppUtil;
import com.hunau.util.Jurisdiction;
import com.infopublic.util.ObjectExcelView;
import com.infopublic.util.PageData;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/area")
public class AreaController extends BaseController {
	@Resource(name="areaService")
	private AreaManager areaService;
	@Resource(name="logService")
	private LogManager logService;


	/**
	 * 显示区域列表ztree(个人信息修改的区域选择)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listSelectArea")
	@ResponseBody
	public Object listSelectArea()throws Exception{
		String json = null;
		try{
			JSONArray arr = JSONArray.fromObject(areaService.listAllArea("")); //所有区域列表
			json = arr.toString();
			json = json.replaceAll("\"parentaid\"", "pId").replaceAll("\"aid\"", "id").replaceAll("\"aname\"", "name");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return json;
	}

	/**
	 * 显示区域列表ztree(区域管理)--只有超级管理员有此权限
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listAllArea")
	public ModelAndView listAllArea(Model model)throws Exception{
		if(!Jurisdiction.hasJurisdiction("area/listAllArea.do")){return null;} //权限校验
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String aid = pd.getString("aid");
		try{
			JSONArray arr = JSONArray.fromObject(areaService.listAllArea(""));
			String json = arr.toString();
			json = json.replaceAll("parentaid", "pId").replaceAll("aid", "id").replaceAll("aname", "name");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("aid",aid);
			mv.setViewName("area/area_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 显示区域列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			String aid = (null == pd.get("aid") || "".equals(pd.get("aid").toString()))?"0":pd.get("aid").toString();
			List<Area> areaList = new ArrayList<Area>();
				areaList = areaService.listSubAreaByParentAid(aid);
			Area area = areaService.getAreaByAid(aid);
			pd.put("area", area);
			mv.addObject("pd", pd);	//传入父区域所有信息
			mv.addObject("aid", aid);
			mv.addObject("MSG", null == pd.get("MSG")?"list":pd.get("MSG").toString()); //MSG=change 则为编辑或删除后跳转过来的
			mv.addObject("areaList", areaList);
			mv.setViewName("area/area_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 请求新增区域页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String aid = (null == pd.get("aid") || "".equals(pd.get("aid").toString()))?"0":pd.get("aid").toString();//接收传过来的上级区域ID,如果上级为顶级就取值“0”
			pd.put("aid",aid);
			Area parentArea = areaService.getAreaByAid(aid);
			pd.put("parea", parentArea);//传入父区域所有信息
			mv.addObject("pd", pd);				//传入父区域所有信息
			mv.addObject("aid", aid);					//传入区域ID，作为子区域的父区域ID用
			mv.addObject("MSG", "add");							//执行状态 add 为添加
			mv.setViewName("area/area_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 添加区域信息
	 * @param area
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(Area area)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加区域");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(area.getParentaid()==null ||area.getParentaid().equals("")){
			pd.put("parentaid","0");
			area.setParentaid("0");;
		}else{
			pd.put("parentaid", area.getParentaid());
		}
		try{
				int count = Integer.parseInt(areaService.findCurLevelMaxId(pd).get("AID").toString());
				String id = new DecimalFormat("00").format(count+1);
				if(area.getParentaid().equals("0")){
					area.setAid(id);
				}else{
					area.setAid(area.getParentaid()+id);
				}
			areaService.saveArea(area); //保存区域
			
			//插入日志
			String logstr ="添加区域："+area.getAname();
//			logService.saveLog(this.get32UUID(),logstr);
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("redirect:list.do?MSG='change'&aid="+area.getParentaid()); //保存成功跳转到列表页面
		return mv;
	}
	
	/**
	 * 删除区域
	 * @param aid
	 * @param out
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String aid)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除区域");
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "";
		try{
			if(areaService.listSubAreaByParentAid(aid).size() > 0){//判断是否有子菜单，是：不允许删除
				errInfo = "false";
			}else{
				areaService.deleteAreaByAid(aid);
				errInfo = "success";
				Area area = areaService.getAreaByAid(aid);
				//插入日志
				String logstr ="删除区域："+area.getAname();
//				logService.saveLog(this.get32UUID(),logstr);	
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 请求编辑区域页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(String aid)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("aid",aid);				//接收过来的要修改的ID
			Area area = areaService.getAreaByAid(aid);	//读取此ID的区域数据
			Area parentArea = areaService.getAreaByAid(area.getParentaid());
			pd.put("area", area);
			pd.put("parea", parentArea);//传入父区域所有信息
			mv.addObject("pd", pd);			//放入视图容器			
			mv.addObject("aid", area.getParentaid());	//传入父区域ID，作为子区域的父区域ID用
			mv.addObject("MSG", "edit");
			mv.setViewName("area/area_edit");
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
	public ModelAndView edit(Area area)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改区域");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			areaService.editArea(pd);
			
			//插入日志
			String logstr ="编辑区域："+area.getAname();
//			logService.saveLog(this.get32UUID(),logstr);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.setViewName("redirect:list?MSG='change'&aid="+area.getParentaid()); //保存成功跳转到列表页面
		return mv;
	}
	
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userid", Jurisdiction.getUserid());
		String ids = pd.getString("checkedidlist");
		if(null != ids && !"".equals(ids)){
			String Arrayuserids[] = ids.split(",");
			List<String> aid = new ArrayList<String>();
			for(int i=0;i<Arrayuserids.length;i++){
				aid.add(Arrayuserids[i]);
			}
			pd.put("aid", aid);
		}else{
			pd.put("aid", null);
		}
		List<PageData> AreaList = areaService.listAreaByAid(pd);
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("区域编号"); 		//1
			titles.add("父区域编号"); 		//2
			titles.add("区域名称");	//3
			titles.add("备注");	//4
			dataMap.put("titles", titles);
		
			List<PageData> varList = new ArrayList<PageData>();
			for(PageData area : AreaList){
				PageData vpd = new PageData();
				vpd.put("var1", area.get("aid"));		//1
				vpd.put("var2", area.get("parentaid"));		//2
				vpd.put("var3", area.get("aname"));			//3
				vpd.put("var4", area.get("note"));			//4
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
//			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
}
