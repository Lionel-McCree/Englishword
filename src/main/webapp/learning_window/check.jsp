<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>能力检测</title>

<link rel="stylesheet" type="text/css" href="css/dati.css" />

<style type="text/css">
.demo{width:760px; margin:60px auto 10px auto}
</style>

<script src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/quiz.js"></script>

<script type="text/javascript">
  function go_check(){
    var x = '<%=request.getParameter("kind")%>';
    var y = parseInt(x);

    var params={};
  
  params.kind=y;
  $.ajax({
    async:false,
    type: "POST",
    url: "exam",
    data:params,
    dataType:"json",
    success:function(data){
      $(function(){
    $('#quiz-container').jquizzy({
          questions: data.questions
      });
    });
    },
    error:function(data){
    }
  }); 
  }
  
/*var init={"questions":[{"question":"pla____le adj.似是而非的","kind":1,"answers":["esxb","osrb","udix","usib"],"correctAnswer":4,"word":"plausible"},{"question":"听发音选择正确的词汇","kind":2,"answers":["n.精神病医师,精神病学家","n.虚构,编造,小说","v.否认,拒绝","vt.劝诱,促使,导致,引起,感应"],"correctAnswer":3,"word":"deny"},{"question":"co____ion n.混乱,混淆","kind":1,"answers":["naui","nfus","nrts","rfua"],"correctAnswer":2,"word":"confusion"},{"question":"instrument ['ɪnstrəmənt]","kind":0,"answers":["n.接待,招待会,接收","n.工具,手段,器械,器具,手段","vt.推进,驱使","n.生态学,[社会]环境适应学,均衡系统"],"correctAnswer":2,"word":"instrument"},{"question":"preferable ['prefrəbl]","kind":0,"answers":["adj.有意识的,有知觉的,故意的,羞怯的","adj.正确的,精确的","adj.更可取的,更好的,更优越的","n.肠;adj.内部,同情心"],"correctAnswer":3,"word":"preferable"},{"question":"b__l n.[动]公牛,粗壮如牛的人","kind":1,"answers":["up","al","ul","ux"],"correctAnswer":3,"word":"bull"},{"question":"ammunition [ˌæmju'nɪʃn]","kind":0,"answers":["adj.可用到的,可利用的,有用的,有空的,接受探访的","vt.应受,值得;v.应受","n.军火,弹药","adj.顽固的,固执的,坚定的,坚决的,难应付的,难处理的"],"correctAnswer":3,"word":"ammunition"},{"question":"h__k n.鹰,掠夺他人的人,鹰派成员;vi.放鹰,像鹰一般地袭击,清嗓,咳嗽;vt.捕捉,咳出,兜售,(沿街)叫卖,散播","kind":1,"answers":["au","aw","rw","yw"],"correctAnswer":2,"word":"hawk"},{"question":"chorus ['kɔːrəs]","kind":0,"answers":["n.反应,反作用,反动(力)","n.合唱,合唱队,齐声","n.[生化]蛋白质;adj.蛋白质的","adj.愤世嫉俗的"],"correctAnswer":2,"word":"chorus"},{"question":"reflect [rɪ'flekt]","kind":0,"answers":["vt.强调,着重;v.强调","adj.分别的,各自的","n.掠夺,强奸,葡萄渣,油菜;vt.掠夺,强奸","v.反射,反映,表现,反省,细想"],"correctAnswer":4,"word":"reflect"},{"question":"听发音选择正确的词汇","kind":2,"answers":["adj.古怪;n.行为古怪的人","n.升级,上升,上坡;adv.往上;vt.使升级,提升,改良品种","n.(身体的)姿势,体态,状态,情况,心境,态度;v.令取某种姿势,摆姿势,作出姿态","n.接触,联系;vt.接触,联系"],"correctAnswer":1,"word":"eccentric"},{"question":"en__w v.捐赠,赋予","kind":1,"answers":["dj","do","no","no"],"correctAnswer":2,"word":"endow"},{"question":"expl___ v.探险,探测,探究","kind":1,"answers":["ory","ork","ors","ore"],"correctAnswer":4,"word":"explore"},{"question":"d___iss vt.解散,下课,开除,解职,使(或让)离开;vi.解散","kind":1,"answers":["imm","ism","isj","gsm"],"correctAnswer":2,"word":"dismiss"},{"question":"听发音选择正确的词汇","kind":2,"answers":["n.雕刻,雕刻品,雕塑,雕塑品,[地理]刻蚀;v.雕刻,雕塑,刻蚀","n.油脂,贿赂;vt.涂脂于,<俗>贿赂","n.文职官员,地方官员","n.保证,誓言,抵押,抵押品;vt.保证,使发誓,抵押,典当,举杯祝...健康"],"correctAnswer":2,"word":"grease"},{"question":"worthy ['wɜːrði]","kind":0,"answers":["vt.申请,应用;vi.申请,适用","n.外科医生","n.杰出人物,知名人士;adj.有价值的,应...的,可敬的,值得的,相称的","adj.有关节的,发音清晰的;vt.用关节连接,接合,清晰明白地说"],"correctAnswer":3,"word":"worthy"},{"question":"correlate ['kɔːrəleɪt]","kind":0,"answers":["vt.使相互关联;vi.和...相关","adj.权威的,有权威的,命令的","adv.预先","n.排列,安排"],"correctAnswer":1,"word":"correlate"},{"question":"cr___t n.信任,信用,声望,荣誉,[财务]贷方,银行存款;vt.相信,信任,把...归给","kind":1,"answers":["edi","edc","ydi","ddi"],"correctAnswer":1,"word":"credit"},{"question":"b___en n.担子,负担;v.负担","kind":1,"answers":["urd","ued","uad","urd"],"correctAnswer":4,"word":"burden"},{"question":"ass__ n.资产,有用的东西","kind":1,"answers":["et","yt","rt","zt"],"correctAnswer":1,"word":"asset"}]}

$(function(){
	$('#quiz-container').jquizzy({
        questions: init.questions
    });
});*/
</script>
<script type="text/javascript">
  go_check();
</script>
</head>

<body background="images/Dva.jpg">

<div class="demo">
	<div id='quiz-container'></div>

</div>
  <div id="fayin" style="display:none;"></div>

</body>
</html>
