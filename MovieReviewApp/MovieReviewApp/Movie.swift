//
//  Movie.swift
//  mdb-ios-training
//
//  Created by Michael Guerrero on 10/19/25.
//

import Foundation

// TODO: Make Movie conform to Identifiable protocol
// This allows SwiftUI to track each movie by its unique id
struct Movie: _______ {
    
    // TODO: Add an id property of type UUID
    // UUID() automatically generates a unique identifier
    var id = _______
    
    // TODO: Add properties for movie data
    // Use String for text, Int for whole numbers, Double for decimals
    var title: _______
    var director: _______
    var year: _______        // Hint: Use Int (no decimals needed for year)
    var rating: _______      // Hint: Use Double (need decimals like 4.5)
    var review: _______
    var posterEmoji: _______
    
    // TODO: Create a computed property called "dictionary"
    // This converts our Movie to [String: Any] format for Firebase
    // Computed properties don't store values, they calculate them on-the-fly
    var dictionary: [_______: _______] {
        return [
            "id": id.uuidString,
            "title": _______,           // Put the title property here
            "director": _______,        // Put the director property here
            "year": _______,            // Put the year property here
            "rating": _______,          // Put the rating property here
            "review": _______,          // Put the review property here
            "posterEmoji": _______      // Put the posterEmoji property here
        ]
    }
    
    // TODO: Create an initializer for making new movies
    // This is called when we create: Movie(title: "Inception", director: "Nolan", ...)
    // Notice: id has a default value (id: UUID = UUID()), so we don't need to pass it
    init(id: _______ = UUID(), title: String, director: String,
         year: Int, rating: Double, review: String, posterEmoji: String) {
        
        // TODO: Assign all parameters to properties using self.propertyName = parameterName
        // "self" means "this Movie instance"
        self.id = _______
        self.title = _______
        self.director = _______
        self.year = _______
        self.rating = _______
        self.review = _______
        self.posterEmoji = _______
    }
    
    // TODO: Create a failable initializer for reading from Firebase
    // The "?" means this can return nil if the data is invalid
    // Firebase gives us [String: Any], we need to safely convert it to a Movie
    init?(dictionary: [String: Any]) {
        
        // TODO: Use guard let to safely unwrap and type-cast all values
        // "as? String" means "try to convert this to a String, might fail"
        // If ANY value is missing or wrong type, return nil (don't create invalid Movie)
        guard let idString = dictionary["id"] as? _______,
              let id = UUID(uuidString: idString),
              let title = dictionary["title"] as? _______,
              let director = dictionary["director"] as? _______,
              let year = dictionary["year"] as? _______,        // Must be Int!
              let rating = dictionary["rating"] as? _______,    // Must be Double!
              let review = dictionary["review"] as? _______,
              let posterEmoji = dictionary["posterEmoji"] as? _______ else {
            return nil  // Data is bad, don't create the Movie
        }
        
        // TODO: All values are valid! Assign them to properties
        self.id = _______
        self.title = _______
        self.director = _______
        self.year = _______
        self.rating = _______
        self.review = _______
        self.posterEmoji = _______
    }
}
