<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>能力检测</title>
  <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
<!--加载meta IE兼容文件-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>
<body background="images/Dva.jpg">
  <div class="header">
    <div class="menu-btn">
      <div class="menu"></div>
    </div>
    <h1 class="logo">
      <a href="user_main.jsp">
        <img src="images/logo.jpg">
      </a>
    </h1>
    <div class="nav">
      <a href="user_main.jsp">Welcome！</a>
      <a href="plan_choice">选择计划</a>
      <a href="dictionary">词典</a>
      <a href="ability_check" class="active">能力检测</a>
      <a href="fight">对战</a>
      <a href="about.jsp">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="user_main.jsp">Welcome！</a></li>
      <li class="layui-nav-item"><a href="plan_choice">选择计划</a></li>
      <li class="layui-nav-item"><a href="dictionary">词典</a></li>
      <li class="layui-nav-item"><a href="ability_check" class="active">能力检测</a></li>
      <li class="layui-nav-item"><a href="fight">对战</a></li>
      <li class="layui-nav-item"><a href="about.jsp">关于</a></li>
    </ul>
    <div class="layui-layout">
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" lay-unselect="">
                <a href="javascript:;">更多功能</a>
                <dl class="layui-nav-child">
                  <dd><a href="wronglist">生词本</a></dd>
                  <dd><a href="zhanlist">斩词本</a></dd>
                </dl>
            </li>
        </ul>
    </div>
  </div>

<div class="content">
    <div class="cont w1000">

      <div class="title" >
        <h1>能力检测</h1>
      </div>
        <div class="layui-btn-container">
          <button type="button" class="layui-btn layui-btn-lg layui-btn-normal" onclick="judge();">当日检测</button> 
          <button type="button" class="layui-btn layui-btn-lg layui-btn-normal" onclick="goto_wrong_check();">错词检测</button> 
          <button type="button" class="layui-btn layui-btn-lg layui-btn-normal" onclick="goto_all_check();">综合测试</button> 
        </div>
    </div>
  </div>
  <script type="text/javascript">
    function goto_check(kind){
      window.location.href="check?kind="+kind;
    }
  </script>
  <script type="text/javascript">
    function judge(){
      var question_information='<%=(String)session.getAttribute("question")%>';
      if (question_information=="none"){
        layui.use('layer', function(){
        var layer = layui.layer;
  
          layer.open({
            title: '提示'
            ,content: '请你先完成当日的学习之后再来进行当日测试！'
          });     
        }); 
      }
      else{
        window.location.href="check?kind=0";
      }
    }
  </script>
  <script type="text/javascript">
    function goto_wrong_check(){
      var wrong_num='<%=(Integer)session.getAttribute("wrong_num")%>';
      if (wrong_num==0){
        layui.use('layer', function(){
        var layer = layui.layer;
  
          layer.open({
            title: '提示'
            ,content: '当前还没有错题，不需要进行错词检测。'
          });     
        }); 
      }
      else{
        window.location.href="check?kind=1";
      }
    }
  </script>
  <script type="text/javascript">
    function goto_all_check(){
      var plan='<%=(String)session.getAttribute("plan")%>';
      if (plan=="none"){
        layui.use('layer', function(){
        var layer = layui.layer;
  
          layer.open({
            title: '提示'
            ,content: '当前还没有选择计划，请先去选择学习计划！'
          });     
        }); 
      }
      else{
        window.location.href="check?kind=2";
      }
    }
  </script>

  <script type="text/javascript" src="layui/layui.js"></script>
  <script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        var $ = layui.$;
        $("[name=t1]").click(function () {
            var id = $(this).attr("id");
            var content = $(this).attr("content");
            if($("li[lay-id="+id+"]").length==0){
                element.tabAdd("empTab",{
                    title:$(this).attr("title"),
                    content:"<iframe src='"+content+"' class='frame' frameborder='0'></iframe>",
                    id:id
                })
            }
            element.tabChange('empTab',id)
        })
    });
</script>

</body>
</html>