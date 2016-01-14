$(document).on('ready page:load', function () {

  
  
  //fade notices and alerts
  $('.notice, .alert').fadeOut(5000); 


  //datepicker for adding birthday
  $( "#datepicker" ).datepicker({ changeMonth: true, changeYear:true, yearRange: "1940:2005", dateFormat: 'yy-mm-dd',  defaultDate: '1980-01-01'});

  
// add a class tomake height and width of photo div exact same size as dynamic image from paperclip
var image_width = $('.profile-image').width();
var image_height = $('.profile-image').height();

$('#photo').addClass('modwidth').width(image_width);
 $('#photo').addClass('modheight').height(image_height);



});