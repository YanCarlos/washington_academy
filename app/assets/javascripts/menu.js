$(document).ready(function(){
  $('ul.menu_mm li, ul.main_nav li').click(function(e) {
    e.preventDefault();
    $('ul.main_nav li').removeClass('active');
    var aid = $(this).find('a').attr('href');
    $("a[href='" + aid +"']").parent().addClass('active');
    $('html,body').animate({scrollTop: $(aid).offset().top},'slow'); 
  });
  $('form')
    .bootstrapValidator({
    }).on('success.form.bv', function(e) {
      // Called when the form is valid
      var $form = $(e.target);
      if ($form.data('remote') && $.rails !== undefined) {
          e.preventDefault();
      }
    });
});
