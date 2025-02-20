//
//  Font+.swift
//  meetjyou
//
//  Created by LJh on 1/25/25.
//
import SwiftUI

extension Font {
    enum FontWeight: String {
        case black = "Pretendard-Black"           // 900
        case bold = "Pretendard-Bold"             // 700
        case extraBold = "Pretendard-ExtraBold"   // 800
        case extraLight = "Pretendard-ExtraLight" // 200
        case light = "Pretendard-Light"           // 300
        case medium = "Pretendard-Medium"         // 500
        case regular = "Pretendard-Regular"       // 400
        case semiBold = "Pretendard-SemiBold"     // 600
        case thin = "Pretendard-Thin"             // 100
    }

    static func createFont(weight: FontWeight, size: CGFloat) -> Font {
        return .custom(weight.rawValue, size: size)
    }
}
