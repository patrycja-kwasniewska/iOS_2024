//
//  ContentView.swift
//  MemoryGame
//
//  Created by Patrycja Kwaśniewska on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    let cards = ["😀", "😂", "😎"]

    var body: some View {
        HStack {
            ForEach(cards, id: \.self) { card in
                CardView(content: card)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
