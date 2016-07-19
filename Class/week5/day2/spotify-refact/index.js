
$(document).ready(function(){

var SuccessController = function (container, formElement, url, artists) {
  this.container = container;
  this.formElement = formElement;
  this.url = url;
  this.setListeners();
  this.artists.items = artists;
}

SuccessController.prototype.showErr = function(){
  function (err) {
    console.log('in da error');
  }
}

SuccessController.prototype.fetchArtists = function () {
   $.ajax({
     type: 'GET',
     url: this.url,
     success: this.renderArtists.bind(this),
     error: this.showErr.bind(this)
   })
 }

 SuccessController.prototype.fetchAlbums = function (artistId) {
    $.ajax({
      type: 'GET',
      url: this.url,
      success: this.renderAlbums.bind(this),
      error: this.showErr.bind(this)
    })
  }

  SuccessController.prototype.fetchTracks = function (albumId) {
     $.ajax({
       type: 'GET',
       url: this.url,
       success: this.renderTracks.bind(this),
       error: this.showErr.bind(this)
     })
   }

SuccessController.prototype.renderArtists = function(){
  var that = this;
  var myArtists = this.artists.items;
  myArtists.forEach(function(element, index){
    if (element.images.length > 0){
      var imgTag = $('<img>').attr("src", element.images[0].url )
    } else{
      var imgTag = $('<img>').attr("src", "http://placehold.it/200x200")
    };
    var row = $('<div>').attr({
      class: "row",
      id: element.id
    });
    var artistImgCol = $('<div>').attr({
      class: ["col-3", "artist-img"]
    });
    var artistDetailsCol = $('<div>').attr({
      class: ["col-6", "artist-details"]
    });
    var artistPopularityCol = $('<div>').attr({
      class: ["col-3", "artist-popularity"]
    });
    artistImgCol.append(imgTag);
    artistDetailsCol.append(element.name);
    artistPopularityCol.append(element.popularity);
    row.append(artistImgCol);
    row.append(artistDetailsCol);
    row.append(artistPopularityCol);
    this.container.append(row)
});


SuccessController.prototype.renderAlbums = function(albums){
  var that = this;
  var myAlbums = this.albums;
  // var artistRow =  // this is where I LEFT...
  //////
  ///
  //
  myAlbums.forEach(function(album, index){
    if($('.row').hasClass('active')){
      console.log(response);
      var albums = '<li> <p class="album-element" id="'+album.id+'" data-toggle="modal" data-target="#tracks">'+ album.name + ' </p></li>'
      $('.albums').append(albums).slideDown()
    }else{
      $('.albums').remove().slideUp()
    }
  })
}

SuccessController.prototype.animateBody = function(){
  $('html, body').animate({
  scrollTop: $(container).offset().top
  }, 800);
}

SuccessController.prototype.setListeners = function(){
  this.formElement.on('submit', this.renderArtists.bind(this));
  this.rowElement.on('click', this.renderAlbums.bind(this));
  this.albumElement.on('click', this.renderTracks.bind(this))
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
