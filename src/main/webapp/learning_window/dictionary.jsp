<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>词典</title>
  <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  
</head>
<body background="images/Dva.jpg">
<script type="text/javascript" src="js/inner_window.js"></script>
  <script type="text/javascript">
  function search(){
	  var word = document.getElementById("word").value;
	  alertModal('http://apii.dict.cn/mini.php?q='+word);
  }
  </script>
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
      <a href="dictionary" class="active">词典</a>
      <a href="ability_check">能力检测</a>
      <a href="fight.html">对战</a>
      <a href="about.jsp">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="user_main.jsp">Welcome！</a></li>
      <li class="layui-nav-item"><a href="plan_choice">选择计划</a></li>
      <li class="layui-nav-item"><a href="dictionary" class="active">词典</a></li>
      <li class="layui-nav-item"><a href="ability_check">能力检测</a></li>
      <li class="layui-nav-item"><a href="fight.html">对战</a></li>
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
        <h1>快速查词</h1>
    <br>
      </div>

      <div class="banner_search">
        <div class="banner_input__Pgsay">
          <input type="search" id="word" placeholder="请输入您要翻译的单词">
          <div onclick="search()"></div>
        </div>
      </div>

    </div>
  </div>
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