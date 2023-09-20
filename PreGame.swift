//
//  PreGame.swift
//  Hangman
//
//  Created by Taylor Parnell on 7/25/23.
//

import SwiftUI

struct PreGame: View {
    @Binding var isGameStarted: Bool
    @Binding var word: String
    
    
    var body: some View {
        VStack {
            Text("Hangman")
                .font(.largeTitle)
            
            if !isGameStarted {
                TextField("Enter a word", text: $word)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(width: 300, height: 100, alignment: .center)
                
                Button(action: {
                    startGame()
                }) {
                    Text("Start Game")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
        }
    }
    func startGame() {
        word = word.replacingOccurrences(of: " ", with: "").uppercased()
        isGameStarted = true
    }
}

