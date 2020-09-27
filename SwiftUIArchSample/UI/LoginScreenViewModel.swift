//
//  LoginScreenViewModel.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import Combine

class LoginScreenViewModel: ObservableObject {
    
    
    let appState: AppState
    let localDataSource: LocalDataSource
    
    
    init(appState: AppState) {
        self.appState = appState
        self.localDataSource = LocalDataSourceImpl()
    }
    
    
    func performLogin(username: String, password: String) {
        
        self.localDataSource.saveUser(user: User(username: username, password: password))
        self.appState.isLoggedIn = true
        
        
    }
}
