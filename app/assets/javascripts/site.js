$(document).on('ready page:load', function () {

  
  
  //fade notices and alerts
  $('.notice, .alert').fadeOut(5000); 


  //datepicker for adding birthday
  $( "#datepicker" ).datepicker({ changeYear:true, yearRange: "1940:2005", format: 'mm/dd/yyyy',  defaultDate: "01/01/1984"});

  



});