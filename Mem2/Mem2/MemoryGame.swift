//
//  MemoryGame.swift
//  Mem2
//
//  Created by xinkai on 10/30/21.
//

import Foundation



struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    private var indexOfFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chocenIndex = cards.firstIndex(where: {item in item.id == card.id}),
            !cards[chocenIndex].isFaceUp,
            !cards[chocenIndex].isMatched {
            if let existCardIndex = indexOfFaceUpCard {
                if cards[existCardIndex].content == cards[chocenIndex].content {
                    // match detected!
                    cards[existCardIndex].isMatched = true
                    cards[chocenIndex].isMatched = true
                } else {
                    // no match
                    indexOfFaceUpCard = nil
                }
            } else {
                for idx in cards.indices {
                    cards[idx].isFaceUp = false
                }
                indexOfFaceUpCard = chocenIndex
            }
            cards[chocenIndex].isFaceUp.toggle()
        }
        print("hallo, \(card)")
    }
    
//    func findIndexByCard(_ target: Card) -> Int? {
//        for i in 0..<cards.count {
//            if cards[i].id == target.id {
//                return i
//            }
//        }
//        return nil
//    }
    
    init (numberOfPairsOfCards: Int, createCardContent: (Int)-> CardContent) {
        cards = Array<Card>()
        for i in 0..<numberOfPairsOfCards {
            let content = createCardContent(i)
            cards.append(Card(content: content, id: i*2))
            cards.append(Card(content: content, id: i*2+1))
        }
    }
    
    struct Card : Identifiable {
        var isFaceUp : Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
