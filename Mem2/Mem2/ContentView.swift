//
//  ContentView.swift
//  Mem2
//
//  Created by xinkai on 10/30/21.
//

import SwiftUI

var cars = ["🚕","🚌","🚓","🚑","🚒","🚜","🚚","🚛","🚠","🚋","🚄","✈️","🛳","🚁","🚂"]
var faces = ["😃","😂","😍","🙃","😇","😎","🤓","🤩",
                    "🤬","🥶","🤢","🤠","😷","🤕","😱","😜",
                    "🥵","🤡","💩","🥳"]
var foods = ["🍏","🍎","🍊","🍋","🍌","🥑","🥝","🍇","🍐","🍓","🍒","🍉"]

struct ContentView: View {
    @State var emojies = foods.shuffled()
    
    var body: some View {
        VStack {
            Text("Memorize!")
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 100))])
                {
                    ForEach(emojies, id: \.self, content: {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            Spacer()
            HStack{
                Spacer()
                carsButton
                Spacer()
                facesButton
                Spacer()
                foodButton
                Spacer()
            }
            .font(.largeTitle)
            .padding(.vertical)
            .foregroundColor(.blue)
        }
        .foregroundColor(.red)
        .font(.largeTitle)
    }
    
    var carsButton: some View {
        Button(action: {
            emojies = cars.shuffled()
        }, label: {
            VStack{
                Image(systemName: "car")
                Text("cars").font(.body)
            }
        })
    }
    var facesButton: some View {
        Button(action: {
            emojies = faces.shuffled()
        }, label: {
            VStack{
                Image(systemName: "face.smiling")
                Text("faces").font(.body)
            }
        })
    }
    var foodButton: some View {
        Button(action: {
            emojies = foods.shuffled()
        }, label: {
            VStack {
                Image(systemName: "leaf")
                Text("food").font(.body)
            }
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
