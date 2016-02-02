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
//= require sortable_new
//= require_tree .

$('document').ready(function(){
  setupClickOfImageForUpload()
  // List with handle
  setupSortable("blocksOrderable", 'admin/simple_blocks/')
  setupSortable("menuOrderable", 'admin/menus/')
  setupOpenCloseTab()
  setupIframe()
})

function setupSortable(id, path){
  var element = document.getElementById(id)
  if (element != null){ doSortable(element, path) }
}

function doSortable(element, path){
  Sortable.create(element, {
      handle: ".glyphicon-move",
      animation: 200,
      onEnd: function(evt){
        var id = $(evt.item).find('form').attr('id')
        if (id == undefined){ id = $(evt.item).attr('id') }
        var splitted = id.split("_")
        
        var id_of_block = splitted[splitted.length-1]
        $.ajax({
          type: "PUT",
          url: '/it/'+path+id_of_block+'/sort',
          data: {
            position: evt.newIndex
          }
        }).done(function(msg){
          refreshIframe()        
        });
      }
    });
}

function setupIframe(){
  $('iframe').css('height', $(window).height()+'px')
  $('#editor-container').css('height', $(window).height()+'px')
  
  //console.log
}

function setupOpenCloseTab(){
  $('.panel-body').hide()
  $('.panel-heading').css('cursor', 'pointer')
  $('.panel-heading').click(function(){
    $(this).next().toggle()
  })
  $('.panel-heading-open').next().toggle()
}

function refreshIframe(){
  var iframe = document.getElementById('iframe-preview');
  iframe.src = iframe.src;
}

function setupClickOfImageForUpload(){
  $('.btn-upload-img').css('cursor', 'pointer')
  $('.btn-upload-img').click(function(e){
    var $input = $(this).next().find('input')
    $input.trigger('click')
  })
}