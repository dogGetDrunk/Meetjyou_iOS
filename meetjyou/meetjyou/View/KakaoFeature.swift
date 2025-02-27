//
//  KakaoFeature.swift
//  meetjyou
//
//  Created by LJh on 2/27/25.
//


import ComposableArchitecture

@Reducer
struct KakaoFeature {
    @ObservableState
    struct State: Equatable {
        var test: Bool = false
    }
    enum Action {
        case kakaoTest
    }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .kakaoTest:
                print("sad")
                return .none
            }
        }
    }
}
