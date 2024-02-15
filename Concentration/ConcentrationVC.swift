//
//  ConcentrationVC.swift
//  Concentration
//
//  Created by de.egorov on 14.02.2024.
//

import UIKit

class ConcentrationVC: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Ход: \(flipCount)" } }
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("cardNumber is nil!")
        }
    }
    
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .randomColor()
            }
        }
    }
    
    
    var emojiChoices = ["🥝", "🥕", "🍔", "🪿", "🐥", "🍟", "🤗", "🎱", "❤️", "🐮", "🪵", "🍀", "🍄", "🔥", "🌕", "🍒", "🏀", "🧘", "🥇", "✈️", "🚀"]
    
    var emoji = [Int:String]()
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}




//_/_/_/_/_/_/_/_/ NOTE _/_/_/_/_/_/_/_/_/_/_/_/


//            button.titleLabel?.font = UIFont.systemFont(ofSize:  50)


// flipCard(emoji: cards[cardNumber], button: sender)


//if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
