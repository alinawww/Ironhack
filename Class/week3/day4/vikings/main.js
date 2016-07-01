var pry = require('pryjs');
var colors = require('colors');

function Viking(name, health, strength){
  this.name = name;
  this.health = health;
  this.strength = strength;
}

var Jon = new Viking('Jon', 1000, 20);
var Boo = new Viking('Boo', 1000, 22);
var Kadi = new Viking('Kadi', 1000, 10);
var Mulu = new Viking('Mulu', 1000, 15);
var Baab = new Viking('Baab', 1000, 12);

vikings = []

vikings.push(Jon);
vikings.push(Boo);
vikings.push(Kadi);
vikings.push(Mulu);
vikings.push(Baab);


function Saxon(health, strength){
  this.name = 'Saxon';
  this.health = health;
  this.strength = strength;
}

var sax1 = new Saxon(1000, 4)
var sax2 = new Saxon(1000, 7)
var sax3 = new Saxon(1000, 3)
var sax4 = new Saxon(1000, 2)
var sax5 = new Saxon(1000, 1)


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

var punch = new  Attacks(' 👊 ', 20);
var kick = new Attacks(' 💪 ', 100  );

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
}


function fight(vikings, saxons, attacks){

  var fighter1 = chooseFighter(vikings);
  var fighter2 = chooseFighter(saxons);
  var type1 = chooseAttack(attacks);
  var type2 = chooseAttack(attacks);

  fighter1.health -= selectDamage(type1) * fighter1.strength;
  fighter2.health -= selectDamage(type2) * fighter2.strength;

  console.log(fighter1.name+'\'s health is '+ fighter1.health );
  console.log(fighter2.name+'\'s health is '+ fighter2.health );

  if(vikings.length > 1 && saxons.length > 1){
    if (fighter1.health > 0 && fighter2.health > 0){
    } else if(fighter1.health > fighter2.health){
      var winner = fighter1.name
      var dead = fighter2.name
      var index = saxons.indexOf(fighter2);
      console.log('☠☠☠ ' + dead + ' is DEAD ☠☠☠'.bold.red)
      saxons.splice(index, 1);
      saxons.length --
      // eval(pry.it)
    } else{
      var winner = fighter2.name
      var dead = fighter1.name
      var index = vikings.indexOf(fighter1);
      console.log('☠☠☠ ' + dead + ' is DEAD ☠☠☠'.bold.red)
      vikings.splice(index, 1);
      vikings.length --
    }

    // eval(pry.it)
    setTimeout(function(){
      fight(vikings, saxons, attacks)
    }, 1000);
  } else if(vikings.length > saxons.length){
    console.log('\n▲▲▲▲▲ VIKINGS WIN ▲▲▲▲▲\n'.rainbow);
  } else{
    console.log('\n▲▲▲▲▲ SAXONS WIN ▲▲▲▲▲\n'.rainbow);
  }
}

fight(vikings, saxons, attacks);
