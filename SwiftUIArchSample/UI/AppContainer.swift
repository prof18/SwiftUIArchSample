//
//  AppContainer.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct AppContainer: View {
    
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        if appState.isLoggedIn {
            return AnyView(HomeScreen())
        } else {
            return AnyView(LoginScreen())
        }
    }
}

struct AppContainer_Previews: PreviewProvider {
    static var previews: some View {
        AppContainer()
    }
}
