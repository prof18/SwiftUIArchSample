//
//  SecondScreen.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct SecondScreen: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    
    var body: some View {
        VStack {
            Text("Second View")
            Button(action: {
                self.viewModel.performLogout()
            }) {
                Text("Logout")
            }
        }
    }
}

//struct SecondScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondScreen()
//    }
//}
