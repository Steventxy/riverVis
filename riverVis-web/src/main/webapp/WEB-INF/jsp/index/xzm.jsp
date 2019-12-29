<%--suppress ALL --%>
<head>
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="plugins/tab/css/carousel.css">
    <script type="text/javascript" src="plugins/tab/js/jquery.js"></script>
    <script type="text/javascript" src="plugins/tab/js/carousel.js"></script>
   </head>
  
 <body style='center;width: 1137px;height:300px;'>

<div class="J_Poster poster-main" data-setting='{
                                                  "width":1000,
                                                  "height":270,
                                                    "posterWidth":640,
                                                      "posterHeight":270,
                                                     "scale":0.8,
                                                      "autoPlay":true,
                                                         "delay":2000,
                                                          "speed":300
												  }'>
	<div class="poster-btn poster-prev-btn"></div>
    <ul class="poster-list">
    	<li class="poster-item"><a href="chart5/waterstatistics"><img src="static/ace/avatars/rain.jpg" width="120%" height="120%"></a></li>
        <li class="poster-item"><a href="chart5/rainstatistics"><img src="static/ace/avatars/temp.jpg" width="120%" height="120%"></a></li>
        <li class="poster-item"><a href="SanweiData/sanwei5"><img src="static/ace/avatars/rainline.jpg" width="120%" height="120%"></a></li>
        <li class="poster-item"><a href="SanweiData/sanwei4"><img src="static/ace/avatars/templine.jpg" width="120%" height="120%"></a></li>
        <li class="poster-item"><a href="sensordata/screen3"><img src="static/ace/avatars/temp.jpg" width="120%" height="120%"></a></li>
        <li class="poster-item"><a href="earth/earth1"><img src="static/ace/avatars/rainline.jpg" width="120%" height="120%"></a></li>
        <li class="poster-item"><a href="data/ditu"><img src="static/ace/avatars/templine.jpg" width="120%" height="120%"></a></li>
    </ul>
    <div class="poster-btn poster-next-btn"></div>
</div>
<script>
$(function(){
	Carousel.init($(".J_Poster"));

});

// document.getElementById('1').onclick=function(){
//     window.location.assign('http://localhost:8080/rivervis_web_war_exploded/');
// }
// language="Javascript"
// location.href="http://www.baidu.com/"

</script>
</body>