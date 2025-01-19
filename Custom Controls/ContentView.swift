//
//  ContentView.swift
//  Custom Controls
//
//  Created by Eric Carroll on 5/7/23.
//

import SwiftUI

struct ContentView: View {
//    @State var selection: Int = 2
//    let items: [String] = ["M", "T", "W", "T", "F"]
//
//    var body: some View {
//        VStack {
//            SegmentedPicker(items: items, selection: $selection)
//        }
//        .padding()
//    }
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue]
    
    var body: some View {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
