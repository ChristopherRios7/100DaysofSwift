//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Christopher Rios on 9/9/23.
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊🏽","✋🏽","✌🏽"]
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingResults = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("The computer has played...")
                .font(.headline)
            Text(moves[computerChoice])
                .font(.system(size:200))
            if shouldWin {
                Text("Which One Wins?")
                    .foregroundStyle(.green)
                    .font(.title)
            } else {
                Text("Which One Loses?")
                    .foregroundStyle(.red)
                    .font(.title)
            }
            HStack{
                ForEach(0..<3){ number in
                    Button(moves[number]){
                    play(choice: number)
                    }
                    .font(.system(size: 80))
                    
                }
            }
            Spacer()
            Text("Score: \(score)")
                .font(.subheadline)
            Spacer()
        }
        .alert("Game Over", isPresented: $showingResults){
            Button("Play again?", action: reset)
        }message: {
            Text("Your score is: \(score).")
        }
    }
    
    
    func play(choice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningMoves[computerChoice]
        } else {
            didWin = winningMoves[choice] == computerChoice
        }
        
        if didWin {
            score += 1
        } else {
            score -= 1
        }
        
        if questionCount == 10 {
            showingResults = true
        } else {
            computerChoice = Int.random(in: 0..<3)
            shouldWin.toggle()
            questionCount += 1
        }
    }
    func reset() {
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        questionCount = 0
        score = 0
    }
}
#Preview {
    ContentView()
}
