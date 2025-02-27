//
//  meetjyouApp.swift
//  meetjyou
//
//  Created by LJh on 1/25/25.
//

import SwiftUI
import KakaoSDKCommon

@main
struct meetjyouApp: App {
    init() {
        if let kakaoAppKey = Bundle.main.object(forInfoDictionaryKey: "Test") as? String {
            print(kakaoAppKey)
            KakaoSDK.initSDK(appKey: kakaoAppKey)
        } else {
            print("안된겁ㄴ미다")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
    
}
