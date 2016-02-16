
$('document').ready(function(){
  setupClickOfImageForUpload()
  // List with handle
  setupSortable("blocksOrderable", 'admin/simple_blocks/')
  setupSortable("menuOrderable", 'admin/menus/')
  setupWhenChangeImageRemoveCrop()
  setupIframe()
  setupOpenCloseTab()
  setupCssLive()

})


function setupCssLive(){
  $("textarea[name='website[js]']").on('textchange', textCssJsChanged)
  $("textarea[name='website[css]']").on('textchange', textCssJsChanged)
  $("select[name='website[template_id]']").change(textCssJsChanged)
  $("textarea[id*='simple_block_content']").on('textchange', textCssJsChanged)
  $("input[name*='page'").on('textchange', textCssJsChanged)
  $("input[name='simple_block[container_fluid]'").change(textCssJsChanged)
  $("input[name='simple_block[sliding]'").change(textCssJsChanged)
  $("input[name='simple_block[padding]']").change(textCssJsChanged)
  $("input[name='simple_block[num_elements]']").change(textCssJsChanged)
}

var timer
function textCssJsChanged(event){
  console.log("changed!")
  var _form = this.form
  var _this = this
  clearTimeout(timer);
  var ms = 600; // milliseconds
  timer = setTimeout(function(event){
    $(_form).submit()
  }, ms);
}

function setupWhenChangeImageRemoveCrop(){
  $('#opera_image').change(function(){
    $('#col-cropbox').empty();
  })
}

function setupSortable(id, path){
  var element = document.getElementById(id)
  if (element !== null){ doSortable(element, path) }
}

function doSortable(element, path){
  Sortable.create(element, {
      handle: ".glyphicon-move",
      animation: 200,
      onEnd: function(evt){
        var id = $(evt.item).find('form').attr('id')
        if (id === undefined){ id = $(evt.item).attr('id') }
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
}


function setupOpenCloseTab(){
  $('.panel-body').hide()
  $('.panel-heading').css('cursor', 'pointer')
  $('.panel-heading').click(function(){
    $(this).next().slideToggle()
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