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
    
    //MARK: - AddMembers
    
    var isGere: Bool = false
    var nomMembre : String = ""
    var emailMembre : String = ""
    var showAddMemberSheet: Bool = false
    var avatarImages : [String] = ["avatar1", "avatar2", "avatar3", "avatar4","avatar5", "avatar6","avatar7", "avatar8", "avatar9", "avatar10"]
    var colorsTheme : [Color] = [.lightMauve100, .lightSky100, .lightRose100, .lightGreen100, .lightBlue100, .lightRed100, .lightOrange100, .lightYellow100]
    var selectedAvatarMembre : String? = nil
    var selectedCouleurMembre : Color? = nil
    
    func addNewMember(nom: String, couleur : Color?, avatar: String?, niveau : Niveau, isGere : Bool, email : String) {
        
        let newMembre = Membre(
            id: UUID(),
            estGere: isGere,
            dateEntree: Date(),
            nom: nom ,
            couleur: couleur,
            avatar: avatar,
            cagnotte: 0.0,
            niveau: niveau.rawValue,
            email: email
            )
        
        membresDuFoyer.append(newMembre)
        
    }
    
    func clearForm() {
        nomMembre = ""
        emailMembre = ""
        selectedAvatarMembre = nil
        selectedCouleurMembre = nil
        isGere = false
    }
    
}
