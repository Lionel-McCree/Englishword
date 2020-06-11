<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>关于</title>
  <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
<!--加载meta IE兼容文件-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>
<body background="images/Dva.jpg">
<body >
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
      <a href="ability_check">能力检测</a>
      <a href="fight">对战</a>
      <a href="about.jsp" class="active">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="user_main.jsp">Welcome！</a></li>
      <li class="layui-nav-item"><a href="plan_choice">选择计划</a></li>
      <li class="layui-nav-item"><a href="dictionary">词典</a></li>
      <li class="layui-nav-item"><a href="ability_check">能力检测</a></li>
      <li class="layui-nav-item"><a href="fight">对战</a></li>
      <li class="layui-nav-item"><a href="about.jsp" class="active">关于</a></li>
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
        <h1>开发者的话</h1>
      </div>
        <div style="color: #EEB422">
          <h3>&emsp;&emsp;本英语单词学习系统致力于帮助用户提高英语词汇量，系统主要含有四六级，考研，雅思和托福五个单词库。其他类型的单词库暂时没有加入系统中。
          </h3>
          <h3>&emsp;&emsp;该系统主要功能如下：</h3>
          <h3>&emsp;&emsp;一、常规的词典，快速查词功能。</h3>
          <h3>&emsp;&emsp;二、选择学习计划（设置词汇列表以及每天所学的单词数量）。</h3>
          <h3>&emsp;&emsp;三、能力检测，根据每日所学的单词进行当天检测，错词本的单词进行错题检测，以及所学词汇列表的综合测试。</h3>
          <h3>&emsp;&emsp;四、对于正在学习的单词，可以选择斩或加，斩就是将该单词从所学词汇列表中移除，旨在对于非常熟悉的单词让他不要再次出现（该</h3>
          <h3>&emsp;&emsp;单词会自动加入斩词本以防误删可以恢复），加就是将该单词加入生词本，以便后续的复习，同时，能力检测做错的题也会自动加入生</h3>
          <h3>&emsp;&emsp;词本。生词本的词在错词检测中经过一定次数的正确后便默认已掌握，自动将其从生词本中移除。</h3>
          <h3>&emsp;&emsp;五、对战。用户可以选择与选择相同词汇列表进行学习的别的用户进行PK，通过答题的形式来增加天梯分数，冲上排行榜。</h3>
        </div>
    </div>
  </div>

  <div class="footer-wrap">
    <div class="footer w1000">
      <div class="qrcode">
        <img src="images/erweima.png">
      </div>
      <div class="practice-mode">
        <img src="images/down_img.jpg">
        <div class="text" style="color: #FFFFFF">
          <h4 class="title">我们的联系方式</h4>
          <p>微信<span class="WeChat">1234567890</span></p>
          <p>手机<span class="iphone">1234567890</span></p>
          <p>邮箱<span class="email">1234567890@qq.com</span></p>
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