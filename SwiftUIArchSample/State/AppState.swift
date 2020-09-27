//
//  AppState.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import Combine

class AppState: ObservableObject {
    
    @Published var isLoggedIn = false
    
    init() {
        let user = LocalDataSourceImpl().getUser()
        self.isLoggedIn = user != nil
    }
    
}
