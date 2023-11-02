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
    @State private var selectedFlag = -1
    @State private var showingScore = false
    @State private var showingResults = false
    
    @State private var scoreTitle = ""
    
    @State private var countries = allCountries.shuffled()
    static let allCountries = ["Estonia","France", "Germany", "Ireland","Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var userScore = 0
    @State private var questionCount = 1
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
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
                        }
                        label: {
                            FlagImage(name: countries[number])
                        }
                        .rotation3DEffect(.degrees(selectedFlag == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(selectedFlag == -1 || selectedFlag == number ? 1.0: 0.25)
                        .scaleEffect(selectedFlag == -1 || selectedFlag == number ? 1.0: 0.75)
                        //.saturation(selectedFlag == -1 || selectedFlag == number ? 1.0: 0)
                        .blur(radius: selectedFlag == -1 || selectedFlag == number ? 0 : 3)
                        .animation(.default, value: selectedFlag)
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
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
        .alert(scoreTitle, isPresented: $showingResults){
            Button("Reset", role: .destructive, action: reset)
        } message: {
            Text("Your final score: \(userScore)")
        }
    }
    func flagTapped(_ number: Int){
        selectedFlag = number
        
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        }
        else {
            let needsThe = ["US, UK"]
            let theirAnswer = countries[number]
            if needsThe.contains(theirAnswer){
                scoreTitle = "Wrong. That's the flag of \(countries[number])."
            } else {
                scoreTitle = "Wrong. That's the flag of \(countries[number])."
            }
            if userScore > 0 {
                userScore -= 1
            }
        }
        if questionCount == 8 {
            showingResults = true
        } else{
            showingScore = true
        }
    }
    func askQuestion() {
            countries.remove(at: correctAnswer)
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            questionCount += 1
            selectedFlag = -1
    }
    func reset() {
        userScore = 0
        questionCount = 0
        countries = Self.allCountries
        askQuestion()
    }
}

#Preview {
    ContentView()
}
