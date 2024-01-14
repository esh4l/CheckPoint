//
//  MembersView.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-13.
//

import SwiftUI

struct MembersView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.red)
                        .frame(width:100)
                    Text("Mom")
                        .bold()
                        .foregroundColor(Color.white)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.white)
                        .frame(width:200)
                    Text("Buy eggs, Freshco, Wellington Rd (MOM)\n\nPick up shoes, Masonville Mall (ALEX)")
                        .bold()
                        .foregroundColor(Color.blue)
                        .frame(width: 200)
                }
            }

            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.green)
                        .frame(width:100)
                    Text("Dad")
                        .bold()
                        .foregroundColor(Color.white)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.white)
                        .frame(width:200)
                    Text("Drop off hockey gear,       123 Avenue (MOM)\n\n")
                        .bold()
                        .foregroundColor(Color.blue)
                        .frame(width: 200)
                }
            }
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.yellow)
                        .frame(width:100)
                    Text("Grandpa")
                        .bold()
                        .foregroundColor(Color.white)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.white)
                        .frame(width:200)
                    Text("Pick up medication,           Shopper's Drug Mart (DAD)")
                        .bold()
                        .foregroundColor(Color.blue)
                        .frame(width: 200)
                }
                
            }
            
            
        }
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.blue)
                .frame(width:250, height: 50)
            Text("Delegate Task to Family")
                .bold()
                .font(.system(size: 20))
                .foregroundColor(Color.white)
        }
        
         
        
        Tabs()
    }
}

#Preview {
    MembersView()
}
