
$(document).ready(function() {
  $('.navbar-dropdown').mouseenter(function(e) {
    $('.dropdown-menu', this).css('display', 'block');
  });
  $('.navbar-dropdown').mouseleave(function(e) {
    $('.dropdown-menu', this).css('display', 'none');
  });
});
