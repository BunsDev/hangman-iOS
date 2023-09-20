import SwiftUI

struct ContentView: View {
    
    @State private var isGameStarted = false
    @State private var isGameWon = false
    @State private var isGameLost = false
    @State private var word = ""
    
    var body: some View {
        if !isGameStarted {
            PreGame(isGameStarted: $isGameStarted, word: $word)
        }
        else {
            MainGame(isGameStarted: $isGameStarted, isGameWon: $isGameWon, isGameLost: $isGameLost, word: $word)
        }
    }
}
