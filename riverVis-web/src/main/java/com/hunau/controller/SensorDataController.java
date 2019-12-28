package com.hunau.controller;

import com.hunau.entity.Page;
import com.hunau.entity.SensorData;
import com.hunau.entity.Warn;
import com.hunau.service.LogManager;
import com.hunau.service.SensorDataManager;
import com.hunau.service.WarnManager;
import com.hunau.service.impl.PowService;
import com.hunau.util.Jurisdiction;
import com.infopublic.util.AppUtil;
import com.infopublic.util.PageData;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


//传感器采集的数据的跳转与分配
@Controller
@RequestMapping(value="/sensordata")
public class SensorDataController extends BaseController {
	private static final String FUNCTION ="环境数据管理";
	@Resource(name="SensorDataService")
	private SensorDataManager SensorDataService;
	@Resource(name="warnService")
	private WarnManager warnService;
	@Resource(name="powService")
	private PowService powService;
	@Resource(name="logService")
	private LogManager logService;
	/*static SqlSession session;
	static SensorDataMapper sd;
	
	@ModelAttribute
	public void init(){
		session=FKSqlSessionFactory.getSqlSession();
		// 获得EmployeeMapper接口的代理对象
		sd = session.getMapper(SensorDataMapper.class);
	}*/
	
	@RequestMapping(value="/screen1")
	public ModelAndView screen1(ModelAndView mv) throws Exception  //对页面进行分屏处理
	{
		
		//创建一个HashMap存储参数
	    HashMap<String, Object> params = new HashMap<String, Object>();
	   //设置aid属性
		params.put("aid", 7310);   //如果用户没有发送请求，默认为查询区域编号为7310的数据
		// 调用EmployeeMapper接口的selectEmployeeByIdLike方法
		List<SensorData> list = SensorDataService.selectSensorDataByAidLike(params);
		mv.addObject("message",JSONArray.fromObject(list).toString());
		Warn warn = warnService.findWid(4);
		mv.addObject("warn", warn);
		mv.setViewName("datavis/screen1");
		return mv;
	}
	//温湿度雨量酸碱度数据展示页面后台处理
	@RequestMapping(value="/screen3")
	public ModelAndView screen3(ModelAndView mv) throws Exception  //对页面进行分屏处理
	{
		
		//创建一个HashMap存储参数
	    HashMap<String, Object> params = new HashMap<String, Object>();
	   //设置aid属性
		params.put("aid", 7310);   //如果用户没有发送请求，默认为查询区域编号为7310的数据
		// 调用EmployeeMapper接口的selectEmployeeByIdLike方法
		List<SensorData> list = SensorDataService.selectSensorDataByAidLike(params);
		mv.addObject("message",JSONArray.fromObject(list).toString());
		Warn warn = warnService.findWid(3);
		mv.addObject("warn", warn);
		mv.setViewName("datavis/screen3");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajax",method = RequestMethod.POST)
	public String ajax(HttpServletRequest request, HttpServletResponse response) throws Exception  //对ajax局部交互
	{
		String aid=request.getParameter("aid");  //接收前台页面传输过来的数据(区域编号)
		//创建一个HashMap存储参数
	    HashMap<String, Object> params = new HashMap<String, Object>();
	   //设置aid属性
		params.put("aid", aid);   //查询aid=7310(地域编号为7310)的数据，使用动态sql
		// 调用EmployeeMapper接口的selectEmployeeByIdLike方法
		List<SensorData> list = SensorDataService.selectSensorDataByAidLike(params);
		System.out.println("Ajax test success!");
		return JSONArray.fromObject(list).toString();
	}
	
	
	
//	@ResponseBody
//	@RequestMapping(value="/ajax1",method = RequestMethod.POST)
//	public ModelAndView ajax1(ModelAndView mv,HttpServletRequest request, HttpServletResponse response)  //对ajax局部交互
//	{
//	
//		
//	    String data=request.getParameter("data");  //接收前台页面传输过来的数据
//	    
//	    System.out.println("dashjgg");
//	    mv.addObject("message",data);
//		mv.setViewName("datavis/rain");
//		return mv;
//	}
	
	@ResponseBody
	@RequestMapping(value="/rain")
	public ModelAndView rain(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws Exception   //读取数据库中的雨量数据
	{
		String data=request.getParameter("data");  //接收前台页面传输过来的数据
		if(data==null)   //判断用户有没有点击区域地图块，发送异步请求。
		{
			
			//创建一个HashMap存储参数
		    HashMap<String, Object> params = new HashMap<String, Object>();
		   //设置aid属性
			params.put("aid", 7310);   //如果用户没有发送请求，默认为查询区域编号为7310的数据
			// 调用EmployeeMapper接口的selectEmployeeByIdLike方法
			List<SensorData> list = SensorDataService.selectSensorDataByAidLike(params);
			
			System.out.println("sdahjdsaguydgsadsasu");
			
			mv.addObject("message",JSONArray.fromObject(list).toString());
			mv.setViewName("datavis/rain");
			return mv;
		}
		else
		{
			
			System.out.println("hdsauhidashu");
			
			mv.addObject("message",data);
			mv.setViewName("datavis/rain");
		
			System.out.println("hdsauhidashu1"+data);
			return mv;
		}
		
	}
	
	@RequestMapping(value="/maprain")
	public ModelAndView maprain(ModelAndView mv)
	{		
		mv.setViewName("datavis/map_rain");
		return mv;
	}
	
//	@RequestMapping(value="/rain")
//	public ModelAndView rain(ModelAndView mv) throws Exception   //读取数据库中的雨量数据
//	{
//		//创建一个HashMap存储参数
//	    HashMap<String, Object> params = new HashMap<String, Object>();
//	   //设置aid属性
//		params.put("aid", 7310);   //只查询aid=7310(地域编号为7310)的数据，使用动态sql
//		// 调用EmployeeMapper接口的selectEmployeeByIdLike方法
//		List<SensorData> list = sd.selectSensorDataByAidLike(params);
//		
//		//System.out.println("sdahjdsaguydgsu"+JSONArray.fromObject(list).toString());
//		
//		mv.addObject("message",JSONArray.fromObject(list).toString());
//		mv.setViewName("datavis/rain");
//		return mv;
//	}
	
	@RequestMapping(value="/flow")
	public ModelAndView flow(ModelAndView mv)  //读取数据库中的流量数据
	{
		String flowdata=null;
		mv.addObject("message",flowdata);
		mv.setViewName("datavis/flow");
		return mv;
	}
	
	@RequestMapping(value="/wlevel")
	public ModelAndView wlevel(ModelAndView mv) //读取数据库中的水位数据
	{
		String wleveldata=null;
		mv.addObject("message",wleveldata);
		mv.setViewName("datavis/wlevel");
		return mv;
	}
	
	@RequestMapping(value="ph")
	public ModelAndView ph(ModelAndView mv)  //读取数据库中的酸碱度数据
	{
		String phdata=null;
		mv.addObject("message",phdata);
		mv.setViewName("datavis/ph");
		return mv;
	}
	@RequestMapping(value="/tableau")
	public ModelAndView tableau(ModelAndView mv) throws Exception{
		
		mv.setViewName("datavis/tableau");
		return mv;
	}

	@RequestMapping("/envdata")
	public ModelAndView envdata(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try{
			
			
			List<SensorData> orgnzList =new ArrayList<SensorData>();
			String aid = (null == pd.get("aid") || "".equals(pd.get("aid").toString()))?"":pd.get("aid").toString();

				//orgnzList = organizationService.listAllOrgnzdata(page);
				pd.put("area", "");
				pd.put("aid", "");

			page.setPd(pd);
			 orgnzList = SensorDataService.collectdatalistPage(page);
			mv.addObject("pd", pd);	//传入父区域所有信息
			
			mv.addObject("orgnzList", orgnzList);
			mv.addObject("editQX", true);
			mv.setViewName("datavis/env_listdata");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 批量删除
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAllData")
	@ResponseBody
	public Object deleteAllLog() throws Exception {
		logBefore(logger, Jurisdiction.getUsername()+"批量删除数据");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String lids = pd.getString("lids");
		if(null != lids && !"".equals(lids)){
			String Arraylids[] = lids.split(",");
			SensorDataService.deleteAllData(Arraylids);
			pd.put("msg", "ok");
			//插入日志
			//logService.saveLog(Const.LOGTYPE[1],FUNCTION,"批量删除",this.getRemortIP(),tids);
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

}





