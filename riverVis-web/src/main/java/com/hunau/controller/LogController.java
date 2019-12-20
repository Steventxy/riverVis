package com.hunau.controller;

import com.hunau.entity.Area;
import com.hunau.entity.Page;
import com.hunau.service.AreaManager;
import com.hunau.service.LogManager;
import com.hunau.service.UsersManager;
import com.hunau.util.Jurisdiction;
import com.infopublic.util.ObjectExcelView;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/log")
public class LogController extends BaseController{

	@Resource(name="logService")
	private LogManager logService;
	@Resource(name="areaService")
	private AreaManager areaService;
	@Resource(name="usersService")
	private UsersManager usersService;
	@RequestMapping("/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<Area> arealist = new ArrayList<Area>();
		String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
		String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
		if(lastLoginStart != null && !"".equals(lastLoginStart)){
			pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
		}
		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
			pd.put("lastLoginEnd", lastLoginEnd+" 23:59:59");
		} 
		String userid = "";
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
		pd.put("aidlist", aidlist);
		page.setPd(pd);
		List<PageData> loglist= logService.getLogs(page);
		mv.setViewName("log/log_list");
		mv.addObject("loglist",loglist);
		mv.addObject("pd",pd);
		return mv;
	}
	/**导出到excel
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/excel")
	public ModelAndView excel() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ids = pd.getString("checkedidlist");
		List<String> idlist = new ArrayList<String>();
		if(null != ids && !"".equals(ids)){
			String Arrayuserids[] = ids.split(",");
			for(int i=0;i<Arrayuserids.length;i++){
				idlist.add(Arrayuserids[i]);
			}
			pd.put("ids", idlist);
		}else{
			pd.put("ids", null);
		}
		List<PageData> list = logService.getLogsByIds(pd);
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("日志类别"); 		//1
			titles.add("操作用户"); 		//2
			titles.add("功能模块");	//3
			titles.add("操作");	//4
			titles.add("生成日期");	//5
			titles.add("IP地址");	//6
			titles.add("备注");	//7
			dataMap.put("titles", titles);
			List<PageData> varList = new ArrayList<PageData>();
			for(PageData item : list){
				PageData vpd = new PageData();
				vpd.put("var1", item.get("logtype").toString());		//1
				vpd.put("var2", item.get("username").toString());		//2
				vpd.put("var3", item.get("function").toString());			//3
				vpd.put("var4", item.get("logcontent").toString());			//3
				vpd.put("var5", item.get("logtime").toString());			//4
				vpd.put("var6", item.get("ip").toString());			//4
				vpd.put("var7", item.get("remark").toString());			//4
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
