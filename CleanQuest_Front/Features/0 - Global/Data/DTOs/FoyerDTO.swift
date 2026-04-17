//
//  FoyerDTO.swift
//  CleanQuest_Front
//
//  Created by caroletm on 16/04/2026.
//

import Foundation
import SwiftUI


//POST/foyers
struct CreateFoyerDTO: Codable {
    var nom: String
    var type: FoyerType
    var membres: [CreateMembreDTO]
}

struct FoyerDTO: Codable {
    var id: UUID?
    var nom: String
    var type: FoyerType
    var codeFoyer: String
    var membres : [MembreDTO]
}

extension FoyerDTO {
    func toFoyer() -> Foyer {
        Foyer(id: id,
              nom: nom,
              type: type,
              codeFoyer: codeFoyer,
              membres: membres.map { $0.toMembre() }
              )
    }
}
