$(function() {

  $("tr:nth-child(odd)").addClass("odd");

  function check_filter(value) {
    if (value != "all") {
      $(".entry").not("." + value).hide();
    }
  }

  $("#severity_selector, #facility_selector").change(function() {
    $(".entry").show();
    $("#severity_selector, #facility_selector").each(function(index) { check_filter($(this).val()); });
    $("tr.entry").removeClass("odd");
    $("tr.entry:visible").filter(":odd").addClass("odd");
  });

  $('.entry').click(function(event) {
    var payload      = $(this).find(".payload");
    var payload_head = $(this).find(".payload_head");

    if(payload.html().length > 20) {
      payload_head.toggle();
      payload.slideToggle();
    }
  });
});
