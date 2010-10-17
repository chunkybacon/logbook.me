$(function() {

  $("tbody > tr:nth-child(odd)").addClass("odd");

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
    var bodies = $(this).find(".payload, .timestamp_body");
    var heads  = $(this).find(".payload_head, .timestamp_head");

    if ($(heads[0]).css("display") == "none") {
      bodies.fadeOut("fast", function() {
        heads.fadeIn("fast");
      });
    } else {
       heads.fadeOut("fast", function() {;
         bodies.fadeIn("fast");
       });
    }

  });
});
