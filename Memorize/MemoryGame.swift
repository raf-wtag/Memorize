//
//  MemoryGame.swift
//  Memorize
//
//  Created by Fahim Rahman on 24/6/21.
//

import Foundation

struct MemoryGame<CardType> where CardType: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfOnlyFacedUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let selectedCardIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[selectedCardIndex].isCardFacedUp, !cards[selectedCardIndex].isMatched {
            if let potentialMatchIndex = indexOfOnlyFacedUpCard {
                if cards[selectedCardIndex].cardContent == cards[potentialMatchIndex].cardContent {
                    cards[selectedCardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfOnlyFacedUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isCardFacedUp = false
                }
                indexOfOnlyFacedUpCard = selectedCardIndex
            }
            cards[selectedCardIndex].isCardFacedUp.toggle()
        }
        print("\(cards)")
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
        var isCardFacedUp: Bool = false
        var isMatched: Bool = false
        var cardContent: CardType
        
        var id: Int
    }
}
