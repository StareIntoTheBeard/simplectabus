window.onload = function() {

startCountDown(60, 1000, myFunction);
}

function startCountDown(i, p, f) {

var pause = p;
var fn = f;

var countDownObj = document.getElementById("countDown");
if (countDownObj == null) {
return;
}
countDownObj.count = function(i) {

countDownObj.innerHTML = i;
if (i == 0) {

fn();

return;
}
setTimeout(function() {

countDownObj.count(i - 1);
},
pause
);
}

countDownObj.count(i);
}

function myFunction() {
location.reload(true);
}