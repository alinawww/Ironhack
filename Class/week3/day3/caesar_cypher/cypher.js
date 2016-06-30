
function caesarCypher(message, shift) {
  shift = shift || -3
  var letters = message.split('');
  var encoded = []
  letters.forEach(function(letter, index){
    var shifted_letter_upper = String.fromCharCode(((letter.charCodeAt(0) - 65 + shift) % 26) + 65);
    var shifted_letter_lower = String.fromCharCode(((letter.charCodeAt(0) - 97 + shift) % 26) + 97);
    if(letter.charCodeAt(0) >= 65 && letter.charCodeAt(0) <= 90){
      encoded.push(shifted_letter_upper);
    }else if(letter.charCodeAt(0) >= 97 && letter.charCodeAt(0) <= 122){
      encoded.push(shifted_letter_lower);
    }
    else{
      encoded.push(letter);
    }
    message = encoded.join('');
  })
  return message
}

console.log(caesarCypher('Et tu, brute?', 6))

// module.exports = caesarCypher
