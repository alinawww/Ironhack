
$(document).ready(function(){
  var max = 100;
  for (var i = 0; i < max; i++) {
    var cell = $('<div>');
    cell.addClass('cell blue')
    $('.container').append(cell);
  }

  $('.cell').on('click', function(e){
    console.log('you clicked a button!');
    console.log(e.currentTarget);
  });

  $(document).on('keypress', function(e){
    console.log('you prssed a key');
    console.log(e.keyCode);
    cell.toggleClass('red')
  });
});

// setInterval(function(){
//   var cells = $('.cell');
//   cells.each(function(index, element){
//     var random = Math.random();
//     if (random > 0.5) {
//       $(element).toggleClass('red blue');
//     }
//   })
// }, 1000);

// setInterval(function(){
//   var cells = $('.cell');
//   cells.each(function(index, element){
//     var even = $(cells[index*2])
//     even.toggleClass('red');
//     $(element).toggleClass('blue');
//   })
// }, 1000);
