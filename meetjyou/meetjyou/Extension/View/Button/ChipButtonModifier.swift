//
//  ChipButtonModifier.swift
//  meetjyou
//
//  Created by 박재형 on 3/26/25.
//

import SwiftUI

/// 칩(Chip) 모양의 버튼 스타일을 적용하는 ViewModifier
struct ChipButtonModifier: ViewModifier {
    let isSelected: Bool

    func body(content: Content) -> some View {
        content
            .font(Font.createFont(weight: .medium, size: 14))
            .foregroundColor(CustomColor.grayColor.g500)
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)
            .padding(.horizontal, 16)
            .frame(height: 40)
            .background(isSelected ? Color.blue : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.gray, lineWidth: 1 / UIScreen.main.scale)
            )
            .cornerRadius(24)
    }
}

extension View {
    func chipButtonStyle(isSelected: Bool) -> some View {
        self.modifier(ChipButtonModifier(isSelected: isSelected))
    }
}
