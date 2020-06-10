<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>test</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://www.huangwx.cn/css/sweetalert.css">
<script type="text/javascript" src="https://www.huangwx.cn/js/sweetalert-dev.js"></script>

</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/live2d-widget@3.0.4/lib/L2Dwidget.min.js"></script>
<p id="day">0</p>
<button type="button" onclick="myFunction()">点击这里</button>
<button type="button" onclick="test()">Click Me!</button>
<button type="button" onclick="test2()">Click Me!</button>
<button type="button" onclick="test3()">测试</button>
<button type="button" onclick="test4()">check</button>
<button type="button" onclick="alertModal('http://apii.dict.cn/mini.php?q=word')">Click Me!</button>
<script type="text/javascript">
L2Dwidget.init();
var id = '<%=(int)session.getAttribute("id")%>';
var testnum = "1000";
//alert(parseInt(testnum));

function test4(){
	var x = '<%=request.getParameter("kind")%>';
	var y = parseInt(x);
	alert(y);
}

function test3(){
	  var params={};
	  
	  params.kind=1;
	  $.ajax({
	    async:false,
	    type: "POST",
	    url: "exam",
	    data:params,
	    dataType:"json",
	    success:function(data){
	      console.log(data);
	    },
	    error:function(data){
	    }
	  });
}


function test(){
	$.ajax({
		async:false,
		type: "POST",
		url: "test_fun",
		dataType:"json",
		success:function(data){
				alert(data);
		},
		error:function(data){
			alert(data);
		}
	});	
}
function myFunction()
{
document.getElementById("day").innerText='<%=(int)session.getAttribute("day_num")%>';
alert('<%=(int)session.getAttribute("day_num")%>');
}
function test2(){
    swal({ 
		title: "HTML <small>标题</small>!",
		text: "自定义<span style='color:#0000FF'>这是fsdfsdfdsfsdfdsfsdfsdfsdfsdffffffffffffffffffffffsdfsdfsdfsdfsdfsdfsdfsdfsdf蓝色的<span>。", 
		html: true 
	});

}
</script>
<script>
    function alertModal(httpUrl){
        // 添加模态框用到的css
        const cssEle = document.createElement('style');
        cssEle.id = 'cameraCSSId';
        const cssContent = '.modal_header_1dNxf {\n' +
        '            display: flex;\n' +
        '            -webkit-box-orient: horizontal;\n' +
        '            flex-direction: row;\n' +
        '            flex-wrap: nowrap;\n' +
        '            -webkit-box-pack: start;\n' +
        '            justify-content: flex-start;\n' +
        '            height: 3.125rem;\n' +
        '            box-sizing: border-box;\n' +
        '            width: 100%;\n' +
        '        }\n' +
        '        .connection-modal_header_12IsA {\n' +
        '            background-color: hsla(0,100%,60%,0.5);\n' +
        '        }\n' +
        '        .modal_header-item-help_2F4to {\n' +
        '            margin-right: -4.75rem;\n' +
        '            z-index: 1;\n' +
        '        }\n' +
        '        .button_outlined-button_2f510 {\n' +
        '            cursor: pointer;\n' +
        '            border-radius: .25rem;\n' +
        '            display: flex;\n' +
        '            -webkit-box-orient: horizontal;\n' +
        '            -webkit-box-direction: normal;\n' +
        '            flex-direction: row;\n' +
        '            -webkit-box-align: center;\n' +
        '            align-items: center;\n' +
        '            padding-left: .75rem;\n' +
        '            user-select: none;\n' +
        '        }\n' +
        '        .modal_help-button_1F4rs {\n' +
        '            font-weight: normal;\n' +
        '            font-size: 0.75rem;\n' +
        '        }\n' +
        '        .button_icon_JhCuM {\n' +
        '            margin-right: .5rem;\n' +
        '            height: 1.5rem;\n' +
        '        }\n' +
        '        .button_content_3y79K {\n' +
        '            white-space: nowrap;\n' +
        '        }\n' +
        '        .modal_header-image_2c-LK {\n' +
        '            margin-right: 0.5rem;\n' +
        '        }\n' +
        '        .modal_header-item_1WbOm {\n' +
        '            display: flex;\n' +
        '            -webkit-box-align: center;\n' +
        '            align-items: center;\n' +
        '            padding: 1rem;\n' +
        '            text-decoration: none;\n' +
        '            color: hsla(0, 100%, 100%, 1);\n' +
        '        }\n' +
        '        .modal_header-item-close_4akWi {\n' +
        '            flex-basis: 20rem;\n' +
        '            -webkit-box-pack: end;\n' +
        '            justify-content: flex-end;\n' +
        '            z-index: 1;\n' +
        '        }\n' +
        '        .close-button_close-button_t5jqt {\n' +
        '            display: flex;\n' +
        '            -webkit-box-align: center;\n' +
        '            align-items: center;\n' +
        '            -webkit-box-pack: center;\n' +
        '            justify-content: center;\n' +
        '            overflow: hidden;\n' +
        '            background-color: hsla(0, 0%, 0%, 0.15);\n' +
        '            border-radius: 50%;\n' +
        '            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;\n' +
        '            cursor: pointer;\n' +
        '            transition: all 0.15s ease-out;\n' +
        '        }\n' +
        '        .close-button_large_2cCrv:hover {\n' +
        '            -webkit-transform: scale(1.1, 1.1);\n' +
        '            -ms-transform: scale(1.1, 1.1);\n' +
        '            transform: scale(1.1, 1.1);\n' +
        '            -webkit-box-shadow: 0 0 0 4px hsla(0, 0%, 0%, 0.15);\n' +
        '            box-shadow: 0 0 0 4px hsla(0, 0%, 0%, 0.15);\n' +
        '        }\n' +
        '        .close-button_close-icon_ywCI5 {\n' +
        '            position: relative;\n' +
        '            margin: 0.25rem;\n' +
        '            user-select: none;\n' +
        '            transform-origin: 50%;\n' +
        '            transform: rotate(45deg);\n' +
        '        }\n' +
        '        .close-button_small_1L9aM .close-button_close-icon_ywCI5 {\n' +
        '            width: 50%;\n' +
        '        }\n' +
        '        .close-button_large_2cCrv .close-button_close-icon_ywCI5 {\n' +
        '              width: 0.75rem;\n' +
        '              height: 0.75rem;\n' +
        '          }\n' +
        '        .modal_center {\n' +
        '            background: hsla(0, 100%, 100%, 1);\n' +
        '            height:100%;\n' +
        '        }\n' +
        '        .connection-modal_activityArea_PqYoO {\n' +
        '            height: 359;\n' +
        '            background-color: hsla(215, 100%, 65%, 0.1);\n' +
        '            display: flex;\n' +
        '            -webkit-box-pack: center;\n' +
        '            justify-content: center;\n' +
        '            -webkit-box-align: center;\n' +
        '            align-items: center;\n' +
        '        }\n' +
        '        .modal_center_content {\n' +
        '            width: 100%;\n' +
        '            height: 100%;\n' +
        '            display: flex;\n' +
        '            -webkit-box-orient: vertical;\n' +
        '            -webkit-box-direction: normal;\n' +
        '            flex-direction: column;\n' +
        '            justify-content: space-around;\n' +
        '        }\n' +
        '        .modal_header-item-title_1N2BE {\n' +
        '            -webkit-box-flex: 1;\n' +
        '            flex-grow: 1;\n' +
        '            flex-shrink: 0;\n' +
        '            -webkit-box-pack: center;\n' +
        '            justify-content: center;\n' +
        '            user-select: none;\n' +
        '            letter-spacing: 0.4px;\n' +
        '            cursor: default;\n' +
        '            margin: 0 -20rem 0 0;\n' +
        '        }';
        cssEle.innerHTML = cssContent;
        document.querySelector("head").appendChild(cssEle);
 
        // 添加模态框用到的DIV
        const modalDiv = document.createElement('div');
        modalDiv.id = 'cameraDivId';
        modalDiv.style = 'position: fixed;top: 0;left: 0;background: rgba(0,0,0,0.3);width: 100%;height: 100%;';
        const modalBox = '<div id="videoId" style="padding-top: 50px;box-sizing: border-box; height:80%;overflow: auto;width: 840px;z-index: 999;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);">\n' +
            '        <!--模态框头部-->\n' +
            '        <div class="modal_header_1dNxf connection-modal_header_12IsA" style="position: absolute;top: 0;left: 0;">\n' +
            '            <div class="modal_header-item_1WbOm modal_header-item-help_2F4to">\n' +
            '                <span class="button_outlined-button_2f510 modal_help-button_1F4rs" role="button">\n' +
            '                    <div class="button_content_3y79K">\n' +
            '                    </div>\n' +
            '                </span>\n' +
            '            </div>\n' +
            '            <div class="modal_header-item_1WbOm modal_header-item-title_1N2BE">\n' +
            '快速查词'+
            '            </div>\n' +
            '            <div class="modal_header-item_1WbOm modal_header-item-close_4akWi">\n' +
            '                <div id="cameraCloseId" class="close-button_close-button_t5jqt close-button_large_2cCrv">\n' +
            '                    <img class="close-button_close-icon_ywCI5" src="data:image/svg+xml;base64,PHN2ZyBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA3LjQ4IDcuNDgiPjxkZWZzPjxzdHlsZT4uY2xzLTF7ZmlsbDpub25lO3N0cm9rZTojZmZmO3N0cm9rZS1saW5lY2FwOnJvdW5kO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2Utd2lkdGg6MnB4O308L3N0eWxlPjwvZGVmcz48dGl0bGU+aWNvbi0tYWRkPC90aXRsZT48bGluZSBjbGFzcz0iY2xzLTEiIHgxPSIzLjc0IiB5MT0iNi40OCIgeDI9IjMuNzQiIHkyPSIxIi8+PGxpbmUgY2xhc3M9ImNscy0xIiB4MT0iMSIgeTE9IjMuNzQiIHgyPSI2LjQ4IiB5Mj0iMy43NCIvPjwvc3ZnPg==">\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '        <!--模态框中间部分-->\n' +
            '        <div class="modal_center">\n' +
            '            <!--内容部分-->\n' +
            '            <div class="modal_center_content">\n' +
            '                <iframe src='+httpUrl+' frameborder="0"height="100%" width="100%" scrolling="no"/>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </div>';
        modalDiv.innerHTML = modalBox;
        document.querySelector('body').appendChild(modalDiv);
 
        // 添加模态框关闭事件
        document.getElementById('cameraCloseId').addEventListener('click',function () {
            const cameraEle = document.getElementById('cameraDivId');
            cameraEle.style.visibility = 'hidden';
            cameraEle.style.display = 'none';
            document.querySelector('body').removeChild(cameraEle);
            document.querySelector('head').removeChild(document.getElementById('cameraCSSId'));
        });
    }
</script>
</body>
</html>