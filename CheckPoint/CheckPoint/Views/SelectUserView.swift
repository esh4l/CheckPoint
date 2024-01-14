//
//  SelectUserView.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-13.
//

import SwiftUI

struct SelectUserView: View {
    @Binding var isChosen: Bool
    var body: some View {
        
            VStack {
                NavigationLink(destination: PersonalToDoView()) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.red)
                                            .frame(width:200)
                                        Text("Mom")
                                            .bold()
                                            .foregroundColor(Color.white)
                                    }
                                }
                NavigationLink(destination: PersonalToDoView()) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.green)
                                            .frame(width:200)
                                        Text("Dad")
                                            .bold()
                                            .foregroundColor(Color.white)
                                    }
                                }
                NavigationLink(destination: PersonalToDoView()) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.blue)
                                            .frame(width:200)
                                        Text("Grandpa")
                                            .bold()
                                            .foregroundColor(Color.white)
                                    }
                                }
                NavigationLink(destination: PersonalToDoView()) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.yellow)
                                            .frame(width:200)
                                        Text("Alex")
                                            .bold()
                                            .foregroundColor(Color.white)
                                    }
                                }
     
        }
        
        
        
    }
}


struct SelectUserView_Previews: PreviewProvider {
    static var previews: some View {
        SelectUserView(isChosen: .constant(false))
    }
}
