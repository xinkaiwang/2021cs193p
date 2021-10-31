//
//  EmojiMemoryGame.swift
//  Mem2
//
//  Created by xinkai on 10/30/21.
//

import Foundation


class EmojiMemoryGame {
    static let emojies = ["🚕","🚌","🚓","🚑","🚒","🚜","🚚","🚛","🚠","🚋","🚄","✈️","🛳","🚁","🚂"]

    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { idx in
        emojies[idx]
    }    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
