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
    var niveau: Niveau
    var email : String?
}

extension Color {
    
    init?(hex: String?) {
        guard let hex = hex else { return nil }
        let h = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: h).scanHexInt64(&int)
        guard h.count == 6 else { return nil }
        self.init(
            red: Double((int >> 16) & 0xFF) / 255,
            green: Double((int >> 8) & 0xFF) / 255,
            blue: Double(int & 0xFF) / 255
        )
    }
        
        func toHex() -> String? {
            let uiColor = UIColor(self)
            var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
            uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
}

extension Membre {
    func toCreateMembreDTO() -> CreateMembreDTO {
        CreateMembreDTO(
            estGere: estGere,
            dateEntree: dateEntree,
            nom: nom,
            email: email,
            couleur: couleur?.toHex() ?? "",
            avatar: avatar ?? "",
            cagnotte: cagnotte,
            niveau: niveau)
    }
}
