//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Fahim Rahman on 24/6/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let cardContents = ["🚜", "🚆", "🚌", "🚀", "🛴", "🚡", "🛥", "⚓️", "🛶", "🚁", "⛵️", "🚔", "🛸", "🚲", "🛵" ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            cardContents[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
   
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}

