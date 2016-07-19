
$(document).ready(function(){

function(createGrid){

}

var PokemonController = function(container, url){
  this.container = container;
  this.url = url;
  this.pokemon = pokemon;
  this.setListeners();
}

PokemonController.prototype.setListeners = function () {
   this.currentCell.on('click', this.showPokemon.bind(this));
 }

var max = 100;
for (var i = 0; i < max; i++) {
  var cell = $('<div>');
  cell.addClass('cell blue')
  $('.container').append(cell);
}

PokemonController.prototype.fetchPokemon = function () {
  $.ajax({
    type: 'GET',
    url: this.url,
    success: this.showPokemon.bind(this),
    error: function (err) {
      console.log('in da error');
    }
  })
}

PokemonController.prototype.showPokemon = function () {
  var that = this;
  var characterImg = this.sprites.front_default
  var img = $('<img>').attr("src", characterImg)
  activeCell.append(img)
}

var id = Math.floor(Math.random()*100+1)
var container = $('.container');
var url = 'http://pokeapi.co/api/v2/pokemon-form/'+ id +'/';
var controller = new PokemonController(container, url);
controller.fetchPokemon();
  //
  // $('.cell').on('click', function(e){
  //   console.log(e.currentTarget);
  //   var activeCell = $(e.currentTarget)
  //   if (!activeCell.hasClass('active')){
  //     activeCell.toggleClass('active')
  //     var id = Math.floor(Math.random()*100+1)
  //     $.ajax({
  //       type: 'GET',
  //       url: 'http://pokeapi.co/api/v2/pokemon-form/'+id+'/',
  //       success: function(response){
  //         console.log(response)
  //         var characterImg = response.sprites.front_default
  //         var img = $('<img>').attr("src", characterImg)
  //         activeCell.append(img)
  //       },
  //       error: function(){
  //         console.log('in da error')
  //       }
  //     })
  //   } else{
  //     activeCell.toggleClass('active').empty()
  //   }
  // });


});
