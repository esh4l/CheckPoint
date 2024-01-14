//
//  HeaderView.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-13.
//

import SwiftUI
let logo = Image("CheckPoint")


struct HeaderView: View {
    let title: String?
    let subtitle: String
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
            
            VStack {
                if let title = title {
                    Image("CheckPoint")
                        .resizable()
                        .scaledToFit()
                    Text(title)
                        .foregroundColor(Color.white)
                        .font(.system(size: 50))
                        .bold()
                }
                else {
                    Image("CheckPoint")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                }
                Text(subtitle)
                    .foregroundColor(Color.black)
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "TITLE", subtitle: "SUBTITLE", background: Color.blue)
}
