//
//  ContentView.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {

    let firstScreen = FirstScreen()
    let firstScreenRouter = FirstScreenRouter()
    
    let secondScreen = SecondScreen()
    let secondScreenRouter = SecondScreenRouter()
    
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            firstScreen.environmentObject(firstScreenRouter)
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            secondScreen.environmentObject(secondScreenRouter)
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
            }.onAppear {
                // A shitty hack to avoid Attempting to begin a transition on navigation bar while a transition is in progress.
                self.firstScreenRouter.newsDetail.triggerNavigation = false
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
