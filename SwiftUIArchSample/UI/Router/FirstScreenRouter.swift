//
//  Router.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

class FirstScreenRouter: ObservableObject {
    @Published var navigationBarHidden: Bool = true
    @Published var newsDetail: NewsDetailRoute = NewsDetailRoute()
}

struct NewsDetailRoute {
    var news: News?
    var triggerNavigation: Bool? = false
    
    init() {}
    
    init(news: News) {
        self.news = news
        self.triggerNavigation = true
    }
}
