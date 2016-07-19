
  var TrackController = function () {
    this.setListeners();
  }

  TrackController.prototype.fetchTracks = function () {
    // console.log(this)
    $.ajax({
      type: 'GET',
      url: this.urlTrack,
      success: this.populatePlayer.bind(this),
      error: function(err){
        console.log('in da error')
      }
    })
  };



  TrackController.prototype.fetchArtist = function (artist) {
    console.log('in da fetchArtist');
    console.log(artist);
    var that = this
    var urlArtist = 'https://api.spotify.com/v1/artists/'+ artist;
    $.ajax({
      type: 'GET',
      url: urlArtist,
      dataType: "json",
      success: function(myArtist){
        console.log(myArtist);
        that.renderArtist(myArtist)
        $('.modal').modal('show')
      },
      error: function(err){
        console.log(err)
      }
    })
  };

  TrackController.prototype.renderArtist = function (artist) {
    var img = $('<img>').attr("src", artist.images[0].url)
    var artistName = artist.name
    var followers = artist.followers.total
    var popularity = artist.popularity
    var genre = artist.genres[0]
    $('.js-name').text(artistName)
    $('.js-profile-img').append(img)
    $('.js-genre').text(genre)
    $('.js-followers').text(followers)
    $('.js-popularity').text(popularity)
  };

  TrackController.prototype.populatePlayer = function(myTracks){
    var track = myTracks.tracks.items[0]
    console.log(track)
    var cover = $('<img>').attr("src", track.album.images[0].url)
    var trackName = track.name
    var trackArtist = track.artists[0].name
    var trackArtistId = track.artists[0].id
    var audioPreview = $('audio').attr("src", track.preview_url)
    $('.title').text(trackName)
    $('.author').attr("id", trackArtistId)
    $('.author').text(trackArtist)
    $('.cover').empty().append(cover)
  }

  TrackController.prototype.playTrack = function () {
    if ($('.btn-play').hasClass('disabled')){
      $('.js-player').trigger('pause');
    }else{
      $('.js-player').trigger('play');
    }
    this.updateProgress()
  };




    TrackController.prototype.printTime = function () {
      var current = $('.js-player').prop('currentTime');
      $('progress').attr("value", current)
      console.debug('Current time: ' + current);
      this.updateProgress
    };

    TrackController.prototype.updateProgress = function (printTime) {
      $('.js-player').on('timeupdate', this.printTime);
    };

    TrackController.prototype.setListeners = function(){
      var that = this
      $(document).on("click", ".btn-play", function(e){
        e.preventDefault()
        $('.btn-play').toggleClass('disabled');
        $('.btn-play').toggleClass('playing');
        that.playTrack()
      })
      $(document).on("click", ".author", function(e){
        e.preventDefault()
        var currentTrack = $(e.currentTarget);
        var artistName = currentTrack.attr("id");
        console.log('artist name is '+ artistName);
        that.fetchArtist(artistName)
      })

    }

    TrackController.prototype.initialSetter = function(){
      console.log('in da setter')
      var that = this;
      $(document).on("submit", "#searchTrack", function(e){
        e.preventDefault()
        var searchTerm = $('[name = "search"]').val();
        that.urlTrack = 'https://api.spotify.com/v1/search?type=track&query='+ searchTerm;
        that.formElement = $('#searchTrack')
        that.fetchTracks()
      })
    }



  //
  // TrackController.prototype.fetchAlbums = function (myArtistId) {
  //   var urlAlbums = 'https://api.spotify.com/v1/artists/'+ myArtistId +'/albums'
  //   $.ajax({
  //     type:'GET',
  //     url: urlAlbums,
  //     success: this.renderAlbums,
  //     error: function(err){
  //       console.log('in da error')
  //     }
  //   })
  // };
  //
  // TrackController.prototype.renderAlbums = function(myAlbums){
  //   var albums = myAlbums.items
  //   albums.forEach(function(album, index){
  //     if($('.row').hasClass('active')){
  //       var albums = $('<li><p>').append(album.name).attr({
  //         class: "album-element",
  //         id: album.id,
  //         'data-toggle': "modal",
  //         'data-target': "#tracks"
  //       })
  //       $('.albums').append(albums).slideDown()
  //     }else{
  //       $('.albums').remove().slideUp()
  //     }
  //   })
  // }

  // TrackController.prototype.fetchTrack = function(){
  //   var urlTracks = 'https://api.spotify.com/v1/albums/'+ myAlbumId +'/tracks'
  //   $.ajax({
  //     type: 'GET',
  //     url: urlTracks,
  //     success: this.renderTracks,
  //     error: function(err){
  //       console.log('in da error')
  //     }
  //   })
  // }

  // TrackController.prototype.renderTracks = function (myTracks) {
  //   var tracks = myTracks.items
  //   tracks.forEach(function(track, index){
  //     var trackItem = $('<li>')
  //     var trackLink = $('<a>').attr({
  //       href: track.preview_url,
  //       target: "_blank"
  //     })
  //     trackItem.append(trackLink)
  //     trackLink.text(track.name)
  //     $('.modal-body').append(trackItem)
  //   })
  // };
  //


$(document).ready(function(){
  var controller = new TrackController()
  controller.initialSetter();

});
