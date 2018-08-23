//
//  Pokemon.swift
//  pokedex
//
//  Created by Milos Jakovljeivc on 3/15/17.
//  Copyright © 2017 Milos Jakovljeivc. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: Int!
    private var _weight: Int!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvo: Int!
    private var _nextEvoLv: Int!
    private var _nextEvoName: String!
    private var _poketype: String!
    private var _hp: Int!
    private var _pattack: Int!
    private var _pdefense: Int!
    private var _spattack: Int!
    private var _spdefense: Int!
    private var _speed: Int!
    private var _stone: String!
    
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var height: Int {
        return _height
    }
    
    var weight: Int {
        return _weight
    }
    
    var nextEvo: Int {
        return _nextEvo
    }
    
    var nextEvoLv: Int {
        return _nextEvoLv
    }
    
    var nextEvoName: String {
        return _nextEvoName
    }
    
    var pokeType: String {
        return _poketype
    }
    var hp: Int {
        return _hp
    }
    var pattack: Int {
        return _pattack
    }
    var pdefense: Int {
        return _pdefense
    }
    var spattack: Int {
        return _spattack
    }
    var spdefense: Int {
        return _spdefense
    }
    var speed: Int {
        return _speed
    }
    var stone: String {
        return _stone
    }

    
    init(name: String, pokedexId: Int, height: Int, weight: Int, nextEvo: Int, nextEvoLv: Int, nextEvoName: String, pokeType: String, hp: Int, pattack: Int, pdefense: Int, spattack: Int, spdefense: Int, speed: Int, stone: String) {
        self._name = name
        self._pokedexId = pokedexId
        self._height = height
        self._weight = weight
        self._nextEvo = nextEvo
        self._nextEvoLv = nextEvoLv
        self._nextEvoName = nextEvoName
        self._poketype = pokeType
        self._hp = hp
        self._pattack = pattack
        self._pdefense = pdefense
        self._spattack = spattack
        self._spdefense = spdefense
        self._speed = speed
        self._stone = stone
        
    }
}
