//
//  meetjyouApp.swift
//  meetjyou
//
//  Created by LJh on 1/25/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import ComposableArchitecture

@main
struct meetjyouApp: App {
    let kakaoFeature: StoreOf<KakaoFeature>  // ✅ TCA Store 추가

    init() {
        if let kakaoAppKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") as? String {
            KakaoSDK.initSDK(appKey: kakaoAppKey)
        } else {
            print("안된겁ㄴ미다")
        }
        // ✅ TCA Store 초기화 (올바른 초기 상태와 함께)
        self.kakaoFeature = Store(initialState: KakaoFeature.State(), reducer: { KakaoFeature() })
            
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingView(store: kakaoFeature)
                .onOpenURL { url in
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        print("카카오 성공")
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
    
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }

        return false
    }
}
