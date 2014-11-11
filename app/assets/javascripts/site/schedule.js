var resize = function() {
  /*jshint unused:false */
  $(".table-square > tbody > tr > td").each(function(event){
    $(this).height($(this).width() / 2);
  });
};


/*jshint unused:false */
$(document).ready(function(event){
  resize();
});

/*jshint unused:false */
$(window).resize(function(event) {
  resize();
});
