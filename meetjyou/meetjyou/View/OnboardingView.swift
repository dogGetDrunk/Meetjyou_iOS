//
//  OnboardingView.swift
//  meetjyou
//
//  Created by LJh on 2/20/25.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {
    let store: StoreOf<KakaoFeature>
    @State private var currentPage = 0
    @State private var isAppeared = false

    private let pages: [AnyView] = [
        AnyView(
            FirstOnboarding()
        ),
        AnyView(
            SecondOnboarding()
        ),
        AnyView(
            ThirdOnboarding()
        ),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            TabView(selection: $currentPage) {
                ForEach(pages.indices, id: \.self) { index in
                    pages[index]
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .animation(.easeInOut(duration: 0.3), value: currentPage)
            
            HStack(spacing: 8) {
                ForEach(pages.indices, id: \.self) { index in
                    Circle()
                        .fill(index != currentPage ? Color(hex: "#D9D9D9") : Color(hex: "#6F6F6F"))
                        .frame(width: 8, height: 8)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: currentPage)
            
            if currentPage == 2 {
                VStack(spacing: 0) {
                    Button {
                        store.send(.kakaoTest)
                    } label: {
                        Text("카카오로")
                            .background(Color.black)
                    }
                    .frame(width: 350, height: 54)
                    .background(Color.black)
                    .padding(.bottom, 16)
                    
                    Button {
                        
                    } label: {
                        Text("asd")
                    }
                    .frame(width: 350, height: 54)
                    .background(Color.black)
                    .padding(.bottom, 16)
                    Button {
                        
                    } label: {
                        Text("asd")
                            .background(Color.black)
                    }
                    .frame(width: 350, height: 54)
                    .background(Color.black)
                    .padding(.bottom, 16)
                }
                .padding(.top, 50)
                .offset(y: isAppeared ? 0 : 300)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.7)) {
                        isAppeared = true
                    }
                }
                .onDisappear {
                    isAppeared = false
                }
            }
            Spacer()
        }
    }
}
//
//#Preview {
//    OnboardingView()
//}

struct FirstOnboarding: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "bolt")
                .resizable()
                .scaledToFill() // 이미지가 뷰를 꽉 채우도록 설정
                .frame(width: 284, height: 274)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 24)) // 모서리 잘라내기
                .padding(.bottom, 27.5)

            Text("안녕하세요!")
                .font(.createFont(weight: .regular, size: 25.5))
                .padding(.bottom, 16)
            Text("저는 만쥬에요 만나서 반가워요!")
                .font(.createFont(weight: .regular, size: 17))
                .foregroundStyle(CustomColor.grayColor.g500)
                .padding(.bottom,7)
            Text("함께 할 멋진 여행을 준비했어요.")
                .font(.createFont(weight: .regular, size: 17))
                .foregroundStyle(CustomColor.grayColor.g500)
                
        }
    }
}

struct SecondOnboarding: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "bolt")
                .resizable()
                .scaledToFill()
                .frame(width: 284, height: 274)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.bottom, 27.5)
            
            Text("함께 떠나는 여행, 즐거움이 두 배!")
                .font(.createFont(weight: .regular, size: 25.5))
                .padding(.bottom, 16)
            Text("다양한 사람들과 여행을 계획하고")
                .font(.createFont(weight: .regular, size: 17))
                .foregroundStyle(CustomColor.grayColor.g500)
                .padding(.bottom, 7)
            Text("특별한 추억을 만들어 보세요.")
                .font(.createFont(weight: .regular, size: 17))
                .foregroundStyle(CustomColor.grayColor.g500)
        }
    }
}
struct ThirdOnboarding: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "bolt")
                .frame(width: 284, height: 274)
                .cornerRadius(24)
                .background(.black)
                .padding(.bottom, 27)
            Text("저와 함계 특별한 동행을 시작해볼까요?")
                .font(.createFont(weight: .regular, size: 16))
                .foregroundStyle(CustomColor.grayColor.g500)
            
        }
    }
}
