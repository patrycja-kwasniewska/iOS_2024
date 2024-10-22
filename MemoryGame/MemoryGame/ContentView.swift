//
//  ContentView.swift
//  MemoryGame
//
//  Created by Patrycja Kwaśniewska on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    let availableCards = ["😀", "😂", "😎", "🥳", "😇", "😜", "🤩", "🤔", "🤯", "🤡", "👅", "🫀", "🦁", "🦊", "🥰", "😅"]
    
    @State private var displayedCards: [String] = ["😀", "😂"]
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        let isDisabled = displayedCards.count + offset < 2 || displayedCards.count + offset > availableCards.count //jesli ilosc mniejsza od 2 lub wieksza niz dostepne karty
        
        return Button(action: {
            let newCount = displayedCards.count + offset //ilosc wyswietlanych aktualnie kart
            
            if newCount >= 2 && newCount <= availableCards.count { //jesli aktualna ilosc w <2;max>
                if offset > 0 {
                    let additionalCards = availableCards[displayedCards.count..<newCount]
                    displayedCards.append(contentsOf: additionalCards)
                } else {
                    displayedCards.removeLast(-offset)
                }
            }
        }) {
            Image(systemName: symbol) //styl przycisku
                .font(.largeTitle)
                .foregroundColor(isDisabled ? .gray : .blue)
        }
        .disabled(isDisabled)
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
