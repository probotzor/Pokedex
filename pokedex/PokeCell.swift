//
//  PokeCell.swift
//  pokedex
//
//  Created by Milos Jakovljeivc on 3/15/17.
//  Copyright © 2017 Milos Jakovljeivc. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var indexLb: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLb.text = self.pokemon.name.capitalized
        indexLb.text = "# \(self.pokemon.pokedexId)"
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
}
