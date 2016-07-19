
$(document).ready(function(){
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

  $('.cell').on("click", function(e){
      var clicked = $(e.currentTarget);
      clicked.toggleClass('active');
      // debugger
  })

});
