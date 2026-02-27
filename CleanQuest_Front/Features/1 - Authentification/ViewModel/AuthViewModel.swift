//
//  AuthViewModel.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI
import Foundation
import Observation

@Observable

class AuthViewModel{
    
    var userVM : UserViewModel
    
    init(userVM : UserViewModel) {
        self.userVM = userVM
    }
        
}
