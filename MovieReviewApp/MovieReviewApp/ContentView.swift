import SwiftUI
import SwiftData

struct ContentView: View {
    
    // TODO: Add @State property for showing/hiding the add movie sheet
    // @State creates SwiftUI-managed state
    // When showingAdd changes, the view re-renders automatically
    // private = only this view can modify it
    _______ private var showingAdd = false
    
    // TODO: Add @StateObject to create and own the MovieManager
    // @StateObject creates AND keeps the object alive
    // Use @StateObject when YOU create the object (not receiving it from parent)
    _______ private var manager = MovieManager()
    
    var body: some View {
        
        // TODO: Wrap everything in a NavigationView
        // NavigationView provides the navigation bar at the top
        // Required for .navigationTitle and .toolbar modifiers
        _______ {
            
            // TODO: Create a List to display movies
            // List creates a scrollable list of rows
            _______ {
                
                // TODO: Use ForEach to loop through manager.movies
                // ForEach creates a view for each movie
                // Movie conforms to Identifiable, so SwiftUI tracks by id
                // The closure receives each movie as "movie"
                ForEach(manager.movies) { movie in
                    
                    // TODO: Create a MovieRowView for each movie
                    // Pass the movie data to the row view
                    MovieRowView(movie: _______)
                }
                
                // TODO: Add .onDelete modifier to enable swipe-to-delete
                // perform: calls our delete function
                // List automatically provides the swipe gesture
                .onDelete(perform: _______)
            }
            
            // TODO: Set the navigation title to "Movie Reviews"
            .navigationTitle(_______)
            
            // TODO: Add a toolbar with a + button
            .toolbar {
                Button {
                    // TODO: Set showingAdd to true when button is tapped
                    // This will trigger the sheet to appear
                    showingAdd = _______
                } label: {
                    // TODO: Use the "plus" SF Symbol for the button
                    Image(systemName: _______)
                }
            }
            
            // TODO: Add .sheet modifier to show AddMovieView as a modal
            // isPresented: needs a Binding, so use $ before showingAdd
            // When showingAdd is true, sheet appears
            // When false, sheet dismisses
            .sheet(isPresented: _______showingAdd) {
                
                // TODO: Create AddMovieView and pass it the manager
                // AddMovieView needs manager to add movies to Firebase
                AddMovieView(manager: _______)
            }
        }
    }
    
    // TODO: Implement the delete function
    // This is called by .onDelete when user swipes to delete
    // "at offsets" is the argument label and parameter name
    // IndexSet contains the indices (row numbers) to delete
    func delete(at offsets: IndexSet) {
        
        // TODO: Loop through each index in the offsets IndexSet
        // offsets might be [2] for one row, or [2, 5, 8] for multiple rows
        for index in offsets {
            
            // TODO: Call manager.deleteMovie with the movie at that index
            // manager.movies[index] gets the Movie at that position
            // Manager handles deleting from Firebase
            // Real-time listener will automatically update the UI!
            manager._______(manager.movies[_______])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
