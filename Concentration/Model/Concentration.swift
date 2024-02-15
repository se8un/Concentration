//
//  Concentration.swift
//  Concentration
//
//  Created by de.egorov on 15.02.2024.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
    }
    
    // TODO: shuffle the cards
}
