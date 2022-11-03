<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.net.*, java.io.*, java.text.*, java.util.*" %>
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>

  <head>
  <title>Insert title here</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
/*     var data = google.visualization.arrayToDataTable([
      ['Mon', 20, 28, 38, 45],
      ['Tue', 31, 38, 55, 66],
      ['Wed', 50, 55, 77, 80],
      ['Thu', 77, 77, 66, 50],
      ['Fri', 68, 66, 22, 15]
      // Treat first row as data as well.
    ], true); */
    var date = ${date};
    var low = ${low};
    var open = ${open};
    var close = ${close};
    var high = ${high};
    var volume = ${volume};
    var ct=null;
	for(var i = 0; i <10; i++){
		ct += date[i];
		ct += low[i];
		ct += open[i];
		ct += close[i];
		ct += high[i];
	}
    alert(ct);
    var data = google.visualization.arrayToDataTable([
		ct
      ], true);

    var options = {
      legend:'none'
    };

    var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

    chart.draw(data, options);
  }
    </script> -->
    
    
     <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
/*     var data = google.visualization.arrayToDataTable([
      ['Mon', 20, 28, 38, 45],
      ['Tue', 31, 38, 55, 66],
      ['Wed', 50, 55, 77, 80],
      ['Thu', 77, 77, 66, 50],
      ['Fri', 68, 66, 22, 15]
      // Treat first row as data as well.
    ], true); */
    
    var chart = [];
    var data = google.visualization.arrayToDataTable(
    	chart
      , true);

    var options = {
      legend:'none'
    };

    var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

    chart.draw(data, options);
  }
  
  
    </script>
  </head>
  <body>
<div id="test">
  </div>
  
  
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
  </body>
</html>
