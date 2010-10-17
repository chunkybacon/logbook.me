$(function() {
  /*Automagically set focus on first input on page*/
  $("div.content input:visible:first").focus(); 

  $('#filters form').submit(function(event) {
    event.preventDefault();
    var form = $(this);
    $.get(form.attr('action'), form.serialize(), function(response) {
      $('#entries').html(response);
    });
  });

  $('.pagination a').live('click', function(event) {
    event.preventDefault();
    $.get($(this).attr('href'), function(response) {
      $('#entries').html(response);
    });
  });

  $('.entry').live('click', function(event) {
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

  $('#entries_filter_time_frame').live('change', function() {
    if ($(this).val() == 'Custom') {
      $('.date_field').show();
    } else {
      $('.date_field').hide();
    }
  });

  $('input.dateinput').dateinput();
});
