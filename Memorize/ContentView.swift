//
//  ContentView.swift
//  Memorize
//
//  Created by Fahim Rahman on 23/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardContents = ["🚜", "🚆", "🚌", "🚀", "🛴", "🚡", "🛥", "⚓️", "🛶", "🚁", "⛵️", "🚔", "🛸", "🚲", "🛵" ]
//    @State var cardCount = 3
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
                .padding()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(cardContents, id: \.self ) { content in
                        CardView(cardContent: content)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Spacer()
                showTravelTheme
                Spacer()
                showAnimalTheme
                Spacer()
                showFlagTheme
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        
        .padding(.horizontal)
        
    }
    
    var showTravelTheme: some View {
        Button{
            cardContents = ["🚜", "🚆", "🚌", "🚀", "🛴", "🚡", "🛥", "⚓️", "🛶", "🚁", "⛵️", "🚔", "🛸", "🚲", "🛵" ]
            cardContents.shuffle()
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.body)
                    
            }
        }
    }
    
    var showFlagTheme: some View {
        Button {
            cardContents = ["🇧🇩", "🚩", "🇦🇫", "🇦🇽", "🇧🇷", "🇧🇦", "🇨🇫", "🇨🇳", "🇧🇸", "🇨🇨", "🏴‍☠️", "🇩🇲", "🇳🇪", "🇳🇨",  "🇲🇴", "🇱🇷", "🇱🇰", "🏴󠁧󠁢󠁥󠁮󠁧󠁿"]
            cardContents.shuffle()
        } label: {
            VStack {
                Image(systemName: "flag")
                Text("Animals")
                    .font(.body)
            }
            
        }
    }
    
    var showAnimalTheme: some View {
        Button(action: {
            cardContents = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐔", "🐒", "🦉", "🦇", "🐢", "🦀", "🦕", "🐝"]
            cardContents.shuffle()
        }, label: {
            VStack {
                Image(systemName: "hare")
                Text("Flags")
                    .font(.body)
            }
        })
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
