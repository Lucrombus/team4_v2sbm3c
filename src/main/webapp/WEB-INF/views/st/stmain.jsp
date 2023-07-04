<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" /> 
<title>알바 지옥몬 0.1</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">  <!-- /static -->

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>          
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(chart);
  
    function chart() { 
      var data = new google.visualization.DataTable();
          data.addColumn('string', 'Element');
          data.addColumn('number', 'Percentage');
          data.addRows([
              ['유', ${exp_y}],
              ['무', ${exp_n}]
            ]);
  
      var options = {
          title : '경력 유무',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'}, 
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };
      
      var chart = new google.visualization.PieChart(document.getElementById('chart_exp'));
      chart.draw(data, options);
}
  </script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(chart);
  
    function chart() { 
      var data = new google.visualization.DataTable();
          data.addColumn('string', 'Element');
          data.addColumn('number', 'Percentage');
          data.addRows([
              ['남', ${gender_m}],
              ['녀', ${gender_w}]
            ]);
  
      var options = {
          title : '성별 비율',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'}, 
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };
      
      var chart = new google.visualization.PieChart(document.getElementById('chart_gender'));
      chart.draw(data, options);
}
  </script>
  
  <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(chart);
  
    function chart() { 
      var data = new google.visualization.DataTable();
          data.addColumn('string', 'Element');
          data.addColumn('number', 'Percentage');
          data.addRows([
              ['10대', ${age_10}],
              ['20대', ${age_20}],
              ['30대', ${age_30}],
              ['50대', ${age_50}],
              ['기타', ${age_etc}]
            ]);
  
      var options = {
          title : '나이대 비율',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'}, 
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };
      
      var chart = new google.visualization.PieChart(document.getElementById('chart_age'));
      chart.draw(data, options);
}
  </script>
 
  <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(chart);
  
    function chart() { 
      var data = new google.visualization.DataTable();
          data.addColumn('string', 'Element');
          data.addColumn('number', 'Percentage');
          data.addRows([
              ['고졸', ${edu_1}],
              ['2년제', ${edu_2}],
              ['3년제', ${edu_3}],
              ['4년제', ${edu_4}]
            ]);
  
      var options = {
          title : '학력 비율',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'}, 
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };
      
      var chart = new google.visualization.PieChart(document.getElementById('chart_edu'));
      chart.draw(data, options);
}
  </script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
  <c:import url="/menu/top.do" />
  <DIV class='title_line'>통계</DIV>
  
  <DIV>
    <ul class="list-group">
    <li class="list-group-item">
    <span style="font-weight:bold;">경력여부 비율</span><br>
    <div id="chart_exp" style="width:900px; height: 500px;"></div>
    </li>
    <li class="list-group-item">
    <span style="font-weight:bold;">성별 비율</span>
    <div id="chart_gender" style="width:900px; height: 500px;"></div>
    </li>
<!--    <li class="list-group-item">
    <span style="font-weight:bold;">나이대 비율</span>
    <div id="chart_age" style="width:900px; height: 500px;"></div>
    </li>
    <li class="list-group-item">
    <span style="font-weight:bold;">학력 비율</span>
    <div id="chart_edu" style="width:900px; height: 500px;"></div>
    </li> 
-->
    </ul>
  </DIV>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>