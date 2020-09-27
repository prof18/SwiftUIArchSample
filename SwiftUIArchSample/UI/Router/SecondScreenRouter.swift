//
//  SecondScreenRouter.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

class SecondScreenRouter: ObservableObject {
    @Published var navigationBarHidden: Bool = true
    @Published var firstStepRoute = FirstStepRoute()
    @Published var secondStepRoute = SecondStepRoute()
    @Published var thirdStepRoute = ThirdStepRoute()

    
    func disableAllRoutes() {
        self.firstStepRoute.triggerNavigation = false
        self.secondStepRoute.triggerNavigation = false
        self.thirdStepRoute.triggerNavigation = false

    }
}

struct FirstStepRoute {
    var triggerNavigation: Bool? = false
}

struct SecondStepRoute {
    var triggerNavigation: Bool? = false
}

struct ThirdStepRoute {
    var triggerNavigation: Bool? = false
}
