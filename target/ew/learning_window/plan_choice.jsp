<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>选择计划</title>
  <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<script src="js/jquery-3.5.1.min.js"></script>
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
      <a href="plan_choice" class="active">选择计划</a>
      <a href="dictionary">词典</a>
      <a href="ability_check">能力检测</a>
      <a href="fight.jsp">对战</a>
      <a href="about.jsp">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="user_main.jsp">Welcome！</a></li>
      <li class="layui-nav-item"><a href="plan_choice" class="active">选择计划</a></li>
      <li class="layui-nav-item"><a href="dictionary">词典</a></li>
      <li class="layui-nav-item"><a href="ability_check">能力检测</a></li>
      <li class="layui-nav-item"><a href="fight.jsp">对战</a></li>
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
    <form class="layui-form">
      <div class="title" id="comeon" style="font-size:20px;color: #F7F709">

      </div>
      <div class="title" >
        <h1>词汇列表</h1>
      </div>
    <ul >
      <li >
        <div class="layui-input-inline">
          <select id="plan_down">
            <option value="0">请选择词汇列表</option>
            <option value="cet_4">大学英语四级</option>
            <option value="cet_6">大学英语六级</option>
            <option value="npee">考研英语</option>
            <option value="gre">雅思</option>
            <option value="toefl">托福</option>
          </select>
        </div>
      </li> 
      <li><br><br></li>
      <li >
        <div class="layui-input-inline">
          <select id="num_per_day_down">
            <option value="0">请选择每天学习单词数量</option>
            <option value="20">20</option>
            <option value="40">40</option>
            <option value="60">60</option>
            <option value="80">80</option>
            <option value="100">100</option>
          </select>
        </div>
      </li> 
      <li><br><br></li>
      <li >
        <div class="layui-form-item">
          <div class="layui-btn-container">
            <button type="button" class="layui-btn layui-btn-lg layui-btn-normal" onclick="save()">保存设置</button> 
            <button type="button" class="layui-btn layui-btn-lg layui-btn-normal" onclick="start()">开始学习！</button> 
          </div>
        </div>
      </li> 
    </ul>
    </form>
    </div>
  </div>

  <script type="text/javascript" src="layui/layui.js"></script>
  <script type="text/javascript" src="js/word.js"></script>
    <script type="text/javascript">
    var plan = '<%=(String)session.getAttribute("plan")%>';
    var num_per_day ='<%=(Integer)session.getAttribute("num_per_day")%>';

    var select_plan = document.getElementById("plan_down");
    var value_plan = select_plan.value;
    var options_plan = select_plan.options; 

    var select_num_per_day = document.getElementById("num_per_day_down");
    var value_num_per_day = select_num_per_day.value;
    var options_num_per_day = select_num_per_day.options; 

    for(i=0;i<select_plan.length;i++){
      if(select_plan[i].value==plan)
        select_plan[i].selected = true;
    }

    for(i=0;i<select_num_per_day.length;i++){
      if(select_num_per_day[i].value==num_per_day)
        select_num_per_day[i].selected = true;
    }
  </script>
  <script type="text/javascript">


	function comeon(day_num,word_num){
		var list="";
		var list="你已经连续学习本计划"+day_num+"天，继续坚持！\n你已经连续学习本计划"+word_num+"个单词，继续坚持！";
		
		console.log(list);
		document.getElementById("comeon").innerText = list;
	}

	function save(){
	    var select_plan = document.getElementById("plan_down");
		var value_plan = select_plan.value;
		var options_plan = select_plan.options; 

	    var select_num_per_day = document.getElementById("num_per_day_down");
		var value_num_per_day = select_num_per_day.value;
		var options_num_per_day = select_num_per_day.options; 
		
		var params={};
        var kind_index="";
		if(plan!=value_plan){
			kind_index="t";
			params.sign="t";
		}else{
			kind_index="f";
			params.sign="f";
		}
		params.plan=value_plan;
		params.num_per_day=parseInt(value_num_per_day);
		$.ajax({
			async:false,
			type: "POST",
			url: "plan_settings",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==true){
					if(kind_index=="t"){
						comeon(0,0);
						plan = value_plan;
					}
					num_per_day = value_num_per_day;
					alert("设置已保存，请去学习");
				}
			},
			error:function(data){
			}
		});	
	}

	function start(){
		if(plan=="none"){
			alert("您暂未选择计划");
		}
		else window.location.href="learning_word";
	}
  </script>

  <script>
    var day_num = '<%=(Integer)session.getAttribute("day_num")%>';
	var word_num = '<%=(Integer)session.getAttribute("word_num")%>';
    comeon(day_num,word_num);
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
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
});
</script>
</body>
</html>