//
//  MemoryGame.swift
//  Memorize
//
//  Created by Fahim Rahman on 24/6/21.
//

import Foundation

struct MemoryGame<CardType> where CardType: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfOnlyFacedUpCard: Int? {
        get {
            var faceUpIndicies = [Int]()
            for index in cards.indices {
                if cards[index].isCardFacedUp {
                    faceUpIndicies.append(index)
                }
            }
            if faceUpIndicies.count == 1 {
                return faceUpIndicies.first
            } else {
                return nil
            }
        }
        set {
            for index in cards.indices {
                if index != newValue {
                    cards[index].isCardFacedUp = false
                } else {
                    cards[index].isCardFacedUp = true
                }
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let selectedCardIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[selectedCardIndex].isCardFacedUp, !cards[selectedCardIndex].isMatched {
            if let potentialMatchIndex = indexOfOnlyFacedUpCard {
                if cards[selectedCardIndex].cardContent == cards[potentialMatchIndex].cardContent {
                    cards[selectedCardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[selectedCardIndex].isCardFacedUp = true
            } else {
                indexOfOnlyFacedUpCard = selectedCardIndex
            }
            
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
        var isCardFacedUp = false
        var isMatched = false
        let cardContent: CardType
        let id: Int
    }
}
