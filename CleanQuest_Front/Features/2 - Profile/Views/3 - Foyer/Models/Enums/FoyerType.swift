//
//  FoyerType.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import SwiftUI
import Foundation

enum FoyerType: String, CaseIterable, Codable {
    case coloc
    case couple
    case familleAvecEnfant
    case familleSansEnfant
    case solo
  
    
    var title : String {
        switch self {
        case .coloc:
            return "Coloc"
        case .couple:
            return "Couple"
        case .familleAvecEnfant:
            return "Famille avec enfant"
        case .familleSansEnfant:
            return "Famille sans enfant"
        case .solo:
            return "Solo"
        }
    }
}
