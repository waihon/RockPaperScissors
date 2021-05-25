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
  
  @State private var currentChoice = Int.random(in: 0 ..< moves.count)
  @State private var shouldWin = Bool.random()
  @State private var score = 0
  
  var body: some View {
    Text("Hello, world!")
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
