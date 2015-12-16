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
//= require sortable
//= require_tree .

$('document').ready(function(){
  setupClickOfImageForUpload()
  // List with handle
  setupSortable()
})

function setupSortable(){
  var list = document.getElementById('simpleList')
  Sortable.create(list, {
    handle: '.glyphicon-move',
    animation: 150,
    onUpdate: function(evt){
      
      var splitted = $(evt.item).find('form').attr('id').split("_")
      
      var id_of_block = splitted[splitted.length-1]
      
      $.ajax({
        type: "PUT",
        url: '/it/admin/simple_blocks/'+id_of_block+'/sort',
        data: {
          position: evt.newIndex
        }
      })
    }
  });
}

function setupClickOfImageForUpload(){
  $('.btn-upload-img').css('cursor', 'pointer')
  $('.btn-upload-img').click(function(e){
    var $input = $(this).next().find('input')
    $input.trigger('click')
  })
}