<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'main1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/JavaScript" src="<%=path%>/js/echarts.min.js"></script>
<script type="text/JavaScript" src="<%=path%>/js/hunan.js"></script>
<script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
<script language="JavaScript" type="text/JavaScript">
    $(top.hangge());//关闭加载状态
	var VER_AX_LOCALE = "1.1.15.404";//the version of the Activex	版本号
	var szDevIP="VSTA087784MFPTL:81"; //serial ID or ip of ip Camera   IP地址/序列号
	var nPort = 81; //the HTTP port of ip camera, if the szDevIP is serial ID, this whill be ignore
	var szAuthAcc="IPCAM",szAuthPwd="liuyang73";//account of ip camera
	var nImgW=8000,nImgH=8000//the window size of ip camera.
	var szDevName="山洪一号监测点";//the caption shown on the video
	var nDevType=922;
	var bInLan=1;//whether in LAN,1:LAN, 0£ºWAN    判断是否在局域网
	
	function	ShowDev2()
	{
		try{
			remote.ClearDevs();
		}
		catch(exception){
			return;			
		}		
		
//		remote.ShowTitle = 0;
        remote.ShowOSDTime=1;
		remote.Lan = "cn";  //language cn:chinese en:english jp:japanese   语言
		remote.ShowOSDName = 1;//whether to show ipcam caption on the video
		remote.SwitchLayout("1 x 1");
		//remote.Width=nImgW;  //width of the window
		//remote.Height=nImgH; //height of the window
		remote.Width=nImgW;  //width of the window
		remote.Height=nImgH; //height of the window
//AddDev4(IP Camera mode (903:M; 902:F; 901:E; 904:V; 905:A),LAN,serial ID or IP, HTTP port, display name, account,password,channel)   	
		remote.ShowToolBar = 1;//whether to show toolbar
		remote.AddDev4(nDevType,bInLan,szDevIP,nPort,szDevName,szAuthAcc,szAuthPwd,1);
		remote.Listen=1;//whether to play soound
		remote.TurnImg = 0;   //whether reverse video
		remote.ConnectAll();
		remote.Start();
	}
	
var preActTime = 0;
var bNeedStop = false;	
function	StopAction()
{
//	alert("a");
  remote.PTZ(1,1,-1,0,0,0);
  bNeedStop = false;  
}

//set action and send to ipcam
function setAction(action, time){
  if((action == -1)&&(!bNeedStop))
  	return 0;
  	  
	var now_time=new Date();
	//alert(now_time - preActTime);
	if((preActTime > 0)&&(now_time-preActTime<300)){
		//alert(now_time-preActTime);
		if(action == -1){
//			alert(now_time-preActTime);
			setTimeout('StopAction();', 500); 	
			return 0;
		}
		else
			return 0;
	}

  	remote.PTZ(1,1,action,time,0,0);
//Set pause time  
  	bNeedStop = action != -1;
	preActTime = now_time;	    
}	
</script>


<script language="JavaScript" type="text/JavaScript">
	var VER_AX_LOCALE = "1.1.15.404";//the version of the Activex	版本号
	var szDevIP="VSTA0877TL"; //serial ID or ip of ip Camera   IP地址/序列号
	var nPort = 81; //the HTTP port of ip camera, if the szDevIP is serial ID, this whill be ignore
	var szAuthAcc="IPCAM",szAuthPwd="liuyang73";//account of ip camera
	var nImgW=8000,nImgH=8000//the window size of ip camera.
	var szDevName="山洪二号监测点";//the caption shown on the video
	var nDevType=922;
	var bInLan=1;//whether in LAN,1:LAN, 0£ºWAN    判断是否在局域网
	
	function	ShowDev1()
	{
		try{
			remote1.ClearDevs();
		}
		catch(exception){
			return;			
		}		
        remote1.ShowOSDTime=1;
		remote1.Lan = "cn";  //language cn:chinese en:english jp:japanese   语言
		remote1.ShowOSDName = 1;//whether to show ipcam caption on the video
		remote1.SwitchLayout("1 x 1");
		remote1.Width=nImgW;  //width of the window
		remote1.Height=nImgH; //height of the window
		remote1.ShowToolBar = 1;//whether to show toolbar
		remote1.AddDev4(nDevType,bInLan,szDevIP,nPort,szDevName,szAuthAcc,szAuthPwd,1);
		remote1.Listen=1;//whether to play soound
		remote1.TurnImg = 0;   //whether reverse video
		remote1.ConnectAll();
		remote1.Start();
	}
	
var preActTime = 0;
var bNeedStop = false;	
function	StopAction()
{
//	alert("a");
  remote1.PTZ(1,1,-1,0,0,0);
  bNeedStop = false;  
}

//set action and send to ipcam
function setAction(action, time){
  if((action == -1)&&(!bNeedStop))
  	return 0;
  	  
	var now_time=new Date();
	//alert(now_time - preActTime);
	if((preActTime > 0)&&(now_time-preActTime<300)){
		//alert(now_time-preActTime);
		if(action == -1){
//			alert(now_time-preActTime);
			setTimeout('StopAction();', 500); 	
			return 0;
		}
		else
			return 0;
	}

  	remote1.PTZ(1,1,action,time,0,0);
//Set pause time  
  	bNeedStop = action != -1;
	preActTime = now_time;	    
}	
</script>
<script language="JavaScript" type="text/JavaScript">
	var VER_AX_LOCALE = "1.1.15.404";//the version of the Activex	版本号
	var szDevIP="VSTATL"; //serial ID or ip of ip Camera   IP地址/序列号
	var nPort = 81; //the HTTP port of ip camera, if the szDevIP is serial ID, this whill be ignore
	var szAuthAcc="IPCAM",szAuthPwd="liuyang73";//account of ip camera
	var nImgW=8000,nImgH=8000//the window size of ip camera.
	var szDevName="山洪三号监测点";//the caption shown on the video
	var nDevType=922;
	var bInLan=1;//whether in LAN,1:LAN, 0£ºWAN    判断是否在局域网
	
	function	ShowDev3()
	{
		try{
			remote2.ClearDevs();
		}
		catch(exception){
			return;			
		}		
		
//		remote2.ShowTitle = 0;
        remote2.ShowOSDTime=1;
		remote2.Lan = "cn";  //language cn:chinese en:english jp:japanese   语言
		remote2.ShowOSDName = 1;//whether to show ipcam caption on the video
		remote2.SwitchLayout("1 x 1");
		//remote2.Width=nImgW;  //width of the window
		//remote2.Height=nImgH; //height of the window
		remote2.Width=nImgW;  //width of the window
		remote2.Height=nImgH; //height of the window
//AddDev4(IP Camera mode (903:M; 902:F; 901:E; 904:V; 905:A),LAN,serial ID or IP, HTTP port, display name, account,password,channel)   	
		remote2.ShowToolBar = 1;//whether to show toolbar
		remote2.AddDev4(nDevType,bInLan,szDevIP,nPort,szDevName,szAuthAcc,szAuthPwd,1);
		remote2.Listen=1;//whether to play soound
		remote2.TurnImg = 0;   //whether reverse video
		remote2.ConnectAll();
		remote2.Start();
	}
	
var preActTime = 0;
var bNeedStop = false;	
function	StopAction()
{
//	alert("a");
  remote2.PTZ(1,1,-1,0,0,0);
  bNeedStop = false;  
}

//set action and send to ipcam
function setAction(action, time){
  if((action == -1)&&(!bNeedStop))
  	return 0;
  	  
	var now_time=new Date();
	//alert(now_time - preActTime);
	if((preActTime > 0)&&(now_time-preActTime<300)){
		//alert(now_time-preActTime);
		if(action == -1){
//			alert(now_time-preActTime);
			setTimeout('StopAction();', 500); 	
			return 0;
		}
		else
			return 0;
	}

  	remote2.PTZ(1,1,action,time,0,0);
//Set pause time  
  	bNeedStop = action != -1;
	preActTime = now_time;	    
}	
</script>
<script language="JavaScript" type="text/JavaScript">
	var VER_AX_LOCALE = "1.1.15.404";//the version of the Activex	版本号
	var szDevIP="V78TL"; //serial ID or ip of ip Camera   IP地址/序列号
	var nPort = 81; //the HTTP port of ip camera, if the szDevIP is serial ID, this whill be ignore
	var szAuthAcc="IPCAM",szAuthPwd="liuyang73";//account of ip camera
	var nImgW=8000,nImgH=8000//the window size of ip camera.
	var szDevName="山洪四号监测点";//the caption shown on the video
	var nDevType=922;
	var bInLan=1;//whether in LAN,1:LAN, 0£ºWAN    判断是否在局域网
	
	function	ShowDev4()
	{
		try{
			remote3.ClearDevs();
		}
		catch(exception){
			return;			
		}		
		
//		remote3.ShowTitle = 0;
        remote3.ShowOSDTime=1;
		remote3.Lan = "cn";  //language cn:chinese en:english jp:japanese   语言
		remote3.ShowOSDName = 1;//whether to show ipcam caption on the video
		remote3.SwitchLayout("1 x 1");
		//remote3.Width=nImgW;  //width of the window
		//remote3.Height=nImgH; //height of the window
		remote3.Width=nImgW;  //width of the window
		remote3.Height=nImgH; //height of the window
//AddDev4(IP Camera mode (903:M; 902:F; 901:E; 904:V; 905:A),LAN,serial ID or IP, HTTP port, display name, account,password,channel)   	
		remote3.ShowToolBar = 1;//whether to show toolbar
		remote3.AddDev4(nDevType,bInLan,szDevIP,nPort,szDevName,szAuthAcc,szAuthPwd,1);
		remote3.Listen=1;//whether to play soound
		remote3.TurnImg = 0;   //whether reverse video
		remote3.ConnectAll();
		remote3.Start();
	}
	
var preActTime = 0;
var bNeedStop = false;	
function	StopAction()
{
//	alert("a");
  remote3.PTZ(1,1,-1,0,0,0);
  bNeedStop = false;  
}

//set action and send to ipcam
function setAction(action, time){
  if((action == -1)&&(!bNeedStop))
  	return 0;
  	  
	var now_time=new Date();
	//alert(now_time - preActTime);
	if((preActTime > 0)&&(now_time-preActTime<300)){
		//alert(now_time-preActTime);
		if(action == -1){
//			alert(now_time-preActTime);
			setTimeout('StopAction();', 500); 	
			return 0;
		}
		else
			return 0;
	}

  	remote3.PTZ(1,1,action,time,0,0);
//Set pause time  
  	bNeedStop = action != -1;
	preActTime = now_time;	    
}	
</script>
<script language="JavaScript" type="text/JavaScript">
	var VER_AX_LOCALE = "1.1.15.404";//the version of the Activex	版本号
	var szDevIP="V78TL"; //serial ID or ip of ip Camera   IP地址/序列号
	var nPort = 81; //the HTTP port of ip camera, if the szDevIP is serial ID, this whill be ignore
	var szAuthAcc="IPCAM",szAuthPwd="liuyang73";//account of ip camera
	var nImgW=8000,nImgH=8000//the window size of ip camera.
	var szDevName="山洪五号监测点";//the caption shown on the video
	var nDevType=922;
	var bInLan=1;//whether in LAN,1:LAN, 0£ºWAN    判断是否在局域网
	
	function	ShowDev5()
	{
		try{
			remote.ClearDevs();
		}
		catch(exception){
			return;			
		}		
		
//		remote.ShowTitle = 0;
        remote4.ShowOSDTime=1;
		remote4.Lan = "cn";  //language cn:chinese en:english jp:japanese   语言
		remote4.ShowOSDName = 1;//whether to show ipcam caption on the video
		remote4.SwitchLayout("1 x 1");
		//remote.Width=nImgW;  //width of the window
		//remote.Height=nImgH; //height of the window
		remote4.Width=nImgW;  //width of the window
		remote4.Height=nImgH; //height of the window
//AddDev4(IP Camera mode (903:M; 902:F; 901:E; 904:V; 905:A),LAN,serial ID or IP, HTTP port, display name, account,password,channel)   	
		remote4.ShowToolBar = 1;//whether to show toolbar
		remote4.AddDev4(nDevType,bInLan,szDevIP,nPort,szDevName,szAuthAcc,szAuthPwd,1);
		remote4.Listen=1;//whether to play soound
		remote4.TurnImg = 0;   //whether reverse video
		remote4.ConnectAll();
		remote4.Start();
	}
	
var preActTime = 0;
var bNeedStop = false;	
function	StopAction()
{
//	alert("a");
  remote4.PTZ(1,1,-1,0,0,0);
  bNeedStop = false;  
}

//set action and send to ipcam
function setAction(action, time){
  if((action == -1)&&(!bNeedStop))
  	return 0;
  	  
	var now_time=new Date();
	//alert(now_time - preActTime);
	if((preActTime > 0)&&(now_time-preActTime<300)){
		//alert(now_time-preActTime);
		if(action == -1){
//			alert(now_time-preActTime);
			setTimeout('StopAction();', 500); 	
			return 0;
		}
		else
			return 0;
	}

  	remote4.PTZ(1,1,action,time,0,0);
//Set pause time  
  	bNeedStop = action != -1;
	preActTime = now_time;	    
}	
</script>
<script language="JavaScript" type="text/JavaScript">
	var VER_AX_LOCALE = "1.1.15.404";//the version of the Activex	版本号
	var szDevIP="VSTA087784MFPTL"; //serial ID or ip of ip Camera   IP地址/序列号
	var nPort = 81; //the HTTP port of ip camera, if the szDevIP is serial ID, this whill be ignore
	var szAuthAcc="IPCAM",szAuthPwd="liuyang73";//account of ip camera
	var nImgW=8000,nImgH=8000//the window size of ip camera.
	var szDevName="山洪六号监测点";//the caption shown on the video
	var nDevType=922;
	var bInLan=1;//whether in LAN,1:LAN, 0£ºWAN    判断是否在局域网
	
	function	ShowDev6()
	{
		try{
			remote.ClearDevs();
		}
		catch(exception){
			return;			
		}		
		
//		remote.ShowTitle = 0;
        remote5.ShowOSDTime=1;
		remote5.Lan = "cn";  //language cn:chinese en:english jp:japanese   语言
		remote5.ShowOSDName = 1;//whether to show ipcam caption on the video
		remote5.SwitchLayout("1 x 1");
		//remote.Width=nImgW;  //width of the window
		//remote.Height=nImgH; //height of the window
		remote5.Width=nImgW;  //width of the window
		remote5.Height=nImgH; //height of the window
//AddDev4(IP Camera mode (903:M; 902:F; 901:E; 904:V; 905:A),LAN,serial ID or IP, HTTP port, display name, account,password,channel)   	
		remote5.ShowToolBar = 1;//whether to show toolbar
		remote5.AddDev4(nDevType,bInLan,szDevIP,nPort,szDevName,szAuthAcc,szAuthPwd,1);
		remote5.Listen=1;//whether to play soound
		remote5.TurnImg = 0;   //whether reverse video
		remote5.ConnectAll();
		remote5.Start();
	}
	
var preActTime = 0;
var bNeedStop = false;	
function	StopAction()
{
//	alert("a");
  remote5.PTZ(1,1,-1,0,0,0);
  bNeedStop = false;  
}

//set action and send to ipcam
function setAction(action, time){
  if((action == -1)&&(!bNeedStop))
  	return 0;
  	  
	var now_time=new Date();
	//alert(now_time - preActTime);
	if((preActTime > 0)&&(now_time-preActTime<300)){
		//alert(now_time-preActTime);
		if(action == -1){
//			alert(now_time-preActTime);
			setTimeout('StopAction();', 500); 	
			return 0;
		}
		else
			return 0;
	}

  	remote5.PTZ(1,1,action,time,0,0);
//Set pause time  
  	bNeedStop = action != -1;
	preActTime = now_time;	    
}	
</script>
</head>
<body onload="javascript:ShowDev2();ShowDev1();ShowDev3();ShowDev4();ShowDev5();ShowDev6();"> 

<div style="margin:-15px 105px 105px -340px">
<div id="main" style="width:32%; height:50%;float:left"  >
  <table width="100%"  border="0" align="center">
        <tr>
          <td>
            <table width="1000" border="0" Align="left">
              <tr>
                <td  align="center">
                  <OBJECT id="remote" name="remote" classid="clsid:1E125331-B4E3-4EE3-B3C1-24AD1A3E5DEB" WIDTH="320" HEIGHT="311">
                    <FONT COLOR=red SIZE=5> Not installed plugin,Please click<a href='http://cn-download.eyecloud.so/download/application/ipcamax.exe'>here</a>download and install.</FONT>
                  </OBJECT>
                </td>
              </tr>
              </table></td></tr>
              </table>
              </div>
               
              
<div id="main1" style="width:32%; height:50%;float:left"  >
  <table width="100%"  border="0" align="center">
        <tr>
          <td>
            <table width="1000" border="0" Align="left">
              <tr>
                <td  align="center">
                  <OBJECT id="remote1" name="remote1" classid="clsid:1E125331-B4E3-4EE3-B3C1-24AD1A3E5DEB" WIDTH="320" HEIGHT="311">
                    <FONT COLOR=red SIZE=5> Not installed plugin,Please click<a href='http://cn-download.eyecloud.so/download/application/ipcamax.exe'>here</a>download and install.</FONT>
                  </OBJECT>
                </td>
              </tr>
              </table></td></tr>
              </table>
              </div>
               
<div id="main2" style="width:32%; height:50%;float:left"  >
  <table width="100%"  border="0" align="center">
        <tr>
          <td>
            <table width="1000" border="0" Align="center">
              <tr>
                <td  align="center">
                  <OBJECT id="remote2" name="remote2" classid="clsid:1E125331-B4E3-4EE3-B3C1-24AD1A3E5DEB" WIDTH="320" HEIGHT="311">
                    <FONT COLOR=red SIZE=5> Not installed plugin,Please click<a href='http://cn-download.eyecloud.so/download/application/ipcamax.exe'>here</a>download and install.</FONT>
                  </OBJECT>
                </td>
              </tr>
              </table></td></tr>
              </table>
              </div>             
        
</div>
<div style="margin:-15px 105px 105px -340px">
<div id="main3" style="width:32%; height:50%;float:left"  >
  <table width="100%"  border="0" align="center">
        <tr>
          <td>
            <table width="1000" border="0" Align="center">
              <tr>
                <td  align="center">
                  <OBJECT id="remote3" name="remote3" classid="clsid:1E125331-B4E3-4EE3-B3C1-24AD1A3E5DEB" WIDTH="320" HEIGHT="311">
                    <FONT COLOR=red SIZE=5> Not installed plugin,Please click<a href='http://cn-download.eyecloud.so/download/application/ipcamax.exe'>here</a>download and install.</FONT>
                  </OBJECT>
                </td>
              </tr>
              </table></td></tr>
              </table>
              </div>
              
      <div id="main4" style="width:32%; height:50%;float:left"  >
  <table width="100%"  border="0" align="center">
        <tr>
          <td>
            <table width="1000" border="0" Align="right">
              <tr>
                <td  align="center">
                  <OBJECT id="remote4" name="remote4" classid="clsid:1E125331-B4E3-4EE3-B3C1-24AD1A3E5DEB" WIDTH="320" HEIGHT="311">
                    <FONT COLOR=red SIZE=5> Not installed plugin,Please click<a href='http://cn-download.eyecloud.so/download/application/ipcamax.exe'>here</a>download and install.</FONT>
                  </OBJECT>
                </td>
              </tr>
              </table></td></tr>
              </table>
              </div>
              
  <div id="main5" style="width:32%; height:50%;float:left"  >
  <table width="100%"  border="0" align="center">
        <tr>
          <td>
            <table width="1000" border="0" Align="right">
              <tr>
                <td  align="center">
                  <OBJECT id="remote5" name="remote5" classid="clsid:1E125331-B4E3-4EE3-B3C1-24AD1A3E5DEB" WIDTH="320" HEIGHT="311">
                    <FONT COLOR=red SIZE=5> Not installed plugin,Please click<a href='http://cn-download.eyecloud.so/download/application/ipcamax.exe'>here</a>download and install.</FONT>
                  </OBJECT>
                </td>
              </tr>
              </table></td></tr>
              </table>
              </div>
          </div>
          
          </body>
</html>
