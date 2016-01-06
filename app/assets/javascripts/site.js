$(document).on('ready page:load', function () {

  
  
  //fade notices and alerts
  $('.notice, .alert').fadeOut(5000); 


  //datepicker for adding birthday
  $( "#datepicker" ).datepicker({ changeMonth: true, changeYear:true, yearRange: "1940:2005", dateFormat: 'yy-mm-dd',  defaultDate: '1980-01-01'});

  



});