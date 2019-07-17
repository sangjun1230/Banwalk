$(".btn").click(function(){
  $("#modal").css("display","block");
  $("#modal").fadeIn();
});

$(".close").click(function(){
  $("#modal").fadeOut();
});