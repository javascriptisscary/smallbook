$(document).on('page:change', function () {
  
  // add a class to make height and width of photo div exact same size as dynamic image from paperclip
  

  var image_width = $('.profile-image').width();
  var image_height = $('.profile-image').height();
  
  
  $('#photo').addClass('modify').width(image_width).height(image_height);
  
  

  
  
  //fade notices and alerts
  $('.notice, .alert').fadeOut(5000); 

  
  
   
         //datepicker for adding birthday
  $( "#datepicker" ).datepicker({ changeMonth: true, changeYear:true, yearRange: "1940:2005", dateFormat: 'yy-mm-dd',  defaultDate: '1980-01-01'});
    
 






});


