var resize = function() {
  /* unused=false */
  $(".table-square > tbody > tr > td").each(function(event){
    $(this).height($(this).width() / 2);
  });
}


/* unused=false */
$(document).ready(function(event){
  resize();
});

/* unused=false */
$(window).resize(function(event) {
  resize();
});
