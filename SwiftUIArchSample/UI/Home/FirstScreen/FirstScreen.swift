//
//  FirstScreen.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct FirstScreen: View {
    
    @EnvironmentObject var router: FirstScreenRouter
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                NavigationLink(destination: NewsDetailScreen(news: self.$router.newsDetail.news), tag: true, selection: self.$router.newsDetail.triggerNavigation) {
                    EmptyView()
                }
                
                Button(action: {
                    let number = Int.random(in: 0..<newsList.count - 1)
                    self.router.newsDetail = NewsDetailRoute(news: newsList[number])
                }) {
                    Text("Random Article")
                }
                
                List {
                    ForEach(newsList, id: \.self) { news in
                        NewsCard(news: news) {
                            self.router.newsDetail = NewsDetailRoute(news: news)
                        }
                    }
                }
            }
            .navigationBarHidden(self.router.navigationBarHidden)
            .navigationBarTitle("Latest News")
            .onAppear {
                self.router.navigationBarHidden = true
            }
            .onDisappear {
                self.router.navigationBarHidden = false
            }
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
