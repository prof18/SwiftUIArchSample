//
//  Step3ViewModel.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import Combine
import Foundation

class Step3ViewModel: ObservableObject {
    
    
    @Published var dataState: DataState = Loading() {
        willSet {
            print("Setting dataState")
        }
    }
    
    
    func longRunningTask() {
        
        self.dataState = Loading()
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            print("Start operation")
            
            sleep(2)
            
            DispatchQueue.main.async {
                
                if Bool.random() {
                    print("Success")
                    self.dataState = Success<String>(result:"Value loaded!")
                } else {
                    print("Failure")
                    self.dataState = Error(reason: "Some error happend :(")
                }
                
                
            }
            
        }
        
    }
    
    
}
