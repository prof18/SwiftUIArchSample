//
//  SecondScreenViewModel.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import Foundation
import Combine

class SecondScreenViewModel: ObservableObject {
    
    let appState: AppState
    let localDataSource: LocalDataSource
    
    init(appState: AppState) {
        self.appState = appState
        self.localDataSource = LocalDataSourceImpl()
    }
    
    func performLogout() {
        self.localDataSource.deleteUser()
        self.appState.isLoggedIn = false
    }
    
}
