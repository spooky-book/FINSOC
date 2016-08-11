
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
$(document).ready(function () {
  $('#selectNewsBtn').click(function () {
    $("#selectNewsDropdown").toggleClass("show");
  });
});

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.selectNewsBtn')) {
    var dropdowns = $("#selectNewsDropdown");
    var i;
    if (dropdowns.hasClass('show')) {
      dropdowns.removeClass('show');
    }
  }
}


// Change source of iframe when different newsletter is selected
var changeFrame = (function (file) {
  return function (file) {
    document.getElementById('newsletter').src = file;
  }
})();
