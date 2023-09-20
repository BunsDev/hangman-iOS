//
//  GameLost.swift
//  Hangman
//
//  Created by Taylor Parnell on 7/25/23.
//

import SwiftUI

struct GameLost: View {
    @Binding var isGameStarted: Bool
    @Binding var isGameWon: Bool
    @Binding var isGameLost: Bool
    @Binding var word: String
    @Binding var incorrectGuesses: [Character]
    @Binding var guessedLetters: Set<Character>
    
    
    var body: some View {
        VStack {
            Text("Game Over!")
                .font(.largeTitle)
                .padding()
            
            Text("The word was: \(word)")
                .font(.headline)
                .padding(.bottom)
            Button("Restart", action: restartGame)
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
