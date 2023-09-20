//
//  GameWon.swift
//  Hangman
//
//  Created by Taylor Parnell on 7/25/23.
//

import SwiftUI

struct GameWon: View {
    @Binding var isGameStarted: Bool
    @Binding var isGameWon: Bool
    @Binding var isGameLost: Bool
    @Binding var word: String
    @Binding var incorrectGuesses: [Character]
    @Binding var guessedLetters: Set<Character>
    
    
    
    var body: some View {
        VStack {
            Text("You Won!")
            Text("The word was: \(word)")
            Button(action: {
                 restartGame()
            }) {
                Text ("Restart")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }

    }
    
    
    func restartGame() {
        guessedLetters = []
        incorrectGuesses = []
        word = ""
        isGameStarted = false
        isGameWon = false
    }
}

