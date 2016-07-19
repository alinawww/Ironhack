
$(document).ready(function() {
  function createGrid(){
    var numRows = 10;
    var numCols = 10;
    for (var i = 1; i <= numRows; i++) {
      for (var j = 1; j <= numCols; j++) {
        var cell = $('<div>');
        cell.addClass('cell')
        cell.attr("col", j)
        cell.attr("row", i)
        $('.container').append(cell);
      }
    }
  };

  // function createSnake(){
  //
  // }

  createGrid()
});



            // setInterval(function() {
            //     var cells = $('.cell');
            //     cells.each(function(index, element) {
            //         var head = $('.cell:first');
            //         head.removeClass('blue');
            //         head.addClass('red');
            //     }, 300);
            // });

// $(document).on('keypress', function(e){
//   console.log('you prssed a key');
//   console.log(e.keyCode);
//   cell.toggleClass('red')
// });

// setInterval(function(){
//   var cells = $('.cell');
//   cells.each(function(index, element){
//     var even = $(cells[index*2])
//     even.toggleClass('red');
//     $(element).toggleClass('blue');
//   })
// }, 1000);
