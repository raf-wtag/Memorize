//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Fahim Rahman on 24/6/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let cardContents = ["🚜", "🚆", "🚌", "🚀", "🛴", "🚡", "🛥", "⚓️", "🛶", "🚁", "⛵️", "🚔", "🛸", "🚲", "🛵" ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            cardContents[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
   
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

