
var fs = require('fs');

function makeStars(rating){
  var stars = ''
  for (var i = 0; i < Math.floor(rating); i++) {
    stars += '*'
  }
  return stars
}

function displayEpisodes(episodes){
  for(var episode in episodes){
    console.log('Titile: '+episodes[episode].title +' '+'Episode #: ' +episodes[episode].episode_number )
    console.log(episodes[episode].description)
    console.log('Rating: '+episodes[episode].rating + makeStars(episodes[episode].rating)+'\n')
  }
}

function orderEpisodes(episodes){
  episodes = episodes.sort(function(a,b){
      return a.episode_number-b.episode_number;
    })
  return episodes
}

function filterEpisodes(episodes){
  episodes = episodes.filter(function(episode){
    return episode.rating >  8.5;
  })
  return episodes
}

function searchFor(episodes, searchTerm){
  var result;
  result = episodes.find(function(episode){
    return episode.description.indexOf(searchTerm) > -1
  });
  return result
}

function fileActions(err, file){
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    episodes = orderEpisodes(episodes);
    // episodes = filterEpisodes(episodes);
    var found = searchFor(episodes, "Jon Snow");
    if(found != undefined){
      console.log('I found Jon Snow in episode '+ find.episode_number);
    }else{
      console.log("Jon Snow is dead!!")
    }
    // displayEpisodes(episodes);

}

fs.readFile("./chapters.txt", 'utf8', fileActions);
