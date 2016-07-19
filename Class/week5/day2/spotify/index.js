
$(document).ready(function(){

var successController = {

}


$('#searchArtist').on("submit", function(e){
  e.preventDefault()
  var searchTerm = $('[name = "search"]').val();
  var urlArtist = 'https://api.spotify.com/v1/search?type=artist&query='+ searchTerm;

  $.ajax({
    type: 'GET',
    url: urlArtist,
    success: function (response) {
      console.log(response.artists.items)
      var myArtists = response.artists.items;
      myArtists.forEach(function(element, index){
        if (element.images.length > 0){
          var imgTag = '<img src="'+element.images[0].url+ '">'
        }else{
          var imgTag = '<img src="http://placehold.it/200x200">'
        }
        var row = '<div class="row" id="'+ element.id +'"> <div class="col-3 artist-img">' + imgTag + '</div>' + '<div class="col-6 artist-details">'+ element.name + '</div>' + '<div class="col-3 artist-popularity">'+ element.popularity + '</div>' + '</div>'
        $('.container').append(row)
        $('html, body').animate({
        scrollTop: $("#main").offset().top
        }, 800);
      })

      $(document).on("click", ".row", function(e){
        e.preventDefault()
        var clicked = $(e.currentTarget);
        clicked.toggleClass('active');
        clicked.append('<div class="albums">')
        var artistId = $(clicked[0]).attr('id')
        var urlAlbum = 'https://api.spotify.com/v1/artists/'+ artistId +'/albums'
        $.ajax({
          type: 'GET',
          url: urlAlbum,
          success: function(response){
            // console.log(response)
            response.items.forEach(function(album, index){
              if($('.row').hasClass('active')){
                console.log(response);
                var albums = '<li> <p class="album-element" id="'+album.id+'" data-toggle="modal" data-target="#tracks">'+ album.name + ' </p></li>'
                $('.albums').append(albums).slideDown()
              }else{
                $('.albums').remove().slideUp()
              }
            })

            $(document).on("click", ".album-element", function(e){
              e.preventDefault()
              var clickedAlbum = $(e.currentTarget);
              clickedAlbum.toggleClass('active');
              var albumId = $(clickedAlbum[0]).attr('id');
              // var albumName = $(albumId).name;
              // debugger
              var urlAlbumTracks = 'https://api.spotify.com/v1/albums/'+albumId+'/tracks'
              // debugger
              $.ajax({
                type: 'GET',
                url: urlAlbumTracks,
                success: function(response){
                  response.items.forEach(function(song, index){
                      var songLi = '<li><a href="' + song.preview_url + '" target="_blank">' + song.name + '</a></li>'
                      $('.modal-body').append(songLi)
                  })

                  // $('.modal-body').text(album.name)
                  console.log(response)
                },
                error: function(err){
                  console.log('in da error')
                }
              })
            })

          },
          error: function(err){
            console.log('in da error');
          }
        })
      })

    },
    error: function (err) {
      console.log('in da error');
    }
  })




})


});
