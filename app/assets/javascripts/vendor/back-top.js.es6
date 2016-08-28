$(window).scroll(function() {
  if ($(this).scrollTop() >= 50) {
    $('#back-top').fadeIn(300);
  } else {
    $('#back-top').fadeOut(200);
  }
});
$('#back-top').click( () => {
  $('body,html').animate({
    scrollTop : 0
  }, 500);
});
