//
//  ContentView.swift
//  Memorize
//
//  Created by Fahim Rahman on 23/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardContents = ["🚜", "🚆", "🚌", "🚀", "🛴", "🚡", "🛥", "⚓️", "🛶", "🚁", "⛵️", "🚔", "🛸", "🚲", "🛵" ]
    @State var cardCount = 3
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
                .padding()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(cardContents[0...cardCount], id: \.self ) { content in
                        CardView(cardContent: content)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                removeCard
                Spacer()
                Button {
                    cardContents.shuffle()
                } label: {
                    Text("Shuffle")
                }
                Spacer()
                addCard
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        
        .padding(.horizontal)
        
    }
    
    var addCard: some View {
        Button{
            cardCount += 1
            if cardCount > cardContents.count - 1 {
                cardCount = cardContents.count - 1
            }
        } label: {
            Image(systemName: "plus.circle.fill")
        }
    }
    
    var removeCard: some View {
        Button {
            cardCount -= 1
            if cardCount < 0 {
                cardCount = 0
            }
        } label: {
            Image(systemName: "minus.circle.fill")
        }
    }
}


struct CardView: View {
    var cardContent: String
    @State var isCardFacedUp: Bool = true
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 10.0, style: .continuous)
            if isCardFacedUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: 3.0)
                Text(cardContent).font(.largeTitle)
            } else {
                cardShape.fill()
            }
        }
        .onTapGesture {
            isCardFacedUp = !isCardFacedUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
