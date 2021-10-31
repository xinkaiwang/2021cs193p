//
//  Mem2App.swift
//  Mem2
//
//  Created by xinkai on 10/30/21.
//

import SwiftUI

@main
struct Mem2App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
