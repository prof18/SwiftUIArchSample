//
//  NewDetailScreen.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct NewsDetailScreen: View {
    
   @Binding var news: News?
    
   @EnvironmentObject var router: FirstScreenRouter

    
    var body: some View {
        VStack {
            Text("News Detail")
            Spacer(minLength: 10)
            Text(news?.title ?? "")
            Spacer()
            Button(action: {
                if let stringUrl = self.news?.url, let url = URL(string: stringUrl), !url.absoluteString.isEmpty {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    
                }
            }) {
                Text("Open in browser")
            }
            Spacer()
        }
    }
}

//struct NewDetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsDetailScreen(news: newsList[0])
//    }
//}
