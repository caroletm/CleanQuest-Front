//
//  Foyer.swift
//  CleanQuest_Front
//
//  Created by caroletm on 16/04/2026.
//

import Foundation
import SwiftUI

struct Foyer: Identifiable, Hashable {
    var id: UUID?
    var nom: String
    var type: FoyerType
    var codeFoyer: String?
    var membres: [Membre]
}
