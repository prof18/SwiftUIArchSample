//
//  SecondScreen.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct SecondScreen: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        SecondScreenContent(viewModel: SecondScreenViewModel(appState: appState))
    }
    
}

struct SecondScreenContent: View {
    
    @ObservedObject var viewModel: SecondScreenViewModel
    @EnvironmentObject var router: SecondScreenRouter
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                // https://www.hackingwithswift.com/forums/swiftui/environment-object-not-being-inherited-by-child-sometimes-and-app-crashes/269
                
                NavigationLink(destination: Step1Screen().environmentObject(router), tag: true, selection: self.$router.firstStepRoute.triggerNavigation) {
                    EmptyView()
                }.isDetailLink(false)
                
                Spacer()
                
                Text("Second View")
                
                Spacer()
                
                Button(action: {
                    self.router.firstStepRoute.triggerNavigation = true
                }) {
                    Text("Start tutorial")
                }
                
                Spacer()
                
                Button(action: {
                    self.viewModel.performLogout()
                }) {
                    Text("Logout")
                }
                
                Spacer()
            }
            .navigationBarHidden(self.router.navigationBarHidden)
            .navigationBarTitle("Profile")
            .onAppear {
                self.router.navigationBarHidden = true
                self.router.disableAllRoutes()
            }
            .onDisappear {
                self.router.navigationBarHidden = false
            }
            .environmentObject(router)
        }
    }
}

//struct SecondScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondScreen()
//    }
//}
