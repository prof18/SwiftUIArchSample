//
//  Step3Screen.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import SwiftUI

struct Step3Screen: View {
    
    @EnvironmentObject var router: SecondScreenRouter
    @ObservedObject var viewModel = Step3ViewModel()
    
    var body: some View {
        containedView()
            .onAppear() {
                self.viewModel.longRunningTask()
        }
    }
    
    
    func containedView() -> AnyView {
        switch viewModel.dataState {
        case is Loading:
            return AnyView(Loader())
            
        case is Success<String>:
            let data = (viewModel.dataState as! Success<String>).result
            return AnyView(SuccessView(data: data) {
                self.router.disableAllRoutes()
                }
            )
            
        case is Error:
            let data = (viewModel.dataState as! Error).reason
            return AnyView(ErrorView(data: data) {
                    self.viewModel.longRunningTask()
                }
            )
            
        default:
            return AnyView(EmptyView())
        }
    }
}

struct SuccessView: View {
    
    let data: String
    let clickAction: () -> Void
    
    var body: some View {
        VStack {
            Text(data)
            Spacer()
            Button(action: {
                self.clickAction()
            }) {
                Text("Done")
            }
            Spacer()
        }
    }
}


struct ErrorView: View {
    
    let data: String
    let clickAction: () -> Void
    
    var body: some View {
        VStack {
            Text(data)
            Spacer()
            Button(action: {
                self.clickAction()
            }) {
                Text("Retry")
            }
            Spacer()
        }
    }
}

struct Step3Screen_Previews: PreviewProvider {
    static var previews: some View {
        Step3Screen()
    }
}
