//
//  ContentView.swift
//  Kola
//
//  Created by Patrycja Kwaśniewska on 15/10/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var colors: [ColorData] = [
        ColorData(colorName: "Red", colorValue: .red, count: 0),
        ColorData(colorName: "Blue", colorValue: .blue, count: 0),
        ColorData(colorName: "Yellow", colorValue: .yellow, count: 0),
        ColorData(colorName: "Green", colorValue: .green, count: 0),
        ColorData(colorName: "Purple", colorValue: .purple, count: 0),
        ColorData(colorName: "Orange", colorValue: .orange, count: 0),
        ColorData(colorName: "Pink", colorValue: .pink, count: 0),
        ColorData(colorName: "Cyan", colorValue: .cyan, count: 0)
    ]
    
    @State private var firstCircleColor: Color = .red
    @State private var secondCircleColor: Color = .blue
    @State private var firstCircleOpacity: Double = 0.5
    @State private var secondCircleOpacity: Double = 0.5
    
    func randColor() -> ColorData {
        if let randomColor = colors.randomElement() {
            if let index = colors.firstIndex(where: { $0.id == randomColor.id }) {
                colors[index].count += 1
            }
            return randomColor
        }
        return colors[0]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Circle()
                    .fill(firstCircleColor)
                    .opacity(firstCircleOpacity)
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        firstCircleOpacity = 1.0
                        secondCircleOpacity = 0.0
                    }
                
                Circle()
                    .fill(secondCircleColor)
                    .opacity(secondCircleOpacity)
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        secondCircleOpacity = 1.0
                        firstCircleOpacity = 0.0
                    }
                
                Spacer()
                
                HStack {
                    Button("Losuj kolor 1") {
                        let newColor = randColor()
                        firstCircleColor = newColor.colorValue
                    }
                    .padding()
                    
                    NavigationLink(destination: StatisticView(colors: colors)) {
                        Text("Pokaż statystykę")
                    }
                    .padding()
                    
                    Button("Losuj kolor 2") {
                        let newColor = randColor()
                        secondCircleColor = newColor.colorValue
                    }
                    .padding()
                }
                .foregroundColor(.blue)
            }
            .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
