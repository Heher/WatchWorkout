//
//  WatchWorkoutInterfaceController.swift
//  WorkoutWatch
//
//  Created by John Heher on 1/14/16.
//  Copyright © 2016 John Heher. All rights reserved.
//

import WatchKit
import Foundation


class WatchWorkoutInterfaceController: WKInterfaceController {
    
    @IBOutlet var suitLabel: WKInterfaceLabel!
    @IBOutlet var numberLabel: WKInterfaceLabel!
    @IBOutlet var indexLabel: WKInterfaceLabel!
    @IBOutlet var newCardButton: WKInterfaceButton!
    @IBOutlet var remainingLabel: WKInterfaceLabel!
    
    @IBAction func newCard(sender: AnyObject?) {
        pickCard()
    }
    
    var cardList = getCardList()
    var usedCards = [Card]()
    
    func pickCard() {
        if cardList.count > 0 {
            let chosenCardNum = Int(arc4random_uniform(UInt32(cardList.count)))
            let chosenCard = cardList[chosenCardNum]
            let suit = chosenCard.suit
            let number = chosenCard.number
            suitLabel.setText(suit)
            numberLabel.setText(number)
            indexLabel.setText(String(chosenCardNum))
            usedCards.append(chosenCard)
            cardList.removeAtIndex(chosenCardNum)
            remainingLabel.setText(String(cardList.count))
            if cardList.count == 0 {
                newCardButton.setTitle("No New Cards")
            }
        } else {
            newCardButton.setTitle("No New Cards")
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pickCard()
    }

}
