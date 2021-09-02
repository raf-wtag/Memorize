//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Fahim Rahman on 23/6/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
    }
}


struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let cardShape = RoundedRectangle(cornerRadius: DrawingConstant.cornerRadius, style: .continuous)
                if card.isCardFacedUp {
                    cardShape.fill().foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: DrawingConstant.lineWidth)
                    Text(card.cardContent)
                        .font(font(in: geometry.size))
                } else if card.isMatched {
                    cardShape.opacity(0)
                } else {
                    cardShape.fill()
                }
            }
        }
    }
    
    private struct DrawingConstant {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstant.fontScale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
