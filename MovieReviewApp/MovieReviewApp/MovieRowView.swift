//
//  MovieRowView.swift
//  mdb-ios-training
//
//  Created by Michael Guerrero on 10/19/25.
//

import SwiftUI

// TODO: Make MovieRowView conform to the View protocol
// All SwiftUI views must conform to View
struct MovieRowView: _______ {
    
    // TODO: Add a property to hold the movie data
    // Use "let" because we're only displaying data, not modifying it
    // The parent view owns the data, we just show it
    _______ movie: Movie
    
    // TODO: Implement the required "body" property
    // body describes what this view looks like
    // "some View" means it returns any type of SwiftUI view
    var body: some View {
        
        // TODO: Create an HStack (Horizontal Stack) with 15 points of spacing
        // HStack arranges items left-to-right (horizontal row)
        _______(spacing: 15) {
            
            // TODO: Display the poster emoji as large text
            // Use Text(movie.posterEmoji) and .font(.system(size: 50))
            Text(movie.posterEmoji)
                .font(.system(size: _______))
            
            // TODO: Create a VStack (Vertical Stack) for movie details
            // VStack arranges items top-to-bottom (vertical column)
            // Make it left-aligned with .leading
            // Add 5 points of spacing between items
            VStack(alignment: ._______, spacing: 5) {
                
                // TODO: Display the movie title with .headline font style
                Text(movie._______)
                    .font(._______)
                
                // TODO: Display the director name in gray color
                // Use .foregroundColor(.gray)
                Text(movie.director)
                    .foregroundColor(._______)
                
                // TODO: Create an HStack for year and rating stars
                HStack {
                    
                    // TODO: Display the year (convert Int to String first!)
                    // Use String(movie.year) to convert
                    // Add .font(.caption2) for small text
                    Text(String(movie._______))
                        .font(.caption2)
                    
                    // TODO: Add a Spacer to push content apart
                    // Spacer takes up all available space
                    // This pushes year left and stars right
                    _______()
                    
                    // TODO: Create 5 stars using ForEach
                    // Loop from 0 to 4 (that's 5 stars: 0, 1, 2, 3, 4)
                    // Use 0..<5 (0 up to but not including 5)
                    ForEach(0..<_______) { i in
                        
                        // TODO: Show filled or empty star based on rating
                        // Use ternary operator: condition ? "star.fill" : "star"
                        // Condition: i < Int(movie.rating)
                        // If true: show filled star ("star.fill")
                        // If false: show empty star ("star")
                        Image(systemName: i < Int(movie.rating) ? _______ : _______)
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
    }
}
