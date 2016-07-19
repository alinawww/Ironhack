
$(document).ready(function(){

  $('form').on('submit', function(){
    var input = $('input');
    var textarea = $('textarea');
    if (!input.val()){
      console.log('one or more inputs are empty');
      input.addClass('incomplete');
    } else {
      console.log('congrats');
      input.removeClass('incomplete');
    }
    if (!textarea.val()){
      console.log('one or more inputs are empty');
      textarea.addClass('incomplete')

    } else {
      console.log('congrats')
      textarea.removeClass('incomplete')
    }
  })
});
