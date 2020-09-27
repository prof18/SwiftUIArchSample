//
//  LoginScreen.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject var appState: AppState

    var body: some View {
        LoginContent(viewModel: LoginScreenViewModel(appState: appState))
    }
    
}

struct LoginContent: View {
    

    @ObservedObject var viewModel: LoginScreenViewModel
    

    var body: some View {
        
        VStack {
            Text("Login Screen")
            Button(action: {
                self.viewModel.performLogin(username: "ciccio", password: "pasticcio")
            }) {
                Text("Login")
            }
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
