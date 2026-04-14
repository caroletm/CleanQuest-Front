//
//  Settings.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import Foundation
import SwiftUI

enum SettingsSection: CaseIterable {
    case general, helpAndSupport, parameters
    var title: String {
        switch self {
        case .general: return "Général"
        case .helpAndSupport: return "Aide et support"
        case .parameters: return "Paramètres"
        }
    }

    var items: [SettingsItem] {
        switch self {
        case .general: return [.editProfile]
        case .helpAndSupport: return [.faq, .contactUs]
        case .parameters: return [.notifications, .privacy, .terms, .deleteAccount]
        }
    }
}
                
enum SettingsItem {
    case editProfile, faq, contactUs, notifications, privacy, terms, deleteAccount

    var title: String {
        switch self {
        case .editProfile: return "Modifier mon profil"
        case .faq: return "FAQ"
        case .contactUs: return "Contactez-nous"
        case .notifications: return "Notifications"
        case .privacy: return "Confidentialité"
        case .terms: return "Conditions Générales d'utilisation"
        case .deleteAccount: return "Supprimer mon compte"
        }
    }
    
    var route : AppRoute? {
        switch self {
            case .editProfile: return nil
        case .faq: return nil
        case .contactUs: return nil
        case .notifications: return nil
        case .privacy: return nil
        case .terms: return nil
        case .deleteAccount: return nil
        }
    }
}
