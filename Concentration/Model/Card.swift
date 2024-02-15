//
//  Card.swift
//  Concentration
//
//  Created by de.egorov on 15.02.2024.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var myIdentifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        myIdentifierFactory += 1
        return myIdentifierFactory
    }
    
    init() {
        self.identifier = Self.getUniqueIdentifier()
    }
}
