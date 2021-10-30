//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by xinkai on 10/12/21.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    static let emojies = ["🚕","🚌","🚓","🚑","🚒","🚜","🚚","🚛","🚠","🚋","🚄","✈️","🛳","🚁","🚂"]

    static func createMemoryGame() ->MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { idx in emojies[idx] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send()
        model.choose(card)
    }
}
