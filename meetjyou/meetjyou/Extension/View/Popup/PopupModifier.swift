//
//  PopupView.swift
//  meetjyou
//
//  Created by 박재형 on 3/25/25.
//

import SwiftUI

public struct PopupModifier: ViewModifier {
    @Binding var isPresented: Bool
    let popupType: PopupType
    let primaryAction: () -> Void
    let secondaryAction: () -> Void
    @EnvironmentObject var tabbarStore: TabBarStore
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            ZStack {
                if isPresented {
                    Rectangle()
                        .fill(.black.opacity(0.7))
                        .ignoresSafeArea()
                        .onTapGesture {
                            self.isPresented = false
                            tabbarStore.isOpacity = false
                        }
                    
                    PopupView(
                        isPresented: self.$isPresented,
                        popupType: self.popupType,
                        primaryAction: self.primaryAction,
                        secondaryAction: self.secondaryAction
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(
                isPresented
                ? .spring(response: 0.3)
                : .none,
                value: isPresented
            )
        }
    }
}

extension View {
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
enum PopupType {
    case confirm(message: String)
    // 필요 시 case warning, error 등 확장 가능
}

final class TabBarStore: ObservableObject {
    @Published var isOpacity: Bool = false
}

struct PopupView: View {
    @Binding var isPresented: Bool
    let popupType: PopupType
    let primaryAction: () -> Void
    let secondaryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            if case let .confirm(message) = popupType {
                Text(message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)

                HStack(spacing: 12) {
                    Button("아니오") {
                        secondaryAction()
                        isPresented = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                    Button("네") {
                        primaryAction()
                        isPresented = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(CustomColor.primaryColor.p100)
                    .foregroundColor(.white)
                    .cornerRadius(4)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .frame(height: 170)
        .padding(.horizontal, 25)
        .shadow(radius: 8)
    }
}

//

extension View {
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
}
