<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>单词学习</title>
  <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" type="text/css" href="css/word.css"> 
  <!--link href="http://cdn.iciba.com/web/word2.0/style-sec.css?v=1157" rel="stylesheet" type="text/css" /-->
</head>
<body>
<script type="text/javascript" src="js/inner_window.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<script type="text/javascript">
  function join_in_book(words){
  var params={};

  params.word=words.id;
  $.ajax({
    async:false,
    type: "POST",
    url: "insert",
    data:params,
    dataType:"json",
    success:function(data){
      if(data==true)
        alert("添加成功");
    },
    error:function(data){
    }
  }); 
}
</script>
<script type="text/javascript">
  function delete_zhan(words){
  var params={};

  params.word=words.id;
  $.ajax({
    async:false,
    type: "POST",
    url: "delete",
    data:params,
    dataType:"json",
    success:function(data){
    },
    error:function(data){
    }
  }); 
  var Row = words.parentNode;
    while (Row.tagName.toLowerCase() != "li") {
      Row = Row.parentNode;
    }
  Row.parentNode.removeChild(Row); 
}
</script>

<script type="text/javascript">
  function finish(){
    $.ajax({
    async:false,
    type: "POST",
    url: "finish_study",
    dataType:"json",
    success:function(data){
    },
    error:function(data){
    }
  }); 
    layui.use('layer', function(){
    var layer = layui.layer;
    layer.open({
      content: '恭喜你已经完成了本次计划的学习！'
      ,btn: ['立即测试', '返回']
      ,yes: function(index, layero){
        window.location.href="check?kind=0";
      }
      ,btn2: function(index, layero){
        window.location.href="plan_choice";
      }
    });
  });     
  }           
</script>
<script type="text/javascript">
  function play(word){
    word.play();
}
</script>
<div id="main_block">
<div class="word_box">

  <div class="word_tip"> 
    <div class="word_h2"> 
      <p>your plan
      </p>
    </div>
  </div>
  <form action="?action=card" method="post" id="word_form">
    <input type="hidden" name="class_id" value="11">
    <input type="hidden" name="course_id" value="1">
    <input type="hidden" name="nologin" value="0">
    <div class="word_main">
      <div class="word_main_thead">
        <div class="word_main_list_w">
         单词
        </div>
        <div class="word_main_list_y">
         音标
        </div>
        <div class="word_main_list_s">
         <span class="word_main_list_tip">已学会的点击“斩”移除</span>
         释义
        </div>
      </div>

      <ul class="word_main_list" id="word_list_1">

      </ul>
    
    </div>
    <div class="word_footer">
      <div class="word_footer_scb" id="paging">
      </div>
      <div id="fayin"></div>
      <div class="fr" id="finishstudy">
      </div>
      <div class="fr">
        <a href="plan_choice" class="word_button_blue\">返回</a>
      </div>
    </div>
  </form>
</div>
</div>

<script src="js/word.js"></script>
<script src="layui/layui.js"></script>


<script>
  var num_per_day = '<%=(Integer)session.getAttribute("num_per_day")%>';
  var page_action=1;
  layui.use('laypage', function(){
    var laypage = layui.laypage;
  
  //执行一个laypage实例
    laypage.render({
        elem: 'paging' //注意，这里的 page 是 ID，不用加 # 号
        ,count: num_per_day 
        ,jump: function(obj, first){
    //obj包含了当前分页的所有参数，比如：
    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
        page_action=obj.curr;
        word_list();
    //首次不执行
        if(!first){
      //do something
        }
        if(page_action==num_per_day/10){
            list2="<a href=\"#\" class=\"word_button_blue\" onclick=\"finish()\">完成学习</a>";
            document.getElementById("finishstudy").innerHTML = list2;
        }
      }
    });
  });
</script>

<script type="text/javascript">
function word_list(){
  var params={};
  
  params.page_action=page_action;
  $.ajax({
    async:false,
    type: "POST",
    url: "word_list",
    data:params,
    dataType:"json",
    success:function(data){
      document.getElementById("word_list_1").innerHTML ="";
      var obj_data = eval(data);
      var list="";
      var list1="";
      var n='n';

      for (var i=0;i<obj_data.length;i++){
        let temp=n+obj_data[i].word;
        list +="<li><div class=\"word_main_list_w\">"+"<button type=\"button\" id="+obj_data[i].word+" class=\"layui-btn layui-btn-xs\" onclick=\"delete_zhan(this);\">斩</button>"+"<button type=\"button\" class=\"layui-btn layui-btn-xs\" id="+obj_data[i].word+" onclick=\"join_in_book(this);\">加</button>"+"<a href=\"#\" id=\"join_in\" onclick=\"alertModal('http://apii.dict.cn/mini.php?q="+obj_data[i].word+"')\";>"+obj_data[i].word+"</a>"+"</div>"+"<div class=\"word_main_list_y\">"+obj_data[i].pronounce+"<a title=\"发音\" href=\"javascript:void(0)\" onclick=\"play("+temp+");\" class=\"icon_s\"></a>"+"</div>"+"<div class=\"word_main_list_s\">"+"<marquee  onmouseover=\"stop()\" onmouseout=\"start()\">"+obj_data[i].meaning+"</marquee></div></li>";
      }
      console.log(list);
      document.getElementById("word_list_1").innerHTML = list;

      for (var i=0;i<obj_data.length;i++){
       list1+="<audio id=\""+n+obj_data[i].word+"\" src='http://dict.youdao.com/dictvoice?audio="+obj_data[i].word+"'></audio>";
      }
      console.log(list1);
      document.getElementById("fayin").innerHTML = list1;
    },
    error:function(data){
    }
  }); 
}
  
</script>
<script type="text/javascript">
word_list();
</script>

</body>
</html>
