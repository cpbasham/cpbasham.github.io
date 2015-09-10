$('canvas').on('click', function() {
  $(this).off();
  console.log("HEY");
  $.getScript("extra/processing.min.js");
});