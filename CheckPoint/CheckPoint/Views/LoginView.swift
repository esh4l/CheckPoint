//
//  LoginView.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-13.
//

import SwiftUI

let image = Image("CheckPoint")


struct LoginView: View {
    
    @State private var email = ""
        @State private var password = ""
        @Binding var isLogged: Bool
    @Binding var isChosen: Bool
        var body: some View {
            NavigationView {
                VStack {
                    // header
                    HeaderView(title: nil, subtitle: "Helping You Remember, Every Place, Every Time.", background: .white)
                  
                    // login form
                    Form {
                        TextField("Email Address/Family ID", text: $email)
                            .textFieldStyle(DefaultTextFieldStyle())
                        SecureField("Password", text: $password)
                            .textFieldStyle(DefaultTextFieldStyle())
                        
                        Button(action: {
                                    
                                    isLogged = true
                                }) {
                                    Text("Log In")
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                                }
                        .padding()
                        
                        
                    }
                    NavigationLink(destination: SelectUserView(isChosen: $isChosen), isActive: $isLogged) {
                                  
                                   }
                    
                    // create acc
                    VStack {
                        Text("New to CheckPoint?")
                        
                        NavigationLink("Create An Account", destination: RegistrationView())
                    }
                    .padding(.bottom, 50)
                    Spacer()
                }
            }
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLogged: .constant(false), isChosen: .constant(false))
    }
}
