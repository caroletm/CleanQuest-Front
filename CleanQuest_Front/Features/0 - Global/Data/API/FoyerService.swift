//
//  FoyerService.swift
//  CleanQuest_Front
//
//  Created by caroletm on 17/04/2026.
//

import Foundation

struct FoyerService {
    
    func createFoyer(_ dto : CreateFoyerDTO) async throws -> FoyerDTO {
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let foyerCreated : FoyerDTO = try await APIService.shared.post("/foyers", body: dto, token: token)
        return foyerCreated
    }
    
    func getAllFoyers() async throws -> [FoyerDTO] {
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let foyerFetch : [FoyerDTO] = try await APIService.shared.get("/foyers", token: token)
        return foyerFetch
    }
}
