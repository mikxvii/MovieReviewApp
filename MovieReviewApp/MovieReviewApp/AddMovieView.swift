//
//  AddMovieView.swift
//  mdb-ios-training
//
//  Created by Michael Guerrero on 10/19/25.
//
import SwiftUI

struct AddMovieView: View {
    
    // TODO: Add @Environment property to get the dismiss function
    // @Environment reads values from SwiftUI's environment
    // \.dismiss gives us a function to close this sheet
    @Environment(\._______) var dismiss
    
    // TODO: Add @ObservedObject property for the manager
    // Use @ObservedObject (NOT @StateObject) because we're RECEIVING it from parent
    // ContentView creates it, AddMovieView just observes it
    _______ var manager: MovieManager
    
    // TODO: Add @State properties for each form field
    // These track what the user types in the form
    // Start with empty strings or default values
    _______ private var title = ""
    _______ private var director = ""
    _______ private var year = ""          // String! (will convert to Int later)
    _______ private var rating = 3.0       // Start at 3 stars
    _______ private var review = ""
    _______ private var posterEmoji = "🎬" // Default emoji
    
    let emojis = ["🎬", "🎭", "🚀", "🌟", "💫", "🔥", "🌈", "🎸", "🎨"]
    
    var body: some View {
        
        // TODO: Wrap everything in NavigationView
        // Even though this is a modal sheet, it needs its own NavigationView
        // This provides the navigation bar with title and buttons
        NavigationView {
            
            // TODO: Create a Form for input fields
            // Form automatically styles fields for iOS
            _______ {
                
                // TODO: Add a Section with header "Movie Details"
                Section(_______) {
                    
                    // TODO: Add TextField for title
                    // Bind to $title ($ creates two-way binding)
                    // User types → title updates → TextField shows it
                    TextField("Title", text: _______title)
                    
                    // TODO: Add TextField for director
                    // Bind to $director
                    TextField("Director", text: $_______)
                    
                    // TODO: Add TextField for year
                    // Bind to $year
                    // Add .keyboardType(.numberPad) to show number keyboard
                    TextField("Year", text: $_______)
                        .keyboardType(._______)
                }
                
                // TODO: Add a Section with header "Poster"
                Section("Poster") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            
                            // TODO: Loop through the emojis array
                            // Use ForEach with id: \.self
                            // "\.self" means use the string itself as the ID
                            ForEach(emojis, id: \._______) { emoji in
                                Text(emoji)
                                    .font(.system(size: 40))
                                    .padding(10)
                                    
                                    // TODO: Add conditional background color
                                    // If this emoji is selected: blue background
                                    // If not selected: clear (no background)
                                    // Use: posterEmoji == emoji ? Color.blue.opacity(0.2) : Color.clear
                                    .background(posterEmoji == emoji ?
                                        Color.blue.opacity(0.2) : Color._______)
                                    .cornerRadius(10)
                                    
                                    // TODO: Add .onTapGesture to set posterEmoji when tapped
                                    .onTapGesture {
                                        posterEmoji = _______
                                    }
                            }
                        }
                    }
                }
                
                // TODO: Add a Section with header "Rating"
                Section("Rating") {
                    HStack {
                        
                        // TODO: Loop from 1 to 5 to create 5 stars
                        // Use 1...5 (includes both 1 and 5)
                        ForEach(_______..._______, id: \.self) { star in
                            
                            // TODO: Show filled or empty star based on rating
                            // Use ternary: star <= Int(rating) ? "star.fill" : "star"
                            // Filled if star number ≤ rating, empty otherwise
                            Image(systemName: star <= Int(rating) ?
                                _______ : _______)
                                .foregroundColor(.yellow)
                                .font(.title2)
                                
                                // TODO: Add .onTapGesture to set rating when star is tapped
                                // Convert star (Int) to Double for rating
                                .onTapGesture {
                                    rating = Double(_______)
                                }
                        }
                    }
                }
                
                // TODO: Add a Section with header "Review"
                Section("Review") {
                    
                    // TODO: Add TextEditor for multi-line review text
                    // Bind to $review
                    // Set height to 100 points using .frame(height: 100)
                    TextEditor(text: $_______)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Add Movie")
            
            // TODO: Add toolbar with Cancel and Save buttons
            .toolbar {
                
                // Cancel button (left side of navigation bar)
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        // TODO: Call dismiss() to close the sheet
                        _______()
                    }
                }
                
                // Save button (right side of navigation bar)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // TODO: Call the saveMovie() function
                        _______()
                    }
                        // TODO: Disable button if any required field is empty
                        // Use: title.isEmpty || director.isEmpty || year.isEmpty
                        .disabled(title._______ || director.isEmpty || year._______)
                        .buttonStyle(.glassProminent)
                }
            }
        }
    }
    
    // TODO: Implement the saveMovie function
    func saveMovie() {
        
        // TODO: Use guard let to safely convert year String to Int
        // Int(year) tries to convert "2024" → 2024
        // Returns nil if conversion fails (e.g., "abc" → nil)
        // If it fails, return early (don't save invalid data)
        guard let yearInt = Int(_______) else { return }
        
        // TODO: Create a new Movie object with the form data
        let movie = Movie(
            title: _______,
            director: _______,
            year: _______,         // Use yearInt (the converted Int)
            rating: _______,
            review: _______,
            posterEmoji: _______
        )
        
        // TODO: Call manager.addMovie to save to Firebase
        // Manager handles the Firebase logic
        // Real-time listener will automatically update ContentView's list!
        manager._______(movie)
        
        // TODO: Dismiss the sheet
        // User returns to ContentView and sees their new movie!
        _______()
    }
}
