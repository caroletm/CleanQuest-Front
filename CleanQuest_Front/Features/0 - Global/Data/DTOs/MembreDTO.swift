//
//  MembreDTO.swift
//  CleanQuest_Front
//
//  Created by caroletm on 16/04/2026.
//

import Foundation
import SwiftUI

struct CreateMembreDTO : Codable {
    var id : UUID?
    var estGere : Bool
    var dateEntree : Date
    var nom : String
    var email : String?
    var couleur : String
    var avatar : String
    var cagnotte : Double
    var niveau : Niveau
}

struct MembreDTO : Codable {
    var id: UUID?
    var estGere : Bool
    var dateEntree : Date?
    var nom : String
    var email : String?
    var couleur : String?
    var avatar : String?
    var cagnotte : Double
    var niveau : Niveau
    var userId : UUID?
    var gestionnaireId : UUID?
    var foyerId : UUID
}

extension MembreDTO {
    func toMembre() -> Membre {
        Membre(id: id ?? UUID(),
               estGere: estGere,
               dateEntree: dateEntree ?? Date(),
               nom: nom,
               couleur: Color(hex: couleur),
               avatar: avatar ?? "",
               cagnotte: cagnotte,
               niveau: niveau,
               email: email ?? "")
    }
           
}
