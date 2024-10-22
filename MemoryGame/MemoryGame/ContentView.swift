//
//  ContentView.swift
//  MemoryGame
//
//  Created by Patrycja Kwaśniewska on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    let availableCards = ["😀", "😂", "😎", "🥳", "😇", "😜", "🤩", "🤔"]
    @State private var displayedCards: [String] = ["😀", "😂"]
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            let newCount = displayedCards.count + offset
            
            if newCount >= 2 && newCount <= availableCards.count {
                if offset > 0 {
                    let additionalCards = availableCards[displayedCards.count..<newCount]
                    displayedCards.append(contentsOf: additionalCards)
                } else {
                    displayedCards.removeLast(-offset)
                }
            }
        }) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
        .disabled(displayedCards.count + offset < 2 || displayedCards.count + offset > availableCards.count)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 120))
                ]) {
                    ForEach(displayedCards, id: \.self) { card in
                        CardView(content: card)
                    }
                }
                .foregroundColor(.blue)
            }
            
            HStack {
                adjustCardNumber(by: -2, symbol: "minus.circle")
                Spacer()
                adjustCardNumber(by: 2, symbol: "plus.circle")
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
