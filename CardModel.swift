//
//  CardModel.swift
//  MatchApp
//
//  Created by Nathan DeGoey on 2020-06-17.
//  Copyright © 2020 Nathan DeGoey. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        // Declare an empty array to store numbers that we've generated
        var generatedNumbers = [Int]()
        
        // Declare an empty array
        var generatedCards = [Card]()
        
        // Randomly generate 8 pairs of cards
        while generatedNumbers.count < 8 {
            
            // Generate a random number
            let randNum = Int.random(in: 1...13)
            
            if !generatedNumbers.contains(randNum) {
                
                // Log the Number
                print(randNum)
                
                // Create two new Card objects
                let cardOne = Card()
                let cardTwo = Card()
                
                // Set their image names
                cardOne.imageName = "card\(randNum)"
                cardTwo.imageName = "card\(randNum)"
                
                // Add them to the array
                generatedCards += [cardOne, cardTwo]
                
                // Add this number to the list of generated numbers
                generatedNumbers.append(randNum)
            }
        }
        
        // Randomize the cards within the array
        generatedCards.shuffle()
        print("This is the count: \(generatedCards.count)")
        
        // Return the array
        return generatedCards
    }
}
