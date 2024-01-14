//
//  ContentView.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-12.
//

import SwiftUI
import MapKit
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

struct ContentView: View {
    
    @StateObject private var mapAPI = MapAPI()
    @State private var text = ""
    @State private var isLogged = false
    @State private var isChosen = false
    @State private var alrLogged = false
    @StateObject var LoginViewModel = LoginViewVM();
    @StateObject var SelectUserViewModel = SelectUserVM();
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


    var body: some View {
        VStack {
            // Other view components
            
            
        }
        // if user clicks Log In, redirect to UserPage
        if LoginViewModel.isLogged  {
            
            NavigationLink(destination: SelectUserView(isChosen: $isChosen)) {
                EmptyView()
                
            }
            
        }
        else {
            // Show the login view when not logged in
            LoginView(isLogged: $isLogged, isChosen: $isChosen)
        }
            
        
    }
}

#Preview {
    ContentView()
}

