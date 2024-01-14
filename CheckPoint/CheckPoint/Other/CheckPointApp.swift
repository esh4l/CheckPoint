//
//  CheckPointApp.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-12.
//

import SwiftUI
import FirebaseCore



@main
struct CheckPointApp: App {
    init() {
        FirebaseApp.configure()
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
