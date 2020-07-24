//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by Nathan DeGoey on 2020-06-17.
//  Copyright © 2020 Nathan DeGoey. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    
    @IBOutlet weak var backImageView: UIImageView!
    
    // First this will be nil
    var card:Card?
    
    func configureCell(card: Card) {
        
        // Keep track of this card this cell represents
        self.card = card
        
        // Set the front image view to the image that represents that card
        frontImageView.image = UIImage(named: card.imageName)
        
        
        // Reset the state of the cell by checking the flipped status of the card and then showing the front or the back imageview accordingly
        
        if card.isMatched == true {
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
        }
        else {
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        
        
        if card.isFlipped == true {
            // show the front image view
            flipUp(speed: 0)
        }
        else {
            // show the back image view
            flipDown(speed: 0, delay: 0)
        }
    }
    
    // Flip from the back image view to the front image view
    // Gives the speed a default value
    func flipUp(speed: TimeInterval = 0.3) {
        
        // Flip up animation (use .transition for lots of helpful options
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        
        // Set the status of the card
        card?.isFlipped = true
        
    }
    
    // flip from the front image view to the back image view
    func flipDown(speed: TimeInterval = 0.3, delay:TimeInterval = 0.5) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        }
        
        // Set the status of the card
        card?.isFlipped = false

    }
    
    func remove() {
        
        // Make the image views invisible
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            
            // Fading the opacity of the image from 1 to 0
            self.frontImageView.alpha = 0
            
        }, completion: nil)
        
    }
}
