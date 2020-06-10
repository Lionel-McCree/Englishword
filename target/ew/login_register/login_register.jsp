<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<title>English_word</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="content" id="content">
        <form action="login" method="post" onsubmit="return judge_in()">
        <div class="form sign-in">
            <h2>欢迎回来</h2>
            <label>
                <span>用户名</span>
                <input id="signInName" type="text" name="username"/>
            </label>
            <label>
                <span>密码</span>
                <input id="signInPassword" type="password" name="password"/>
            </label>
            <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
            <button onclick="judge_in()" class='submit' id="accountSignIn">登 录</button>
        </form>
        </div>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>还未注册？</h2>
                    <p>立即注册，让英语成为你的优势</p>
                </div>
                <div class="img__text m--in">
                    <h2>已有帐号？</h2>
                    <p>goodgoodstudy,daydayup</p>
                </div>
                <div class="img__btn">
                    <span class="m--up">注 册</span>
                    <span class="m--in">登 录</span>
                </div>
            </div>
            <form action="register" method="post" onsubmit="return judge_up()">
            <div class="form sign-up">
                <h2>立即注册</h2>
                <label>
                    <span>用户名</span>
                    <input id="signUpName" type="text" name="username" placeholder="用户名长度在2-20之间"/>
                </label>
                <label>
                    <span>邮箱</span>
                    <input id="signUpEmail" type="email" name="email" />
                </label>
                <label>
                    <span>密码</span>
                    <input id="signUpPassword" type="password" name="password" placeholder="密码长度在6-20之间"/>
                </label>
                <button onclick="judge_up()"  class="submit" id="accountSignUp">注 册</button>
            </form>
            </div>
        </div>
    </div>

    <script src="js/script.js"></script>
	
	<div style="text-align:center;">

</div>
</body>

</html>