$(document).on('ready page:load', function () {

  console.log("yes i'm running biatch");
  
  //fade notices and alerts
  $('.notice, .alert').fadeOut(5000); 


  //datepicker for adding birthday
  $( "#datepicker" ).datepicker({ format: 'mm/dd/yyyy'})

  



});