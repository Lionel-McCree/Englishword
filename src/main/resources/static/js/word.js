/**
 * 
 * @authors Your Name (you@example.org)
 * @date    2020-05-23 22:07:29
 * @version $Id$
 */

function show(){
	var nearInfo=[{"sentence":"A balloon is mysteriously \"sucked\" into a flask.","meaning":"n.瓶,长颈瓶,细颈瓶,烧瓶,小水瓶","pronounce":"[flæsk]","transformation":"none","word":"flask","sentence_meaning":"一个气球神秘地被吸进了一个细颈瓶。 "},{"sentence":"The Earth is only one of the numerous planets in the universe.","meaning":"adj.众多的,许多的,无数的","pronounce":"['nuːmərəs]","transformation":"副词: numerously 名词: numerousness","word":"numerous","sentence_meaning":"地球只是宇宙中众多星球中的一个。 "},{"sentence":"The accusation brought a speedy denial.","meaning":"n.否认,否定,谢绝,拒绝","pronounce":"[dɪ'naɪəl]","transformation":"none","word":"denial","sentence_meaning":"指责马上遭到否认。 "},{"sentence":"She's got very extravagant tastes.","meaning":"adj.奢侈的,浪费的,过分的,放纵的","pronounce":"[ɪk'strævəɡənt]","transformation":"副词: extravagantly 名词: extravagantness","word":"extravagant","sentence_meaning":"她有很奢侈的嗜好。 "},{"sentence":"The lane is the boundary of our land from theirs.","meaning":"n.（乡间）小路,巷,里弄,狭窄的通道,航线","pronounce":"[leɪn]","transformation":"none","word":"lane","sentence_meaning":"那条小路就是我们这片地与他们那片地的分界线。 "},{"sentence":"This is a digest of the week's news.","meaning":"n.分类,摘要;vi.消化;vt.消化,融会贯通","pronounce":"['dɑɪdʒɛst]","transformation":"过去式: digested 过去分词: digested 现在分词: digesting 第三人称单数: digests","word":"digest","sentence_meaning":"这是一周新闻摘要。 "},{"sentence":"Their office is in central Beijing, so their overhead is very high.","meaning":"adj.在头上的,高架的;n.企业一般管理费用,天花板adv.在头顶上,在空中,在高处","pronounce":"[ˌoʊvər'hed]","transformation":"none","word":"overhead","sentence_meaning":"他们的办事处设在北京市中心，所以他们的日常开支很大。 "},{"sentence":"The sponge soaked in the water on the desk.","meaning":"n.海绵,(外科用的)棉球,纱布;v.用海绵冼涤,揩拭,清除,用海绵吸收(液体),(俗)依赖某人生活,诈取某人,海绵般吸收","pronounce":"[spʌndʒ]","transformation":"过去式: sponged 过去分词: sponged 现在分词: sponging 第三人称单数: sponges","word":"sponge","sentence_meaning":"海绵将书桌上的水吸了进去。 "},{"sentence":"Hopes are fading for the survival of the missing climbers.","meaning":"n.生存,幸存,残存,幸存者,残存物","pronounce":"[sər'vaɪvl]","transformation":"none","word":"survival","sentence_meaning":"失踪的登山者幸存的希望越来越渺茫。 "},{"sentence":"He is a persistent pursuer of truth.","meaning":"adj.持久稳固的","pronounce":"[pər'sɪstənt]","transformation":"副词: persistently","word":"persistent","sentence_meaning":"他是个坚持不懈追求真理的人。 "}];

	var obj = eval(nearInfo);

	var list="";

	for (var i=0;i<10;i++){
		list +="<li><div class=\"word_main_list_w\">"+obj[i].word+"   <button type=\"button\" class=\"layui-btn layui-btn-xs\">斩</button>"+"</div>"+"<div class=\"word_main_list_y\">"+obj[i].pronounce+"<a title=\"发音\" href=\"javascript:void(0)\" id=\"\" onMouseOver=\"asplay_top(this.id);\" class=\"icon_s\"></a>"+"</div>"+"<div class=\"word_main_list_s\">"+obj[i].meaning+"</div></li>"+" <div id=\"page\">"+"</div>";
	}
	console.log(list);
	document.getElementById("word_list_1").innerHTML = list;
}

function comeon(){
	var day_num = '<%=(Integer)session.getAttribute("day_num")%>';
	var word_num = '<%=(Integer)session.getAttribute("word_num")%>';

	var list="";
	var list="你已经连续学习本计划"+day_num+"天，继续坚持！\n你已经连续学习本计划"+word_num+"个单词，继续坚持！";
	
	console.log(list);
	document.getElementById("comeon").innerText = list;
}

function save(){
	var plan = '<%=(String)session.getAttribute("plan")%>';

    var select_plan = document.getElementById("plan_down");
	var value_plan = select_plan.value;
	var options_plan = select_plan.options; 

    var select_num_per_day = document.getElementById("num_per_day_down");
	var value_num_per_day = select_num_per_day.value;
	var options_num_per_day = select_num_per_day.options; 
	
	var params={};

	if(plan!=select_plan){
		params.sign="t";
	}else{
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
			}
		},
		error:function(data){
		}
	});	
	alert("设置已保存，请去学习");
}

function start(){
	window.location.href="";
}


