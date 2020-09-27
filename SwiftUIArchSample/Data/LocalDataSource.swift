//
//  LocalDataSource.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import Foundation

protocol LocalDataSource {
    func getUser() -> User?
    func saveUser(user: User)
    func deleteUser()
}

struct LocalDataSourceImpl: LocalDataSource {
    
    let defaults = UserDefaults.standard
    
    func saveUser(user: User) {
        defaults.set(user.username, forKey: "username")
        defaults.set(user.password, forKey: "password")
    }
    
    func getUser() -> User? {
        
        if let username = defaults.object(forKey: "username") as? String,
            let password = defaults.object(forKey: "password") as? String {
            return User(username: username, password: password)
        }
        return nil
    }
    
    func deleteUser() {
        defaults.removeObject(forKey: "username")
        defaults.removeObject(forKey: "password")
    }
}

