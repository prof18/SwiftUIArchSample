//
//  Step1Screen.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct Step1Screen: View {
    
    @EnvironmentObject var router: SecondScreenRouter
    
    var body: some View {
        
        VStack {
            
            NavigationLink(destination: Step2Screen().environmentObject(router), tag: true, selection: self.$router.secondStepRoute.triggerNavigation) {
                EmptyView()
            }.isDetailLink(false)
            
            Text("Tutorial Page 1")
            
            Spacer()
            
            Button(action: {
                self.router.secondStepRoute.triggerNavigation = true
            }) {
                Text("Next")
            }
            
            Spacer()
        }
        .onAppear() {
            print("Showing StepScreen1")
        }.onDisappear() {
            print("Hide StepScreen1")
        }
    }
}

struct Step1Screen_Previews: PreviewProvider {
    static var previews: some View {
        Step1Screen()
    }
}
