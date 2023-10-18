//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by SCOTT CROWDER on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items: [String] = ["🪨", "📄", "✂️"].shuffled()
    
    @State private var choices: [String] = ["Win", "Lose", "Tie"].shuffled()
    
    @State private var randomSelection: Int = Int.random(in: 0...2)
    
    @State private var result: Bool = false
    @State private var endGame: Bool = false
    
    @State private var roundsPlayed: Int = 0
    @State private var roundsWon: Int = 0
    
    @State private var alertMessage: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .blue, .indigo, .black],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
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
                        .font(.system(size: 21).bold())
                    Text("\(items[randomSelection])")
                        .font(.system(size: 75))
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .border(Color.white)
                }
                
                Spacer()
                
                VStack {
                    Text("Your objective is to:")
                        .font(.system(size: 25).bold())
                    Text("\(choices[randomSelection])")
                        .font(.largeTitle.bold())
                        .font(.system(size: 75))
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .border(Color.white)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack (spacing: 30) {
                    Text("Make Your Selection!")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    HStack(spacing: 20) {
                        Button {
                            print("Click")
                            selection("🪨")
                        } label: {
                            Text("🪨")
                                .font(.system(size: 100))
                        }
                        
                        Button {
                            print("Click")
                            selection("📄")
                        } label: {
                            Text("📄")
                                .font(.system(size: 100))
                        }
                        
                        Button {
                            print("Click")
                            selection("✂️")
                        } label: {
                            Text("✂️")
                                .font(.system(size: 100))
                        }
                    }
                    Text("Score: \(roundsWon) / \(roundsPlayed)")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    
                }
                Spacer()
            }
            .padding()
            
            
        }
        .alert("Result", isPresented: $result) {
            Button("Continue", action: newRound)
        } message: {
            Text(alertMessage)
        }
        .alert("End of Game", isPresented: $endGame) {
            Button("Restart") {
                roundsPlayed = 0
                roundsWon = 0
                newRound()
            }
        } message: {
            Text(alertMessage)
        }
        
    }
    
    func selection(_ playerChoice: String) {
        let objective = choices[randomSelection]
        let computerChoice = items[randomSelection]
        print("The computer chose: \(computerChoice)")
        print("Your objective was: \(objective)")
        
        roundsPlayed += 1
        
        if objective == "Win" {
            // win
            
            if computerChoice == "🪨" && playerChoice == "📄" {
                roundsWon += 1
                alertMessage = "You won! \(roundsWon) / \(roundsPlayed)"
            } else if computerChoice == "📄" && playerChoice == "✂️" {
                roundsWon += 1
                alertMessage = "You won! \(roundsWon) / \(roundsPlayed)"
            } else if computerChoice == "✂️" && playerChoice == "🪨" {
                roundsWon += 1
                alertMessage = "You won! \(roundsWon) / \(roundsPlayed)"
            } else {
                alertMessage = "You lost! \(roundsWon) / \(roundsPlayed)"
            }
        } else if objective == "Lose" {
            if computerChoice == "📄" && playerChoice == "🪨" {
                roundsWon += 1
                alertMessage = "You won! \(roundsWon) / \(roundsPlayed)"
            } else if computerChoice == "✂️" && playerChoice == "📄" {
                roundsWon += 1
                alertMessage = "You won! \(roundsWon) / \(roundsPlayed)"
            } else if computerChoice == "🪨" && playerChoice == "✂️" {
                roundsWon += 1
                alertMessage = "You won! \(roundsWon) / \(roundsPlayed)"
            } else {
                alertMessage = "You lost! \(roundsWon) / \(roundsPlayed)"
            }
        } else {
            if playerChoice == computerChoice {
                roundsWon += 1
                alertMessage = "You won! \(roundsWon) / \(roundsPlayed)"
            } else {
                alertMessage = "You lost! \(roundsWon) / \(roundsPlayed)"
            }
        }
        
        if roundsPlayed < 10 {
            result = true
        } else {
            endGame = true
        }
    }
    
    func newRound() {
        items.shuffle()
        choices.shuffle()
        randomSelection = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
