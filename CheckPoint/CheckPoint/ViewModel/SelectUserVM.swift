//
//  SelectUserVM.swift
//  CheckPoint
//
//  Created by eshal tariq on 2024-01-13.
//

import Foundation

class SelectUserVM: ObservableObject {
    var isChosen = false
    init() {
        
    }
    func Chosen () {
       isChosen = true;
   }
}
 
