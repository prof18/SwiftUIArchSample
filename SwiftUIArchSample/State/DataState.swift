//
//  LoadingState.swift
//  SwiftUIArchSample
//
//  Created by Marco Gomiero on 27/09/2020.
//  Copyright © 2020 Marco Gomiero. All rights reserved.
//

import Foundation

//enum DataState<T>: Equatable where T: Equatable {
//    static func == (lhs: DataState<T>, rhs: DataState<T>) -> Bool {
//        switch (lhs, rhs) {
//        case (.notRequested, .notRequested): return true
//        case (.isLoading, .isLoading): return true
//        case let (.loaded(lhsV), .loaded(rhsV)): return lhsV == rhsV
//        case let (.failed(lhsE), .failed(rhsE)): return lhsE == rhsE
//        default: return false
//        }
//    }
//
//
//    case notRequested
//    case isLoading
//    case loaded(T)
//    case success
//    case failed(String)
//
//}


protocol DataState {}

struct Loading: DataState {}
struct Success<T>: DataState{
    let result: T
}
struct Error: DataState {
    let reason: String
}

