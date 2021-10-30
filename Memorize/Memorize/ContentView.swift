//
//  ContentView.swift
//  Memorize
//
//  Created by xinkai on 10/10/21.
//

import SwiftUI

struct ContentView: View {
//    var emojies = [ "🚝", "🏎", "🚌", "✈️", "🚔", "⚓️","🛫", "🚧","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r"]
//    @State var emojiSize = 24
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!").font(.largeTitle)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], content: {
                    ForEach(viewModel.cards) { card in
                        CardView(model: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                })
                .foregroundColor(Color.red)
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {}, label: {Label("cars", systemImage: "car").labelStyle(.titleOnly)})
                Spacer()
                Button(action: {}, label: {Image(systemName: "questionmark.circle")})
                Spacer()
                Button(action: {}, label: {Image(systemName: "questionmark.circle")})
                Spacer()
//                buttonAdd
            }
//            .padding(.horizontal)
            .font(.largeTitle)
        }
    }
    
//    var buttonRemove : some View {
//        Button(action: {
//            if emojiSize > 1 {
//                emojiSize -= 1
//            }
//        }, label: {
//            Image(systemName: "minus.circle")
//        })
//    }
//    var buttonAdd  : some View {
//        Button (action:{
//            if emojiSize < emojies.count {
//                emojiSize += 1
//            }
//        }, label: {
//            Image(systemName: "plus.circle")
//        })
//    }
}

struct CardView: View {
//    var content: String
    let model: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if model.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: 3)
                    Text(model.content)
                        .font(.largeTitle)
            } else {
                shape
                    .fill()
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.light)
    }
}
