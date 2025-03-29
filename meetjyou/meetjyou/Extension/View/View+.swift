//
//  View+.swift
//  meetjyou
//
//  Created by LJh on 3/29/25.
//
import SwiftUI
import UIKit

extension View {
    func chipButtonStyle(isSelected: Bool) -> some View {
        self.modifier(ChipButtonModifier(isSelected: isSelected))
    }
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func showDeleteConfirmPopup(
        isPresented: Binding<Bool>,
        onConfirm: @escaping () -> Void,
        onCancel: @escaping () -> Void
    ) -> some View {
        self.showPopupView(
            isPresented: isPresented,
            message: .confirm(message: "정말 삭제하시겠어요?\n삭제된 글은 되돌릴 수 없어요."),
            primaryAction: onConfirm,
            secondaryAction: onCancel
        )
    }

    func showLeaveConfirmPopup(
        isPresented: Binding<Bool>,
        onConfirm: @escaping () -> Void,
        onCancel: @escaping () -> Void
    ) -> some View {
        self.showPopupView(
            isPresented: isPresented,
            message: .confirm(message: "정말 나가시겠어요?\n이후에는 다시 참여할 수 없어요."),
            primaryAction: onConfirm,
            secondaryAction: onCancel
        )
    }
    func showPopupView(
        isPresented: Binding<Bool>,
        message: PopupType,
        primaryAction: @escaping () -> Void,
        secondaryAction: @escaping () -> Void
    ) -> some View {
        self.modifier(
            PopupModifier(
                isPresented: isPresented,
                popupType: message,
                primaryAction: primaryAction,
                secondaryAction: secondaryAction
            )
        )
    }
}

