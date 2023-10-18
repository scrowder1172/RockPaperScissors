//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by SCOTT CROWDER on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items: [String] = ["🪨", "📄", "✂️"]
        .shuffled()
    
    @State private var choices: [String] = ["Win", "Lose", "Draw"]
    
    @State private var randomSelection: Int = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Rock, Paper Scissors +")
                        .font(.system(size: 22))
                    Text("Win, Lose, or Draw")
                        .font(.system(size: 22))
                    Rectangle()
                        .frame(height: 1)
                }
                
                Spacer()
                
                VStack {
                    Text("The computer selected the following:")
                        .font(.system(size: 22))
                    Text("\(items[randomSelection])")
                        .font(.system(size: 100))
                }
                
                Spacer()
                
                VStack {
                    Text("Select the option that makes you:")
                        .font(.system(size: 25))
                    Text("\(choices[randomSelection])")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                VStack (spacing: 30) {
                    Text("Click a Button!")
                        .font(.largeTitle)
                    HStack(spacing: 20) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("🪨")
                                .font(.system(size: 100))
                        })
                        Button(action: {}, label: {
                            Text("📄")
                                .font(.system(size: 100))
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("✂️")
                                .font(.system(size: 100))
                        })
                    }
                    
                }
                Spacer()
            }
            .padding()
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
