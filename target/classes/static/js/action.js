$(document).ready(function () {
    $("button").onclick(function () {
         var val = (document.getElementById("in").value);
         sessionStorage.setItem("userID", val);
         window.location.href = "main1.html";
    });
});
