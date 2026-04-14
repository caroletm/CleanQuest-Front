//
//  Membre.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import Foundation
import SwiftUI

struct Membre: Identifiable, Hashable {
    var id: Int
    var estGere: Bool
    var dateEntree: Date
    var nom: String
    var couleur: String?
    var avatar: String?
    var cagnotte: Double
    var niveau: String
}
