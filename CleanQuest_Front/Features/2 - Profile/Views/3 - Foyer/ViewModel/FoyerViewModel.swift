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
    
    //MARK: - MesFoyers
    
    var foyers : [Foyer] = []
    
    func fetchFoyers() async {
        do {
            foyers = try await foyerService.getAllFoyers().map { $0.toFoyer() }
            print("Foyers du user récupérés")
        }catch{
            print("Erreur dans la récupération des foyers : \(error)")

        }
    }
    
    
    //MARK: - JoinFoyer
    
    var codeFoyer: String = ""
    
    //MARK: - CreateFoyer
    
    var nomFoyer : String = ""
    var selectedType : FoyerType?
    var membresDuFoyer : [Membre] = []
    var alertMessage: String = ""
    var showErrorAlert: Bool = false
    var showAlertBeforeFoyerCreation : Bool = false
    var membresCount : Int {
        membresDuFoyer.count
    }
    
    //Créer un foyer
    func createFoyer() async {

        guard let selectedType else { return }

        let dto = CreateFoyerDTO(
            nom: nomFoyer,
            type: selectedType,
            membres: membresDuFoyer.map { $0.toCreateMembreDTO() }
        )

        do {
            let foyerCreated = try await foyerService.createFoyer(dto)
            let newFoyer = foyerCreated.toFoyer()
            foyers.append(newFoyer)
            clearFoyerToCreate()
        } catch {
            alertMessage = error.localizedDescription
            showErrorAlert.toggle()
        }
    }
    
    func clearFoyerToCreate() {
        membresDuFoyer = []
        selectedType = nil
        nomFoyer = ""
    }
    
    func isCreateFoyerValid() -> Bool {
        guard !nomFoyer.isEmpty else {
            alertMessage = "Le nom du foyer est obligatoire."
            showErrorAlert = true
            return false
        }
        
        guard !membresDuFoyer.isEmpty else {
            alertMessage = "Vous devez ajouter au moins un membre."
            showErrorAlert = true
            return false
        }
        
        guard selectedType != nil else {
            alertMessage = "Veuillez choisir un type de foyer."
            showErrorAlert = true
            return false
        }
        return true
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
            niveau: niveau,
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
    
    func isMembreFormValid() -> Bool {
        guard !nomMembre.isEmpty else {
            alertMessage = "Le nom est obligatoire."
            showErrorAlert = true
            return false
        }
        if !isGere && emailMembre.isEmpty {
            alertMessage = "L'email est obligatoire."
            showErrorAlert = true
            return false
        }
        if isGere && selectedAvatarMembre == nil {
            alertMessage = "Veuillez choisir un avatar."
            showErrorAlert = true
            return false
        }
        if isGere && selectedCouleurMembre == nil {
            alertMessage = "Veuillez choisir une couleur."
            showErrorAlert = true
            return false
        }
        return true
    }
    
    //MARK: - Call API
    
    let foyerService = FoyerService()
    

    
    
}
