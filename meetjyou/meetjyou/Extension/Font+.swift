//
//  Font+.swift
//  meetjyou
//
//  Created by LJh on 1/25/25.
//
import SwiftUI

extension Font {
    enum FontWeight: String {
        case black = "Pretendard-Black"
        case bold = "Pretendard-Bold"
        case extraBold = "Pretendard-ExtraBold"
        case extraLight = "Pretendard-ExtraLight"
        case light = "Pretendard-Light"
        case medium = "Pretendard-Medium"
        case regular = "Pretendard-Regular"
        case semiBold = "Pretendard-SemiBold"
        case thin = "Pretendard-Thin"
    }

    static func createFont(weight: FontWeight, size: CGFloat) -> Font {
        return .custom(weight.rawValue, size: size)
    }
}
