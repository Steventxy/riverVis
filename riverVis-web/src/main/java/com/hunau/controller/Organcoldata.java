package com.hunau.controller;

import com.hunau.entity.Organapires;
import com.hunau.entity.Pow;
import com.hunau.service.SensorDataManager;
import com.hunau.service.impl.PowService;
import com.infopublic.util.PageData;
import net.sf.json.JSONObject;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//终端采集数据api
@RestController
@RequestMapping(value="/api")

public class Organcoldata extends BaseController {
	@Resource(name = "powService")
	private PowService powService;
	@Resource(name = "SensorDataService")
	private SensorDataManager SensorDataService;

	@RequestMapping(value = "/pow")
	public JSONObject dataview() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Organapires res = new Organapires();

		List<Pow> list = powService.getPowlist(pd);
		Pow pow = powService.getnowPow(pd);
		res.put("IMEI", pd.getString("id"));
		res.put("pow1", pow.getPow1());
		res.put("grouppow", pow.getGrouppow());
		res.put("outv1", pow.getOutv1());
		res.put("outv2", pow.getOutv2());
		res.put("v24", pow.getV24());
		res.put("v28", pow.getV28());
		res.put("extendpow", pow.getExtendpow());
		res.put("solarpow", pow.getSolarpow());
		res.put("time", pow.getTime());
		res.put("data", list);
		return JSONObject.fromObject(res);
	}

	@RequestMapping(value = "/newpow")
	public JSONObject powbyid() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();

		Pow pow = powService.getnowPow(pd);

		return JSONObject.fromObject(pow);
	}

	@RequestMapping(value = "/weather")
	public static void main(String[] args) {
		String host = "http://apifreelat.market.alicloudapi.com";
		String path = "/whapi/json/aliweather/briefforecast3days";
		String method = "POST";
		String appcode = "4b14ee6745e845debf82de7892c5cdbf";
		Map<String, String> headers = new HashMap<String, String>();
		//最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
		headers.put("Authorization", "APPCODE " + appcode);
		//根据API的要求，定义相对应的Content-Type
		headers.put("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		Map<String, String> querys = new HashMap<String, String>();
		Map<String, String> bodys = new HashMap<String, String>();
		bodys.put("lat", "39.91488908");
		bodys.put("lon", "116.40387397");
		bodys.put("token", "443847fa1ffd4e69d929807d42c2db1b");


		try {
			/**
			 * 重要提示如下:
			 * HttpUtils请从
			 * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
			 * 下载
			 *
			 * 相应的依赖请参照
			 * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
			 */
			HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
			System.out.println(response.toString());
			//获取response的body
			//System.out.println(EntityUtils.toString(response.getEntity()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}}

