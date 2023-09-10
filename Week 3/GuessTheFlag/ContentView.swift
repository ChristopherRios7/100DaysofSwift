//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Christopher Rios on 9/2/23.
//

import SwiftUI

struct FlagImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.blue)
    }
}

extension View {
    func title() -> some View {
        modifier(TitleModifier())
    }
}
struct ContentView: View {
    @State private var showingScore = false
    @State private var isGameOver = false
    
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia","France", "Germany", "Ireland","Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var userScore = 0
    @State private var questionCount = 1
    
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    //.font(.largeTitle.weight(.bold))
                    //.foregroundColor(.white)
                    .title()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(name: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("Question: \(questionCount)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert(scoreTitle, isPresented: $isGameOver){
            Button("Reset", role: .destructive, action: reset)
        } message: {
            Text("Your final score: \(userScore)")
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        }
        else {
            scoreTitle = "Wrong. That's the flag of \(countries[number])."
            userScore -= 1
        }
        showingScore = true
    }
    func askQuestion() {
        if (questionCount != 8){
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            questionCount += 1
        } else {
            isGameOver = true
        }
    }
    func reset() {
        userScore = 0
        questionCount = 0
    }
}

#Preview {
    ContentView()
}
