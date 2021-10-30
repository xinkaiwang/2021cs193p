//
//  ContentView.swift
//  Mem2
//
//  Created by xinkai on 10/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojies = ["🚕","🚌","🚓","🚑","🚒","🚜","🚚","🚛","🚠","🚋","🚄","✈️","🛳","🚁","🚂"]
    @State var emojiSize = 4

    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 100))])
                {
                    ForEach(emojies[0..<emojiSize], id: \.self, content: {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            Spacer()
            HStack{
                buttonRemove
                Spacer()
                buttonAdd
            }
            .font(.largeTitle)
            .padding(.vertical)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var buttonRemove: some View {
        Button(action: {
            if emojiSize > 1 {
                emojiSize -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    var buttonAdd: some View {
        Button(action: {
            if emojiSize < emojies.count {
                emojiSize += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
                    .foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
