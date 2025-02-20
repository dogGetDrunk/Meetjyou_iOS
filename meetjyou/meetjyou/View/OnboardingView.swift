//
//  OnboardingView.swift
//  meetjyou
//
//  Created by LJh on 2/20/25.
//

import ComposableArchitecture
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(systemName: "bolt")
                .frame(width: 284, height: 274)
                .cornerRadius(24)
            Spacer()
            
        }

    }
}

#Preview {
    OnboardingView()
}
