//
//  Step2Screen.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct Step2Screen: View {
    
    @EnvironmentObject var router: SecondScreenRouter
    
    var body: some View {
        
        VStack {
            NavigationLink(destination: Step3Screen().environmentObject(router), tag: true, selection: self.$router.thirdStepRoute.triggerNavigation) {
                EmptyView()
            }
            
            
            Button(action: {
                self.router.thirdStepRoute.triggerNavigation = true
            }) {
                Text("Next")
            }
        }
        .onAppear() {
            print("Showing StepScreen2")
        }.onDisappear() {
            print("Hide StepScreen2")
        }
    }
}

struct Step2Screen_Previews: PreviewProvider {
    static var previews: some View {
        Step2Screen()
    }
}
