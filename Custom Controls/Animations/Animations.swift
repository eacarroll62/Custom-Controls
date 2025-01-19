//
//  Animations.swift
//  Custom Controls
//
//  Created by Eric Carroll on 8/6/23.
//

import SwiftUI

struct Animations: View {
    
    var body: some View {
        Popup()
    }
}

#Preview {
    Animations()
}

struct Exercise1_TheSetup: View {
    @State private var change = false
    private var offsetValue: CGFloat = 200
    private var rectWdith: CGFloat = 70
    private var rectHeight: CGFloat = 35
    private var spacing: CGFloat = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: spacing) {
                HStack(alignment: .bottom, spacing: spacing) {
                    Rectangle()
                        .frame(width: rectWdith, height: rectHeight)
                        .offset(x: change ? 0 : -offsetValue)
                    Rectangle()
                        .frame(width: rectHeight, height: rectWdith)
                        .offset(y: change ? 0 : -offsetValue)
                }
                .offset(x: -18)
                
                HStack(alignment: .top, spacing: spacing) {
                    Rectangle()
                        .frame(width: rectWdith + 1, height: rectHeight + 2)
                        .offset(x: change ? 0 : offsetValue)
                    Rectangle()
                        .frame(width: rectHeight + 2, height: rectWdith + 1)
                        .offset(y: change ? 0 : offsetValue)
                }.offset(x: 18)
            }
            .rotationEffect(.degrees(change ? 0 : -90))
            .foregroundColor(change ? .red : .blue)
            .opacity(change ? 1 : 0)
            .animation(.default, value: change)
            
            Spacer()
            
            Button("Change") {
                change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct Popup: View {
    @State private var showPopup = false
    @GestureState private var popupOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                HStack {
                    Text("Nouns")
                    Text("Verbs")
                    Text("Pronouns")
                    Text("Conjunctions")
//                    Button("Show Popup") {
//                        showPopup = true
//                    }
                }.onTapGesture {
                    showPopup = true
                }
            }.font(.title3)
                .blur(radius: showPopup ? 2 : 0)
                .animation(.easeOut, value: showPopup)
            
            if showPopup {
                ZStack {
                    Color.black
                        .opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showPopup = false
                        }
                    VStack(spacing: 20) {
                        Text("Drag popup off the screen")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                        Spacer()
                        Text("You can also tap outside of the popup to close")
                        Spacer()
                        Button("Or tap this button to close") {
                            showPopup = false
                        }.padding(.bottom)
                    }
                    .frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(.horizontal, 25)
                    .offset(popupOffset)
                    .gesture(
                        DragGesture(minimumDistance: 100)
                            .updating($popupOffset, body: {(value, popupOffset, transaction) in
                                popupOffset = value.translation
                            })
                            .onEnded({value in
                                showPopup = false
                            })
                    )
                }.animation(.default, value: showPopup)
            }
        }.animation(.easeIn, value: showPopup)
    }
}


