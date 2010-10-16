$(function() {

  function check_filter(value) {
    if (value != "all") {
      $(".entry").not("." + value).hide(); 
    }
  }

 $("#severity_selector, #facility_selector").change(function() {
   $(".entry").show(); 
   $("#severity_selector, #facility_selector").each(function(index) { check_filter($(this).val()); });
  });
});
