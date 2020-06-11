var stompClient = null;
var userID = null;

function startTime(){                     //计时函数
    var today=new Date();
    var h=today.getHours();
    var m=today.getMinutes();
    var s=today.getSeconds();// 在小于10的数字前加一个‘0’
    m=checkTime(m);
    s=checkTime(s);
    document.getElementById('txt').innerHTML=h+":"+m+":"+s;
    t=setTimeout(function(){startTime()},500);
}
function checkTime(i){
    if (i<10){
        i="0" + i;
    }
    return i;
}


function connect() {
    userID = sessionStorage.getItem("userID");
    var socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);

    stompClient.connect({}, onConnected, onError);
    event.preventDefault();
}


function onConnected() {
    stompClient.send("/game.add_user", {}, JSON.stringify({sender:userID,type:'SEARCH'}));
    stompClient.subscribe("/user/topic/game",onMessageReceived)

}



function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}

//点对点通信前缀添加“\app"
function onMessageReceived(payload){
    var message = JSON.parse(payload.body);
    //收到服务器确认搜素匹配玩家
    var chatmsg = message.chatMessage;
    var type = chatmsg.type;
    var code = Number(message.code);
    if (code === 200){
        if(type === 'SEARCH'){
            //收到信息，提交匹配请求
            var chatMessage ={
                type: 'SEARCH',
                sender: userID,
                content: 'apply to Match'
            };
            stompClient.send("/app/game.search",{},JSON.stringify(chatMessage));
        }else if(type === 'MATCHING')                   //等待匹配比赛
        {
            while (true){
                var chatMessage1 ={
                    type: 'MATCHING',
                    sender: userID,
                    content: 'query Match results'
                };
                stompClient.send("/app/game.Matching",{},JSON.stringify(chatMessage1));
            }
        }else if (type === 'MATCH'){
            var chatMessage2 ={
                type: 'INGAME',
                sender: userID,
                content: 'Start Exam'
            };
            stompClient.send("/app/game.InGame",{},JSON.stringify(chatMessage2));
        }else if(type === 'DO_EXAM'){
            //TODO 初始化答题界面
            document.title = "开始答题";
            document.write('<div class="demo"> <div id="quiz-container"></div> </div>')
            $('#quiz-container').jquizzy({
                questions: init.questions
            });
        }else if(type ==='FINISH_PAIR'){
            //TODO 结算界面
        }else if (type === 'FINISH_NOPAIR'){
            //TODO 给出提示，对方尚未完成，返回主界面
        }else{
            console.log("server send an unrecognized message");
        }
    }else if(code === 201){
        //TODO 提示无法在同一时间登录两个账号
    }

}