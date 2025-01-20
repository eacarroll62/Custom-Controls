//
//  ContentView.swift
//  Custom Controls
//
//  Created by Eric Carroll on 5/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Seg", systemImage: "switch.2") {
                @State var selection: Int = 2
                let items: [String] = ["M", "T", "W", "T", "F"]
                VStack {
                    SegmentedPicker(items: items, selection: $selection)
                }
                .padding()
            }
            
            Tab("Penci", systemImage: "pencil") {
                let colors: [Color] = [.red, .orange, .yellow, .green, .blue]
                List {
                    Spacer()
                    HStack {
                        Spacer()
                        ForEach(colors, id: \.self) { color in
                            ColorPencilView(color: color)
                        }.padding(-29)
                            .offset(x: -30,y: 0)
                    }
                }.onTapGesture {
                    
                }
            }
            
            Tab("Rating", systemImage: "star") {
                @State var currentRating = 0
                @State var heartRating = 0
                @State var pinRating = 0
                @State var bookMarkRating = 0
                @State var flagRating = 0
                
                RatingsView(
                    maxRating: 5,
                    currentRating: $currentRating,
                    width: 40
                )
                RatingsView(
                    maxRating: 3,
                    currentRating: $heartRating,
                    width: 50,
                    symbolEnum: .heart,
                    color: .red
                )
                RatingsView(
                    maxRating: 5,
                    currentRating: $pinRating,
                    width: 40,
                    symbol: "pin",
                    color: .green
                )
                RatingsView(
                    maxRating: 7,
                    currentRating: $flagRating,
                    width: 30,
                    symbolEnum: .flag,
                    color: .green
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
