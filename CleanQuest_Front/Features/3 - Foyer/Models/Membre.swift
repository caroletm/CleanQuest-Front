//
//  Membre.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import Foundation
import SwiftUI

struct Membre: Identifiable, Hashable {
    var id: UUID
    var estGere: Bool
    var dateEntree: Date
    var nom: String
    var couleur: Color?
    var avatar: String?
    var cagnotte: Double
    var niveau: String
    var email : String?
}
