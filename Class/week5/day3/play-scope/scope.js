$(document).ready(function(){
  for (let i = 0; i < 10; i++) {
    var button = $('<button>').text('click me '+ i)
    $('.container').append(button);
    button.on("click", function(){
      console.log('you clicked on ' + i)
    })
  }
});
