//
//  KakaoFeature.swift
//  meetjyou
//
//  Created by LJh on 2/27/25.
//


import ComposableArchitecture
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon
// Git Test
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
                // 카카오톡 실행 가능 여부 확인
                if (UserApi.isKakaoTalkLoginAvailable()) {
                    UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("loginWithKakaoTalk() success.")

                            // 성공 시 동작 구현
                            _ = oauthToken
                        }
                    }
                } else {
                    UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                print("loginWithKakaoAccount() success.")
                                _ = oauthToken
                            }
                        }
                }
                
                return .none
            }
        }
    }
}
