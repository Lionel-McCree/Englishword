/**
 * 
 * @authors Your Name (you@example.org)
 * @date    2020-05-15 10:16:36
 * @version $Id$
 */
 /*设置动态效果*/
 document.querySelector('.img__btn').addEventListener('click', function() {
     document.querySelector('.content').classList.toggle('s--signup')
 })

 /*实现功能*/
 function judge_up(){

 	var signUpName = document.getElementById('signUpName');
 	var signUpEmail = document.getElementById('signUpEmail')
 	var signUpPassword = document.getElementById('signUpPassword');

 	if (signUpName.value.length > 20 || signUpName.value.length < 2) {
 		window.alert("用户名请输入2-20位字符")
 		return false;
 	}
 	if (signUpPassword.value.length > 20 || signUpPassword.value.length < 6) {
 		window.alert("密码请输入6-20位字符")
 		return false;
 	}
 	return true;
 }

function judge_in(){

 	var signInName = document.getElementById('signInName');
 	var signInEmail = document.getElementById('signInEmail')
 	var signInPassword = document.getElementById('signInPassword');

 	if (signInName.value.length > 20 || signInName.value.length < 2) {
 		window.alert("用户名请输入2-20位字符")
 		return false;
 	}
 	if (signINPassword.value.length > 20 || signInPassword.value.length < 6) {
 		window.alert("密码请输入6-20位字符")
 		return false;
 	}
 	return true;
 }
