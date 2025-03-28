//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    
    // The user's guess
    @State var userGuess = ""
    
    // The outcome
    @State var currentOutcome: Outcome = .undetermined
    
    // An array to store results of user's guesses
    @State var history: [Result] = [] // empty array
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            HStack {
                // Allow the user to input their guess
                TextField("Enter The Name of The Item", text : $userGuess)
                
                // Show Outcome (shows the string attached to each case in the enumeration
                Text(currentOutcome.rawValue)
                
                
            }
            
            // Make it possible to check guess
            Button {
                checkGuess()
            } label: {
                Text("Submit")
            }
            
        // Pick new word
            Button {
                newWord()
            } label: {
                Text("New Word")
            }
        }
        
    }
    
    func checkGuess() {
        
        if userGuess == currentItem.word {
            print("Correct")
            currentOutcome = .correct
        } else {
            print("Incorrect")
            currentOutcome = .incorrect
        }
        
    }
    
    func newWord() {
       
       // Add the current result to the history
        history.insert(
            Result(
                item: currentItem,
                guessProvided: userGuess,
                outcome: currentOutcome
            ),
            at: 0
        )
        
        // DEBUG: What is in the history array?
        print(history)
        
        // Reset for a new questions
        currentItem = itemsToSpell.randomElement()!
        userGuess = ""
        currentOutcome = .undetermined
    }
}

#Preview {
    QuizView()
}
