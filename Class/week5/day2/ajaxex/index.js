
$(document).ready(function(){

  $('#addCharacter').on("submit", function(e) {
    e.preventDefault()
    var newCharacter = {
      name: $("[name = name]").val(),
      occupation: $("[name = occupation]").val(),
      debt: $("[name = debt]").val(),
      weapon: $("[name = weapon]").val(),
    };
    $.ajax({
      type: 'POST',
      url: 'https://ironhack-characters.herokuapp.com/characters',
      data: newCharacter,
      success: function () {
        console.log('SAVED');
      },
      error: function (err) {
        console.log('not saved yet');
      },
      dataType: "json"
    });
  });


  $.ajax({
    type: 'GET',
    url: 'https://ironhack-characters.herokuapp.com/characters',
    success: function (response) {
      // console.log('in da success');
      console.log(response);
      response.forEach(function(character, index){
        var name = character.name;
        var occupation = character.occupation;
        var debt = character.debt;
        var weapon = character.weapon;
        var id = character.id;
        $('.characters').append('<li>' + name +' '+ occupation+' ' + debt+ ' '+ weapon + '</li>');
      })

    },
    error: function (err) {
      console.log('in da error');
    }
  })


});
