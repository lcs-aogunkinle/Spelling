//
//  Result.Swift
//  Spelling
//
//  Created by Ayodeji Ogunkinle on 2025-03-28.
//

import Foundation

struct Result: Identifiable {
    
    let id = UUID() // unique identifier
    
    // The item the user was randomly given
    let item: Item
    
    // What the user guessed
    let guessProvided: String
    
    // Was the user correct or not ?
    let outcome: Outcome 
    
}
