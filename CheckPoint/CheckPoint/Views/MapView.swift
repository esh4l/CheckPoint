//
//  MapView.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-13.
//

import SwiftUI
import MapKit
struct MapView: View {
    @ObservedObject var mapAPI: MapAPI
    @State private var locationName: String
    

    init(mapAPI: MapAPI, locationName: String) {
        self.mapAPI = mapAPI
        self._locationName = State(initialValue: locationName)
    }

    var body: some View {
        VStack {
            Map(coordinateRegion: $mapAPI.region, showsUserLocation: true, userTrackingMode: $mapAPI.userTrackingMode)
                .onAppear {
                    mapAPI.getLocation(address: locationName, delta: 0.05) { name in
                        locationName = name
                    }
                }
        }
    }
}


struct Address: Codable {
    let latitude, longitude: String
    let name: String?
    let latDouble, longDouble: Double
    let data: [Datum]
    
}

struct Datum: Codable {
    let latitude, longitude: Double
    let name: String
}

struct Location: Identifiable {
    let id = UUID()
    let name : String
    let coordinate: CLLocationCoordinate2D
}

class MapAPI: ObservableObject {
    private let BASE_URL = "http://api.positionstack.com/v1/forward"
    private let API_KEY = "5c89cce355cb47ce23f9d3989e943266"
    
    @Published var region: MKCoordinateRegion
    @Published var selectedLocation: Location?
    @Published var coordinates = []
    @Published var locations: [Location] = []
    @Published var userTrackingMode: MapUserTrackingMode = .follow

    
    init(){
        
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.9849, longitude: -81.2453), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
        self.locations.insert(Location(name: "Pin", coordinate: CLLocationCoordinate2D(latitude: 42.9849, longitude: -81.2453)), at: 0)

    }
    
    func getLocation(address: String, delta: Double, completion: @escaping (String) -> Void) {
        let pAddress = address.replacingOccurrences(of: " ", with: "%20")
        let url_string = "\(BASE_URL)?access_key=\(API_KEY)&query=\(pAddress)"
        
        guard let url = URL(string: url_string) else{
            print("Invalid url")
            return
        }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else {
                print(error!.localizedDescription)
                return
            }
            guard let newCoordinates = try? JSONDecoder().decode(Address.self, from: data) else {
                return
                
            }
             
            if newCoordinates.data.isEmpty {
                print("Could not find the address...")
                return
            }
            DispatchQueue.main.async {
                    let details = newCoordinates.data[0]
                    let lat = details.latitude
                    let lon = details.longitude
                    let name = details.name ?? "Pin"

                    self.coordinates = [lat, lon]
                    self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))

                    let newLocation = Location(name: name, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
                    self.locations.removeAll()
                    self.locations.insert(newLocation, at: 0)

                    self.selectedLocation = newLocation

                    completion(name)
                    print("Successfully loaded the location!")
                }
        }
        .resume()
    }
                                         
}

#Preview {
    MapView(mapAPI: MapAPI(), locationName: "")
}
