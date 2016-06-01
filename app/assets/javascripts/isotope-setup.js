function isotope_setup(){
  var $grid = $('.grid').imagesLoaded( function() {
  $('.grid').isotope({
    layoutMode: 'packery',
    packery: {
      gutter: '.gutter-sizer'
    },
    itemSelector: '.grid-item',
    percentPosition: true
  });

  })

}