//
//  Tabs.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-13.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 0)
                .frame(height: 150)
                .offset(y: 100)
                .foregroundColor(Color.white)
            HStack {
                Spacer()
                NavigationLink(destination: PersonalToDoView()){
                    Label("To-Do", systemImage: "pencil")       
                }
                Spacer()
                NavigationLink(destination: MembersView()){
                    Label("Members", systemImage: "person.fill")
                }
                Spacer()
            }
        }
    }
}

#Preview {
    Tabs()
}
