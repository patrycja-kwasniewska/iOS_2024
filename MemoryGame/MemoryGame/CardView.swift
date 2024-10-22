//
//  CardView.swift
//  MemoryGame
//
//  Created by Patrycja Kwaśniewska on 22/10/2024.
//

import SwiftUI

struct CardView: View {
    @State private var isRevealed: Bool = false
    let content: String
    
    var body: some View {
        Group {
            if isRevealed {
                Text(content)
                    .font(.largeTitle)
            } else {
                Text("")
                    .font(.largeTitle)
            }
        }
        .frame(width: 100, height: 100)
        .background(isRevealed ? Color.white : Color.blue)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 2)
        )
        .opacity(isRevealed ? 1 : 0.25)
        .onTapGesture {
            withAnimation {
                isRevealed.toggle()
            }
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(content: "😁")
                .frame(width: 100, height: 100)
            CardView(content: "😁")
                .frame(width: 100, height: 100)
        }
    }
}
