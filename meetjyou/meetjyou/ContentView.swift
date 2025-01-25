//
//  ContentView.swift
//  meetjyou
//
//  Created by LJh on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.createFont(weight: .black, size: 40))
                .foregroundStyle(CustomColor.SecondaryColor.secondary400)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

// 해야할거 API키
