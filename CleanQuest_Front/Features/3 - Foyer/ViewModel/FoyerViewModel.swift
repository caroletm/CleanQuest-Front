//
//  FoyerViewModel.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import Foundation
import SwiftUI
import Observation

@Observable

class FoyerViewModel {
    
    //MARK: - JoinFoyer
    
    var codeFoyer: String = ""
    
    //MARK: - CreateFoyer
    
    var nomFoyer : String = ""
    var selectedType : FoyerType?
    var membresDuFoyer : [Membre] = []
    var membresCount : Int {
        membresDuFoyer.count
    }
    
}
