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
    var self = $(this);

    if (!self.hasClass('opened')) {
      self.addClass('opened');

       self.find('.head').fadeOut("fast", function() {
         self.find('.body').fadeIn("fast");
       });
    }
  });

  $('.entry .close').live('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var entry = $(this).parents('.entry');
    entry.removeClass('opened');

    entry.find('.body').fadeOut("fast", function() {
      entry.find('.head').fadeIn("fast");
    });
  });

  $('#entries_filter_time_frame').live('change', function() {
    if ($(this).val() == 'Custom') {
      $('.date_field').show();
    } else {
      $('.date_field').hide();
    }
  });

  var PayloadFilter = function(element) {
    var wrapper = element;
    var template = $('<div>').append(wrapper.find('.payload_filter_fields:first')).remove().html();
    var index = 0;

    var add = function() {
      var html = template.replace(/INDEX/g, index++);
      $(html).insertBefore(wrapper.find('.add'));
      wrapper.find('.delete:gt(0)').show();
    };

    wrapper.click(function(event) {
      if ($(event.target).hasClass('add')) {
        event.preventDefault();
        add();
      }

      if ($(event.target).hasClass('delete') || $(event.target).parent().hasClass('delete')) {
        $(event.target).parents('.payload_filter_fields').remove();
      }
    });

    add();
  }

  if ($('#payload_filter').length > 0) {
    new PayloadFilter($('#payload_filter'));
  }

  $('input.dateinput').dateinput();
});
