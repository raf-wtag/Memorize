//
//  MemoryGame.swift
//  Memorize
//
//  Created by Fahim Rahman on 24/6/21.
//

import Foundation

struct MemoryGame<CardType> {
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        let selectedCardIndex = index(of: card)
        cards[selectedCardIndex].isCardFacedUp.toggle()
        print("chosen card = \(cards[selectedCardIndex])")
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardType) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(cardContent: content, id: pairIndex*2))
            cards.append(Card(cardContent: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isCardFacedUp: Bool = true
        var isMatched: Bool = false
        var cardContent: CardType
        
        var id: Int
    }
}
