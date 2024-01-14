import Foundation
import MapKit

class Entry: Identifiable, ObservableObject {
    var id = UUID()
    var todo = ""
    var locationLat = ""
    var locationLong = ""
    var locationName = ""
    
    init(todo: String, locationLat: String, locationLong: String, locationName: String) {
        self.todo = todo
        self.locationLat = locationLat
        self.locationLong = locationLong
        self.locationName = locationName

    }
    
    // getters
    func getLocationLat() -> String {
        return locationLat
    }
    
    
    func getLocationLong() -> String  {
        return locationLong
    }
    
    func getLocationName() -> String {
            return locationName
        }
    
    func getToDo() -> String  {
        return todo
    }
}
