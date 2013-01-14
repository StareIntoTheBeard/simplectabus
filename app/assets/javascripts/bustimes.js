window.onload = function() {

  startCountDown(60, 1000, myFunction);
  timeView(".realbustime", "#doit", '/busload');
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
  timeView(".realbustime", "#doit", '/busload');
  startCountDown(60, 1000, myFunction);
}


function timeView(element, element2, url){

  $(element).html('<img src="/assets/ajax-loader.gif">');

  $.ajax({
      url: url,
      cache: true,
      success: function(html){
        $(element2).html(html);
      },
      error: function(html){
        $(element2).html("Error retrieving times.")
      }
  });
}

