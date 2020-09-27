//
//  ContentView.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
        @EnvironmentObject var appState: AppState

    var body: some View {
        HomeContent(viewModel: HomeViewModel(appState: appState))
    }
    
}

struct HomeContent: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            VStack {
                Text("Second View")
                Button(action: {
                    self.viewModel.performLogout()
                }) {
                    Text("Logout")
                }
            }
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
