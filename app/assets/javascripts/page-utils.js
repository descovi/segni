
function height_at_100_per_cent(){
  var img = $('img')
  var offset = img.offset();
  var altezza = $(window).height() - offset.top - 20
  // 400px is a hard coded number that is a good relative measure
  // when window height is too much little to contain entire image
  if ($(window).height() < 400){
    altezza = 400 - offset.top - 20
  }
  if (altezza > 0){
    $('img').css('height', altezza)  
  }
  
  var image = new Image()
  image.src = $('img').attr('src')
  
  if ($('img').height() > image.naturalHeight && image.naturalHeight > 0){
    $('img').height(image.naturalHeight)
  }
}

function fix_image_height(){
  if ( window_width_more_big_than_image()) {
    height_at_100_per_cent()      
  } else {
    $('img').css('height', 'auto')  
    $('img').css('min-width', '')  
  }
}

function window_width_more_big_than_image(){
  var image = new Image()
  image.src = $('img').attr('src')
  return ($(window).width()) > image.naturalWidth+20
}


function height_at_100_per_cent(){
  var img = $('img')
  var offset = img.offset();
  var altezza = $(window).height() - offset.top - 20
  // 400px is a hard coded number that is a good relative measure
  // when window height is too much little to contain entire image
  if ($(window).height() < 400){
    altezza = 400 - offset.top - 20
  }
  if (altezza > 0){
    $('img').css('height', altezza)  
  }
  
  var image = new Image()
  image.src = $('img').attr('src')
  
  if ($('img').height() > image.naturalHeight && image.naturalHeight > 0){
    $('img').height(image.naturalHeight)
  }
}