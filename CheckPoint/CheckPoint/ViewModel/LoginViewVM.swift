//
//  LoginViewVM.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-13.
//

import Foundation


class LoginViewVM: ObservableObject {
    var isLogged = false
    init() {
        
    }
    func LoggedIn () {
       isLogged = true;
   }
}
 

