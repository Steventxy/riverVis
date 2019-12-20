package com.hunau.controller;

import com.hunau.entity.Page;
import com.hunau.entity.Role;
import com.hunau.entity.Warn;
import com.hunau.service.MenuManager;
import com.hunau.service.RoleManager;
import com.hunau.service.UsersManager;
import com.hunau.service.WarnManager;
import com.infopublic.util.AppUtil;
import com.hunau.util.Jurisdiction;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * @author 施景程
 * 程序名称：WarnController.java
 * 程序描述：预警设置
 * 修改时间：2018-5-6
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */

/** 
 * 类名称：WarnController
 * @version
 */
@Controller
@RequestMapping(value="/warn")
public class WarnController extends BaseController {
	
	@Resource(name="usersService")
	private UsersManager usersService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="warnService")
	private WarnManager warnService;
	
	/**
	 * 查询所有预警信息
	 * @param @throws Exception 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/listAllWarn")
	public ModelAndView listAllWarn(Page page) throws Exception{
		if(!Jurisdiction.hasJurisdiction("warn/listAllWarn.do")) {return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<Warn> warnlist= warnService.getAllWarnList(page);//用户列表
		mv.addObject("warnlist", warnlist);
		mv.addObject("pd", pd);
		mv.setViewName("warn/warn_list");
		return mv;
	}
	

	
	/**去添加预警信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addWarn")
	public ModelAndView addWarn() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<Role> rolelist = roleService.listAllRoles("");
		mv.setViewName("warn/warn_view");
		mv.addObject("MSG", "addW");
		mv.addObject("warnForm", pd.get("warnForm"));
		mv.addObject("rolelist", rolelist);
		return mv;
	}
	/**
	 * 添加用户信息
	 */
	@RequestMapping(value="/addW")
	@ResponseBody
	public Object addU() throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
//		pd.put("password", new SimpleHash("SHA-1",pd.getString("loginid"), pd.getString("password")).toString());
		warnService.insertWarn(pd);
		//插入日志
//		logService.saveLog(Const.LOGTYPE[1],"用户管理","添加",this.getRemortIP(),pd.getString("username"));
		
		map.put("result","success");
		return AppUtil.returnObject(pd, map);
	}
	/**去修改
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editWarn")
	public ModelAndView editWarn() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Warn warn = warnService.findByWid(pd);						//根据ID读取
		List<Role> rolelist = roleService.listAllRoles("");
		
		mv.setViewName("warn/warn_view");
		mv.addObject("from", pd.get("from"));
		mv.addObject("MSG", "editW");
		mv.addObject("rolelist", rolelist);
		mv.addObject("warn", warn);
		return mv;
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/editW")
	@ResponseBody
	public Object editW() throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		//System.out.print(pd.toString());
		warnService.editW(pd);	//执行修改
		//插入日志
//		logService.saveLog(Const.LOGTYPE[1],"用户管理","修改",this.getRemortIP(),pd.getString("userid"));
		
		map.put("result","success");
		return AppUtil.returnObject(pd, map);
	}
	
	/**删除
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteW")
	public void deleteW(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除user");
		PageData pd = new PageData();
		pd = this.getPageData();
		warnService.deleteW(pd.getString("wid")); //要删除的id
		out.write("success");
		out.close();
		
		//插入日志
//		logService.saveLog(Const.LOGTYPE[1],"用户管理","删除",this.getRemortIP(),pd.getString("userid"));
	}
}