//
//  CardDataModel.swift
//  Flashcards
//
//  Created by Jonathan Heinzman on 6/17/26.
//

import Foundation

struct Card {
    let question: String
    let answer: String
}

let flashcards: [Card] = [
    Card(question: "What is the best outdoor hobby in Idaho?", answer: "Fishing 🎣"),
    Card(question: "What is the most popular fish to catch in Idaho?", answer: "Trout"),
    Card(question: "What is a popular bait to use for trout?", answer: "The Trout Magnet")
]
