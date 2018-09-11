$(document).ready(function(){
  $('ul.menu_mm li, ul.main_nav li').click(function(e) {
    e.preventDefault();
    $('ul.main_nav li').removeClass('active');
    var aid = $(this).find('a').attr('href');
    $("a[href='" + aid +"']").parent().addClass('active');
    $('html,body').animate({scrollTop: $(aid).offset().top},'slow'); 
  });
});
