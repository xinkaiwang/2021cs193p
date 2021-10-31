//
//  ContentView.swift
//  Mem2
//
//  Created by xinkai on 10/30/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 100))])
                {
                    ForEach(viewModel.cards) { cardModel in
                        CardView(model: cardModel)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(cardModel)
                            }
                    }
                }
            }
            Spacer()
            HStack{
                Spacer()
            }
            .font(.largeTitle)
            .padding(.vertical)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game).preferredColorScheme(.dark)
        ContentView(viewModel: game).preferredColorScheme(.light)
    }
}

struct CardView: View {
    let model: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if model.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(model.content)
                    .font(.largeTitle)
            } else if model.isMatched {
                shape.opacity(0)
            } else {
                shape
                    .fill()
                    .foregroundColor(.red)
            }
        }
    }
}
