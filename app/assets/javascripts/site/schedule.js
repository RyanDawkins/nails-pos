var resize = function(element) {
  $(".table-square > tbody > tr > td").each(function(event){
    $(this).height($(this).width() / 2);
  });
}



$(document).ready(function(event){
  resize();
});

$(window).resize(function(event) {
  resize();
});
