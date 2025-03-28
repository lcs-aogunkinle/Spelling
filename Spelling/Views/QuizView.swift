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
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            
            TextField("Enter The Name of The Item", text : $userGuess)
            
            // Make it possible to check guess
            Button {
                checkGuess()
            } label: {
                Text("Submit")
            }
            
        }
        
    }
    
    func checkGuess() {
        
        if userGuess == currentItem.word {
            print("Correct")
        } else {
            print("Incorrect")
        }
        
    }
}

#Preview {
    QuizView()
}
