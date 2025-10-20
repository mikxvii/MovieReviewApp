import Foundation
import FirebaseFirestore
internal import Combine

// TODO: Make MovieManager conform to ObservableObject protocol
// This allows SwiftUI views to watch this object for changes
class MovieManager: _______ {
    
    // TODO: Add @Published property wrapper to the movies array
    // @Published automatically notifies SwiftUI when movies changes
    // When we add/delete movies, views re-render automatically!
    _______ var movies: [Movie] = []
    
    // TODO: Create a private property to store Firestore database instance
    // Use: Firestore.firestore() to get the database
    // "private" means only this class can access it
    _______ let db = _______
    
    // TODO: Create an initializer that calls fetchMovies()
    // This runs when MovieManager is first created
    init() {
        _______()  // Start listening to Firebase immediately
    }
    
    // READ - Real-time listener (auto-updates when Firebase changes)
    func fetchMovies() {
        
        // TODO: Access the "movies" collection in Firebase
        // Use db.collection("collectionName")
        db._______("movies")
        
            // TODO: Sort by "year" field, newest first
            // Use .order(by: "fieldName", descending: true)
            // descending: true = newest first (2024, 2023, 2022...)
            .order(by: _______, descending: _______)
            
            // TODO: Add a snapshot listener for real-time updates
            // This isn't a one-time fetch! It runs EVERY TIME data changes
            // Use .addSnapshotListener { snapshot, error in ... }
            .addSnapshotListener { snapshot, error in
                
                // TODO: Use guard let to safely get documents from snapshot
                // If snapshot is nil or has no documents, exit early
                guard let documents = snapshot?._______ else { return }
                
                // TODO: Use compactMap to convert Firebase documents to Movie objects
                // compactMap transforms AND removes nil values automatically
                // For each document, try to create a Movie
                // If Movie(dictionary:) returns nil (bad data), it's filtered out
                self.movies = documents._______{ doc in
                    
                    // TODO: Get the dictionary from this document and create a Movie
                    // Use doc.data() to get [String: Any]
                    // Pass it to Movie's failable initializer
                    Movie(dictionary: doc._______())
                }
                
                print("✅ Loaded \(self.movies.count) movies")
            }
    }
    
    // CREATE - Add new movie to Firebase
    func addMovie(_ movie: Movie) {
        
        // TODO: Access the "movies" collection
        db.collection(_______)
        
            // TODO: Create/access a document with the movie's ID
            // Use .document(movie.id.uuidString)
            // We use our own ID (not Firebase auto-generated)
            .document(movie.id._______)
            
            // TODO: Save the movie's dictionary to Firebase
            // Use .setData(movie.dictionary) { error in ... }
            .setData(movie._______) { error in
                
                if let error = error {
                    print("❌ Error: \(error.localizedDescription)")
                } else {
                    print("✅ Movie added successfully!")
                }
            }
    }
    
    // DELETE - Remove movie from Firebase
    func deleteMovie(_ movie: Movie) {
        
        // TODO: Access "movies" collection, find the document, and delete it
        // Use db.collection("movies").document(id).delete()
        db.collection("movies")
            .document(movie.id.uuidString)
            ._______()  // Hint: method name that removes the document
    }
}
