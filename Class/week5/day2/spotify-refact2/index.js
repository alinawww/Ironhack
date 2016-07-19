
  var ArtistController = function () {
    this.setListeners();
  }

  ArtistController.prototype.fetchArtist = function () {
    console.log(this)
    $.ajax({
      type: 'GET',
      url: this.urlArtist,
      success: this.renderArtists.bind(this),
      error: function(err){
        console.log('in da error')
      }
    })
  };

  ArtistController.prototype.renderArtists = function(myArtists){
    var artists = myArtists.artists.items
    artists.forEach(function(element, index){
      if (element.images.length > 0){
        var imgUrl = element.images[0].url
      }else{
        var imgUrl = 'http://placehold.it/200x200'
      }
      var imgTag = $('<img>').attr("src", imgUrl)
      var row = $('<div>').attr({
        class: "row",
        id: element.id
      });
      var artistImgCol = $('<div>').attr({
        class: ["col-3 artist-img"]
      });
      var artistDetailsCol = $('<div>').attr({
        class: ["col-6 artist-details"]
      });
      var artistPopularityCol = $('<div>').attr({
        class: ["col-3 artist-popularity"]
      });
      artistImgCol.append(imgTag);
      artistDetailsCol.append(element.name);
      artistPopularityCol.append(element.popularity);
      row.append(artistImgCol);
      row.append(artistDetailsCol);
      row.append(artistPopularityCol);
      $('.container').append(row)
    })
  }

  ArtistController.prototype.fetchAlbums = function (myArtistId) {
    var urlAlbums = 'https://api.spotify.com/v1/artists/'+ myArtistId +'/albums'
    $.ajax({
      type:'GET',
      url: urlAlbums,
      success: this.renderAlbums,
      error: function(err){
        console.log('in da error')
      }
    })
  };

  ArtistController.prototype.renderAlbums = function(myAlbums){
    var albums = myAlbums.items
    albums.forEach(function(album, index){
      if($('.row').hasClass('active')){
        var albums = $('<li><p>').append(album.name).attr({
          class: "album-element",
          id: album.id,
          'data-toggle': "modal",
          'data-target': "#tracks"
        })
        $('.albums').append(albums).slideDown()
      }else{
        $('.albums').remove().slideUp()
      }
    })
  }

  ArtistController.prototype.fetchTracks = function(myAlbumId){
    var urlTracks = 'https://api.spotify.com/v1/albums/'+ myAlbumId +'/tracks'
    $.ajax({
      type: 'GET',
      url: urlTracks,
      success: this.renderTracks,
      error: function(err){
        console.log('in da error')
      }
    })
  }

  ArtistController.prototype.renderTracks = function (myTracks) {
    var tracks = myTracks.items
    tracks.forEach(function(track, index){
      var trackItem = $('<li>')
      var trackLink = $('<a>').attr({
        href: track.preview_url,
        target: "_blank"
      })
      trackItem.append(trackLink)
      trackLink.text(track.name)
      $('.modal-body').append(trackItem)
    })
  };

  ArtistController.prototype.setListeners = function(){
    var that = this
    $(document).on("click", ".row", function(e){
      e.preventDefault()
      var clicked = $(e.currentTarget);
      clicked.toggleClass('active');
      clicked.append('<div class="albums">')
      var artistId = $(clicked[0]).attr('id')
      that.fetchAlbums(artistId)
    })
    $(document).on("click", ".album-element", function(e){
      e.preventDefault()
      var clickedAlbum = $(e.currentTarget);
      clickedAlbum.toggleClass('active');
      var albumId = $(clickedAlbum[0]).attr('id');
      that.fetchTracks(albumId)
    })
  }

  ArtistController.prototype.initialSetter = function(){
    var that = this;
    $(document).on("submit", "#searchArtist", function(e){
      e.preventDefault()
      var searchTerm = $('[name = "search"]').val();
      that.urlArtist = 'https://api.spotify.com/v1/search?type=artist&query='+ searchTerm;
      that.formElement = $('#searchArtist')
      that.fetchArtist()
    })
  }


$(document).ready(function(){

  var controller = new ArtistController()
  controller.initialSetter();

});
