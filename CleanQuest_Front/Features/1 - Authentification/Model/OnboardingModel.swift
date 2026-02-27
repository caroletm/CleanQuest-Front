//
//  OnboardingModel.swift
//  CleanQuest
//
//  Created by caroletm on 24/02/2026.
//

import Foundation
import SwiftUI

struct OnboardingModel : Identifiable, Equatable, Hashable {
    var id: UUID = UUID()
    var title : String
    var subtitle: String
    var backgroundColor : Color
    var capsuleColor: Color
    var image: ImageResource
}

var step1 : OnboardingModel = OnboardingModel(title: "Créée ton foyer", subtitle: "Ou rejoins un foyer existant", backgroundColor: .lightMauve100, capsuleColor: .lightMauve200, image: .family)
var step2 : OnboardingModel = OnboardingModel(title: "Planifie tes tâches", subtitle: "Gère les tâches du foyer", backgroundColor: .lightYellow100, capsuleColor: .lightYellow2001, image: .todoList)
var step3 : OnboardingModel = OnboardingModel(title: "Fais le ménage", subtitle: "Fais le ménage et gagne des points", backgroundColor: .lightRose100, capsuleColor: .lightRose200, image: .sponge)
var step4 : OnboardingModel = OnboardingModel(title: "Profite des points", subtitle: "Amuse-toi et dépense tes points !", backgroundColor: .lightBlue100, capsuleColor: .lightBlue300, image: .winCup)

var onboardingSteps: [OnboardingModel] = [step1, step2, step3, step4]
