window.onload = function() {

startCountDown(60, 1000, myFunction);
  $.ajax({
      url: '/busload',
      cache: true,
      success: function(html){
        $("#doit").html(html);
      }
  });
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
// location.reload(true);
timeView(".realbustime", '/busload')
startCountDown(60, 1000, myFunction);
}


function timeView(element, url){

  $(".realbustime").html('<img src="/assets/ajax-loader.gif">');
  
  // $(".buttonstyle").each(function(){
  //   if($(this).hasClass("active")){
  //     $(this).toggleClass("active");
  //   }
  // });

  // $(element).addClass("active");
  // $(".buttonstyle").each(function(){
  //   if($(this).hasClass("active")){
  //     $(this).attr("disabled","disabled");
  //   }
  //   else {
  //     $(this).removeAttr("disabled", "disabled");
  //   }
  // });

  $.ajax({
      url: url,
      cache: true,
      success: function(html){
        $("#doit").html(html);
      }
  });
}

