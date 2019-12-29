package com.hunau.controller;


import com.hunau.util.WeatherApi;
import net.sf.json.JSONObject;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value="/data")
public class InternetDataController {
	WeatherApi wea=new WeatherApi();
	String windjson; //存储风力及风向数据
	String aqijson; //存储空气质量指数数据
	String weatherjson;
	/*
	 * screen页面(分屏页面)后台处理
	 */
	@RequestMapping(value="/screen")
	public ModelAndView screen(ModelAndView mv) throws JSONException
	{
		windjson=wea.HoursFutureWeather(null); //获取未来24小时的天气数据(此处主要使用风力及风向数据)
	    aqijson=wea.NowWeather(null,null); //从WeatherApi中获取空气质量指数数据
	    weatherjson=windjson;
	    
	    
	    JSONObject jsonObj;
	    jsonObj= JSONObject.fromObject(aqijson);
	    mv.addObject("message1",jsonObj);   //传输到weather.jsp中的json数据
		mv.addObject("message",weatherjson); //传输到weather.jsp中的json数据
		
		mv.addObject("aqi",aqijson);
		
		mv.addObject("wind",windjson);
		
		
	    mv.setViewName("datavis/screen");
		return mv;
	}
	
	/*
	 * screen页面,异步交互处理
	 */
	@ResponseBody
	@RequestMapping(value="/screen_ajax_address",method = RequestMethod.POST)
	public String ajax(HttpServletRequest request, HttpServletResponse response) throws JSONException  //对ajax局部交互
	{
		String area=request.getParameter("area");  //接收前台页面传输过来的数据(地区名)
		
	    //System.out.println(area);
	    
	    WeatherApi address=new WeatherApi();
	    String getdata=address.HoursFutureWeather(area);
	    
		System.out.println("screen_ajax_address test success!");
		return getdata;
	}
	
	/*
	 * screen页面,异步交互处理
	 */
	@ResponseBody
	@RequestMapping(value="/screen_ajax_jwd",method = RequestMethod.POST)
	public String ajax1(HttpServletRequest request, HttpServletResponse response) throws JSONException  //对ajax局部交互
	{
		String jwd=request.getParameter("jwd");  //接收前台页面传输过来的数据(经纬度)
		String[] jwd1=jwd.split(",");
	    System.out.println(jwd1[0]);
	    System.out.println(jwd1[1]);
	    
	    WeatherApi jwdcx=new WeatherApi();
	    String getjwd=jwdcx.NowWeather(jwd1[0],jwd1[1]);
	   
		System.out.println("screen_ajax_jwd success!");
		return getjwd;
	}
	
	
	
	/*
	 * weather页面(天气页面)后台处理
	 */
	@RequestMapping(value="/weather")
	public ModelAndView data(ModelAndView mv) throws JSONException
	{
		/*
		 * 获取气象数据
		 */
        //String weatherjson="{"+"\""+"pm2_5"+"\""+":"+"\""+rpm25+"\""+","+"\""+"temperature"+"\""+":"+"\""+rtemperature+"\""+","+"\""+"wind_direction"+"\""+":"+"\""+rwinddirection+"\""+","+"\""+"wind_power"+"\""+":"+"\""+rwindpower+"\""+","+"\""+"weather_pic"+"\""+":"+"\""+rweatherpic+"\"" +","+"\""+"weather"+"\""+":"+"\""+rweather+"\""+"}";
	   
	    
	    
	    JSONObject jsonObj;
	    jsonObj= JSONObject.fromObject(aqijson);
	    //用"键"获取值
	    String weather_picf2=jsonObj.getString("weather_picf2");
	    String weather_picf3=jsonObj.getString("weather_picf3");
	    String mintempf2=jsonObj.getString("mintempf2");
	    String mintempf3=jsonObj.getString("mintempf3");
	    String maxtempf2=jsonObj.getString("maxtempf2");
	    String maxtempf3=jsonObj.getString("maxtempf3");
	    mv.addObject("message1",jsonObj);
		mv.addObject("message",weatherjson);
    	mv.setViewName("datavis/weather");      
		return mv;
	}
	
	/*
	 * wind页面(风力及风向页面)后台处理
	 */
	@RequestMapping(value="/wind")
	public ModelAndView wind(ModelAndView mv) throws JSONException
	{
		mv.addObject("message",windjson);
	    mv.setViewName("datavis/wind");
		return mv;
	}
	
    /*
     * aqi页面(空气质量指数页面)页面后台处理
     */
	@RequestMapping(value="/aqi")
	public ModelAndView aqi(ModelAndView mv)
	{
		mv.addObject("message",aqijson);
		mv.setViewName("datavis/aqi");
		return mv;
	}
	
	 /*
     * ditu页面(地图页面)页面后台处理
     */
	@RequestMapping(value="/ditu")
	public ModelAndView ditu(ModelAndView mv)
	{
	    mv.setViewName("datavis/ditu");
		return mv;
	}
}
