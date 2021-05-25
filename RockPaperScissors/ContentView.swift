//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Waihon Yew on 26/05/2021.
//

import SwiftUI

struct ContentView: View {
  static let rock = "Rock"
  static let paper = "Paper"
  static let scissors = "Scissors"
  static let moves = [rock, paper, scissors]
  static let winners = [rock: paper, paper: scissors, scissors: rock]
  static let losers = [rock: scissors, paper: rock, scissors: paper]
  static let maximumRounds = 10
  
  @State private var appMove = Int.random(in: 0 ..< moves.count)
  @State private var shouldWin = Bool.random()
  @State private var score = 0
  @State private var playerMove = 0
  @State private var currentRound = 1
  
  var body: some View {
    VStack {
      Text("Player's Score: \(score)")
      Text("App's Move: \(ContentView.moves[appMove])")
      Text("Player Should \(shouldWin ? "Win" : "Lose")")
      Text("Player's Move:")
      ForEach(0 ..< ContentView.moves.count) { number in
        Button(ContentView.moves[number]) {
          playerMove = number
          
          if shouldWin {
            if ContentView.winners[ContentView.moves[appMove]] == ContentView.moves[playerMove] {
              score += 1
            } else {
              score -= 1
            }
          } else {
            if ContentView.losers[ContentView.moves[appMove]] == ContentView.moves[playerMove] {
              score += 1
            } else {
              score -= 1
            }
          }
          
          nextRound()
        }
        .disabled(currentRound > ContentView.maximumRounds)
      }
      Spacer()
    }
  }
  
  func nextRound() {
    currentRound += 1
    if currentRound <= ContentView.maximumRounds {
      appMove = Int.random(in: 0 ..< ContentView.moves.count)
      shouldWin = Bool.random()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
