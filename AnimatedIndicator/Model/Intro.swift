//
//  Intro.swift
//  Intro
//
//  Created by jyrnan on 2021/9/11.
//

import SwiftUI

// Intro Model And Sample Intros...
struct Intro: Identifiable{
    var id = UUID().uuidString
    var image: String
    var title: String
    var descriptions: String
    var color: Color
}

var intros: [Intro] = [
    
    Intro(image: "food2", title: "Choose your favorite menu", descriptions: "But they are not the inconvenience that our pleasure", color: Color.blue),
    Intro(image: "food1", title: "Choose your favorite menu", descriptions: "But they are not the inconvenience that our pleasure", color: Color.blue),
    Intro(image: "food3", title: "Choose your favorite menu", descriptions: "But they are not the inconvenience that our pleasure", color: Color.blue)
]
