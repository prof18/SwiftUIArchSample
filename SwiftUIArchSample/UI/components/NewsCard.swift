//
//  NewsCard.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct NewsCard: View {
    let news: News
    var clickAction: () -> Void
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(self.news.title)
                    .font(.system(size: 18))
            }
            .layoutPriority(100)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
        .onTapGesture { self.clickAction() }
    }
}
