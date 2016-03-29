//
//  Card.swift
//  WorkoutWatch
//
//  Created by John Heher on 01/13/2016.
//  Copyright © 2016 John Heher. All rights reserved.
//

import WatchKit

class Card {
    let suit: String
    let number: String
    
    init(suit: String, number: String) {
        self.suit = suit
        self.number = number
    }
    
    convenience init(dictionary: [String: String]) {
        let suit = dictionary["suit"]!
        let number = dictionary["number"]!
        self.init(suit: suit, number: number)
    }
}

func getCardList() -> [Card] {
    var cards = [Card]()
    if let path = NSBundle.mainBundle().pathForResource("Cards", ofType: "json"), let data = NSData(contentsOfFile: path) {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [Dictionary<String, String>]
            for dict in json {
                let card = Card(dictionary: dict)
                cards.append(card)
            }
        } catch {
            print(error)
        }
    }
    return cards
}