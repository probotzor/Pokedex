//
//  ViewController.swift
//  pokedex
//
//  Created by Milos Jakovljeivc on 3/11/17.
//  Copyright © 2017 Milos Jakovljeivc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.done
        collection.showsVerticalScrollIndicator = false
       
        
        
        playBackgroundMusic(filename: "21 Pokémon Center.mp3")
        
        
        parsePokemonCSV()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

    
    func parsePokemonCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let height = Int(row["height"]!)!
                let weight = Int(row["weight"]!)!
                let nextevo = Int(row["nextevo"]!)!
                let nextevolv = Int(row["nextevolv"]!)!
                let nextevoname = row["nextevoname"]!
                let poketype = row["type"]!
                let hp = Int(row["hp"]!)!
                let attack = Int(row["attack"]!)!
                let defense = Int(row["defense"]!)!
                let spattack = Int(row["spattack"]!)!
                let spdefense = Int(row["spdefense"]!)!
                let speed = Int(row["speed"]!)!
                let stone = row["stone"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId, height: height, weight: weight, nextEvo: nextevo, nextEvoLv: nextevolv, nextEvoName: nextevoname, pokeType: poketype, hp: hp, pattack: attack, pdefense: defense, spattack: spattack, spdefense: spdefense, speed: speed, stone: stone)
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke: Pokemon!
            
            if inSearchMode {
                poke = filteredPokemon[indexPath.row]
            } else {
                poke = pokemon[indexPath.row]
            }
            
            
            
            cell.configureCell(pokemon: poke)
            return cell
            
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let poke: Pokemon!
        
        if inSearchMode {
            poke = filteredPokemon[indexPath.row]
        } else {
            poke = pokemon[indexPath.row]
        }
        
        print(poke.name)
        print(poke.height)
        print(poke.weight)
        print(poke.nextEvo)
        performSegue(withIdentifier: "PokemonDetailVC", sender: poke)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPokemon.count
        }
        
        return pokemon.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 98)
    }
    
    
    
    
    var backgroundMusicPlayer = AVAudioPlayer()
    func playBackgroundMusic(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchbar.text == nil || searchbar.text == "" {
            inSearchMode = false
            self.view.endEditing(true)
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchbar.text!.lowercased()
            filteredPokemon = pokemon.filter({$0.name.range(of: lower) != nil})
            collection.reloadData()
        }
    }
    
    @IBAction func endediting(_ sender: Any) {
        self.view.endEditing(true)
    }
    @IBAction func endediting2(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func endediting3(_ sender: Any) {
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailVC" {
            if let detailsVC = segue.destination as? PokemonDetailVC {
                if let poke = sender as? Pokemon {
                    detailsVC.pokemon = poke
                }
            }
        }
    }
}

