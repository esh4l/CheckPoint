import SwiftUI
import MapKit

struct PersonalToDoView: View {
    @State private var userInput: String = ""
        @State private var userInput2: String = ""
        @State private var selectedLocationName: String = ""
        @State private var entryStack: [Entry] = []
        @StateObject private var mapAPI = MapAPI()
        @State private var userTrackingMode: MapUserTrackingMode = .follow
    var body: some View {
        VStack {
            TextField("Jot your To-Do List Here...", text: $userInput)
                .padding()
                .background(Color.gray.opacity(0.4).cornerRadius(10))
                .font(.headline)
            TextField("Search for Location...", text: $userInput2)
                .padding()
                .background(Color.gray.opacity(0.4).cornerRadius(10))
                .font(.headline)

            Map(coordinateRegion: $mapAPI.region, showsUserLocation: true, userTrackingMode: $userTrackingMode)
                .onTapGesture {
                    mapAPI.getLocation(address: userInput2, delta: 0.05) { name in
                        selectedLocationName = name
                    }
                }

            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.blue)
                        .frame(width: 200, height: 50, alignment: .bottom)

                    Text("Choose Location")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(alignment: .bottom)
                        .onTapGesture {
                            // Create an Entry object and add it to the stack
                            let entry = Entry(todo: userInput, locationLat: "", locationLong: userInput2, locationName: selectedLocationName)

                            entryStack.append(entry)

                            userInput = ""
                            userInput2 = ""
                        }
                }
            }

            // Display the stack of entries
            List(entryStack) { entry in
                Text("\(entry.getToDo()) - \(entry.getLocationLong())")
            }
            Tabs()
        }
        .onAppear {
            // Load data from the text file when the view appears
            loadDataFromFile()
        }
    }

    func loadDataFromFile() {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Error getting documents directory.")
            return
        }

        let fileURL = documentsDirectory.appendingPathComponent("todo.txt")

        do {
            let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
            let lines = fileContents.components(separatedBy: "\n")
            if lines.count >= 2 {
                userInput = lines[0]
                userInput2 = lines[1]
            }
        } catch {
            print("Error loading data from file: \(error)")
        }
    }
}

struct PersonalToDoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalToDoView()
    }
}
