
$('document').ready(function(){
  setupClickOfImageForUpload()
  // List with handle
  setupSortable("blocksOrderable", 'admin/simple_blocks/')
  setupSortable("menuOrderable", 'admin/menus/')
  setupWhenChangeImageRemoveCrop()
  setupIframe()
  setupOpenCloseTab()
  setupLiveEditing()
  setupClickTabHeadToOpenPanel()
})

function setupClickTabHeadToOpenPanel(){
  // list with editing button
  if ($('.glyphicon-pencil').parents('.dashboard-panel').length){
    $('.glyphicon-pencil').parents('.item').css('cursor','pointer')
    $('.glyphicon-pencil').parents('.item').click(function(e){

      var a = $(this).find('.glyphicon-pencil').parent()
      console.log(a.attr('href'))
      location.href = a.attr('href')

    })

  }
}

function setupLiveEditing(){
  $("textarea[name='website[js]']").on('textchange', textCssJsChanged)
  $("textarea[name='website[head]']").on('textchange', textCssJsChanged)
  $("textarea[name='website[css]']").on('textchange', textCssJsChanged)
  $("textarea[name='simple_block[content_it]']").on('textchange', textCssJsChanged)
  $("textarea[name='simple_block[content_en]']").on('textchange', textCssJsChanged)
  $("textarea[id='simple_block_content']").on('textchange', textCssJsChanged)
  
  $("select[name='website[template_id]']").change(textCssJsChanged)
  
  $("input[name='simple_block[title_en]']").on('textchange', textCssJsChanged)
  $("input[name='simple_block[title_it]']").on('textchange', textCssJsChanged)
  $("input[name='page[title]']").on('textchange', textCssJsChanged)
  $("input[name='simple_block[container_fluid]']").change(textCssJsChanged)
  $("input[name='simple_block[sliding]']").change(textCssJsChanged)
  $("input[name='simple_block[padding]']").change(textCssJsChanged)
  $("input[name='simple_block[full_height]']").change(textCssJsChanged)
  $("input[name='simple_block[num_elements]']").change(textCssJsChanged)
  $("input[name='simple_block[num_elements_xs]']").change(textCssJsChanged)
  $("input[name='simple_block[colors_inverted]']").change(textCssJsChanged)
  $("input[name='website[button_open_menu]']").change(textCssJsChanged)
  $("input[name='website[logo]']").change(textCssJsChanged)
  $("input[name='simple_block[background_image]']").change(textCssJsChanged)
  $("input[name='simple_block[quality]']").on('textchange',textCssJsChanged)
  $('.slider').on('change','input',textCssJsChanged)

  // when change tab 
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    var new_tab = e.target.getAttribute("href")
    console.log(new_tab)
    if (new_tab==="#en"){
      changeIframeLanguage("it", "en")
    } else {
      changeIframeLanguage("en", "it")
    }
  })
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
      handle: ".panel-heading",
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
    $(this).next().toggle()
      $('textarea').autosize();
  })
  $('.panel-heading-open').next().toggle()
  var panel_id_open = getURLParameter('opened')
  $("#"+panel_id_open+" .panel-heading").trigger('click')
}


function currentIframeLanguage(){
  var cur_url = currentUrlIframe()
  if (cur_url.indexOf("/it/") > 0 ){
    return "it"
  } else {
    return "en"
  }
}

function changeIframeLanguage(startLanguage, endLanguage) {
  var url = currentUrlIframe()
  var urlChanged = url.replace(startLanguage, endLanguage)
  refreshIframe(urlChanged)
}

function currentUrlIframe(){
  return currentIframe().contentWindow.location.href
}

function currentIframe(){
  return document.getElementById('iframe-preview');
}

function refreshIframe(percorso){
  if (percorso !== null){
    currentIframe().src = percorso;
  } else {
    console.log("reload semplice")
    currentIframe().src = currentUrlIframe();
  }
}

function getURLParameter(name) {
  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
}

function setupClickOfImageForUpload(){
  $('.btn-upload-img').css('cursor', 'pointer')
  $('.btn-upload-img').click(function(e){
    var $input = $(this).next().find('input')
    $input.trigger('click')
  })
}