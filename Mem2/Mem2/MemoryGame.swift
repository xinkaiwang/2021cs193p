//
//  MemoryGame.swift
//  Mem2
//
//  Created by xinkai on 10/30/21.
//

import Foundation



struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init (numberOfPairsOfCards: Int, createCardContent: (Int)-> CardContent) {
        cards = Array<Card>()
        for i in 0..<numberOfPairsOfCards {
            let content = createCardContent(i)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp : Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
