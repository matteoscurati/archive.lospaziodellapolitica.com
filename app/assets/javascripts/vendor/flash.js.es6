setTimeout(() => {
  $('#flash').fadeOut(500);
}, 3000);
$('#flash').click((e) => {
  e.preventDefault();
  $('#flash').fadeOut(500);
});
