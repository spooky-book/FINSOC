(function() {
  $(".edit-events-container").ready(function() {
    $("#save-changes-btn").click(function() {

    });

    $(".event-row .event-img > .update-event-img").click(function() {
      $(this).parent().find(".curr-event-img")
    })
  });
})();