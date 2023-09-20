//
//  MainGame.swift
//  Hangman
//
//  Created by Taylor Parnell on 7/25/23.
//

import SwiftUI
//MARK: - Main Game UI

struct MainGame: View {
    @Binding var isGameStarted: Bool
    @Binding var isGameWon: Bool
    @Binding var isGameLost: Bool
    @Binding var word: String
    @State private var isGameOver = false
    @State private var guessedLetters: Set<Character> = []
    @State private var incorrectGuesses: [Character] = []
    
    let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    var body: some View {
        VStack {
            if !isGameOver {
                HStack {
                    ForEach(Array(word), id: \.self) { letter in
                        Text(displayLetter(letter))
                            .font(.largeTitle)
                            .padding()
                    }
                }
                .padding(.bottom)
                
                VStack {
                    Text("Incorrect Guesses:")
                        .font(.headline)
                        .padding(.top)
                    
                    HStack {
                        ForEach(incorrectGuesses, id: \.self) { letter in
                            Text(String(letter))
                                .font(.title)
                                .padding(.horizontal, 2) // Adjust the horizontal padding
                        }
                    }
                }
                .padding(.bottom, 20) // Add some padding to separate the grid from incorrect guesses
                
                Text("Guess a letter:")
                    .font(.headline)
                
                LazyVGrid(columns: createGrid()) {
                    ForEach(letters, id: \.self) { letter in
                        Button(action: {
                            makeGuess(letter)
                        }) {
                            Circle()
                                .frame(width: 60, height: 60) // Adjust the size as needed
                                .foregroundColor(Color.blue)
                                .overlay(
                                    Text(String(letter))
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .opacity(self.guessedLetters.contains(letter) ? 0.5 : 1.0)
                                        .padding(.all, 10)
                                )
                                .opacity(self.guessedLetters.contains(letter) ? 0.5 : 1.0)
                                .disabled(self.guessedLetters.contains(letter))
                        }
                    }
                }
            } else {
                if isGameWon {
                    GameWon(isGameStarted: $isGameStarted, isGameWon: $isGameWon, isGameLost: $isGameLost, word: $word, incorrectGuesses: $incorrectGuesses, guessedLetters: $guessedLetters)
                }
                else {
                    GameLost(isGameStarted: $isGameStarted, isGameWon: $isGameWon, isGameLost: $isGameLost, word: $word, incorrectGuesses: $incorrectGuesses, guessedLetters: $guessedLetters)
                }
            }
        }
    }
    
    
    
    //MARK: - Game Functions
    
    
        func createGrid() -> [GridItem] {
            let columns = [
                GridItem(.adaptive(minimum: 60))
            ]
            return columns
        }
        
        func makeGuess(_ letter: Character) {
            let lowercaseWord = word.lowercased()
            let lowercaseLetter = String(letter).lowercased()
            
            guessedLetters.insert(letter)
            
            if !lowercaseWord.contains(lowercaseLetter) {
                incorrectGuesses.append(letter)
            }
            if incorrectGuesses.count > 6 {
                isGameLost = true
                isGameOver = true
            }
            isGameWon = isWordGuessed()
            if isGameWon {
                isGameOver = true
            }
        }
        func isWordGuessed() -> Bool {
            let uniqueLetters = Set(word.filter { !$0.isWhitespace })
            return uniqueLetters.isSubset(of: guessedLetters)
        }
        func displayLetter(_ letter: Character) -> String {
            if guessedLetters.contains(letter) || letter.isWhitespace {
                return String(letter)
            } else if letter.isLetter {
                let lowercaseLetter = letter.lowercased().first!
                if guessedLetters.contains(where: { String($0).lowercased().first! == lowercaseLetter }) || guessedLetters.contains(where: { String($0) == String(letter).lowercased() }) {
                    return String(letter)
                } else {
                    return "_"
                }
            } else {
                return String(letter)
            }
        }
    }
