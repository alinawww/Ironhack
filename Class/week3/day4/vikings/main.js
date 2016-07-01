var pry = require('pryjs')

function Viking(name, health, strength){
  this.name = name;
  this.health = health;
  this.strength = strength;
}

var Jon = new Viking('Jon', 100, 100);
var Boo = new Viking('Boo', 100, 90);
var Kadi = new Viking('Kadi', 100, 80);
var Mulu = new Viking('Mulu', 100, 70);
var Baab = new Viking('Baab', 100, 60);

vikings = []

vikings.push(Jon);
vikings.push(Boo);
vikings.push(Kadi);
vikings.push(Mulu);
vikings.push(Baab);

function Saxon(health, strength){
  this.health = health;
  this.strength = strength;
  this.name = 'Saxon';
}

var sax1 = new Saxon(100, 4)
var sax2 = new Saxon(100, 7)
var sax3 = new Saxon(100, 3)
var sax4 = new Saxon(100, 2)
var sax5 = new Saxon(100, 1)

saxons = []

saxons.push(sax1);
saxons.push(sax2);
saxons.push(sax3);
saxons.push(sax4);
saxons.push(sax5);


function chooseFighter(population){
  var fighter = population[Math.floor(Math.random() * population.length)];
  return fighter;
}


function Attacks(type, damage){
  this.type = type
  this.damage = damage
}
var punch = new  Attacks(' 👊 ', .4);
var kick = new Attacks(' 💪 ', .2  );
var attacks = [];
attacks.push(punch);
attacks.push(kick);


function chooseAttack(attacks){
  var attack = attacks[Math.floor(Math.random() * attacks.length)];
  return attack;
}

function selectDamage(type){
  times = Math.floor((Math.random() * 2) + 1);
  var damage = type.damage * times;
  var theHits = ''
  for (var i = 0; i <= times; i++) {
    theHits += type.type
  }
  console.log(theHits);
  return damage
  // eval(pry.it);
}

function fight(vikings, saxons, attacks){
  var fighter1 = chooseFighter(vikings);
  var fighter2 = chooseFighter(saxons);
  var type1 = chooseAttack(attacks);
  var type2 = chooseAttack(attacks);
  // console.log(fighter1.name + ' and ' + fighter2.name + ' are fighting!')
  //
  // eval(pry.it);

  fighter2.health -= selectDamage(type1) * fighter2.strength;
  fighter1.health -= selectDamage(type2) * fighter1.strength;


  console.log(fighter1.name+'\'s health is '+fighter1.health );
  console.log(fighter2.name+'\'s health is '+fighter2.health );

  if (fighter1.health > 0 && fighter2.health > 0){
    fight(vikings, saxons, attacks);
  } else if(fighter1.health > fighter2.health){
    var winner = fighter1.name
    var dead = fighter2.name
    console.log(dead + ' is dead!')
  } else{
    var winner = fighter2.name
    var dead = fighter1.name
    console.log(dead + ' is dead!')
  }

  return winner
}


fight(vikings, saxons, attacks);

// console.log(chooseFighter(vikings))
// console.log(selectDamage(attacks, times))
