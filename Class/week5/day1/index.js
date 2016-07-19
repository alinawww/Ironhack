$(document).on('ready', function(){
  console.log('hello world');
  var cell = $('.cell');

  setTimeout(function(){
    var cell = $('.cell');
    cell.toggleClass('blue red');
    // cell.toggleClass('red');
  }, 1000)
  
})

console.log('bye');
