// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require isotope-setup.js

// MENU MOBILE
$(document).on('click', '#button-menu', function(e){
  $('#menu').toggleClass('hidden-xs')
})

function calculateHeight(_data){
  var win = $(window).height()
  var head = $('#header-container').height()
  var result = win-head-_data
  return result
}

function there_is_a_slider_with_fullscreen_option(){
  return ($('.carousel').data('sliding-full-screen') === true)  
}

// FULL SCREEN
$(document).ready(function(){

if (there_is_a_slider_with_fullscreen_option()) { setupFullscreenSlider() }

function setupFullscreenSlider(){
  var $item = $('.carousel .item');
  var mb = $('.carousel').data("fullscreen-margin-bottom")

  $item.height(calculateHeight(mb));
  $item.addClass('full-screen');

  $('.carousel img').each(function(e) {
    $(this).addClass('full-screen')
    var $src = $(this).attr('src');

    $(this).parent().css({
      'background-image' : 'url(' + $src + ')',
    });
    $(this).remove();
  });

  $(window).on('resize', function (e){
    var mb = $('.carousel ').data("fullscreen-margin-bottom")
    $item.height(calculateHeight(mb));
  });

}

})