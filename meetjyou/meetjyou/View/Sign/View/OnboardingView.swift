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
                        
                    } label: {
                        HStack(spacing: 0) {
                            Image("logo_google")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .padding(.leading, 14)
                            
                            Text("구글 계정으로 로그인")
                                .font(.createFont(weight: .medium, size: 16))
                                .foregroundStyle(CustomColor.grayColor.g900)
                                .padding(.leading, 74)
                            Spacer()
                            
                        }
                    }
                    .frame(width: 350, height: 54)
                    .background(.white)
                    .cornerRadius(14, corners: .allCorners)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(CustomColor.grayColor.g100, lineWidth: 1)
                    )
                    .padding(.bottom, 16)
                    
                    
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 0) {
                            Image("logo_kakao")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 23, height: 38)
                                .padding(.leading, 14)
                            
                            Text("카카오 계정으로 로그인")
                                .font(.createFont(weight: .medium, size: 16))
                                .foregroundStyle(CustomColor.grayColor.g900)
                                .padding(.leading, 74)
                            Spacer()
                            
                        }
                    }
                    .frame(width: 350, height: 54)
                    .background(Color(hex: "#F4E70D"))
                    .cornerRadius(14, corners: .allCorners)
                    .padding(.bottom, 16)
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 0) {
                            Image("logo_apple")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 23, height: 38)
                                .padding(.leading, 14)
                                                            
                            Text("애플 계정으로 로그인")
                                .font(.createFont(weight: .medium, size: 16))
                                .foregroundStyle(.white)
                                .padding(.leading, 74)
                            Spacer()
                            
                        }
                    }
                    .frame(width: 350, height: 54)
                    .background(CustomColor.grayColor.g900)
                    .cornerRadius(14, corners: .allCorners)
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
#Preview {
    OnboardingView(store: Store(initialState: KakaoFeature.State(), reducer: {
        
    }
                               )
    )
}

struct FirstOnboarding: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("OnboardingImage_1")
                .resizable()
                .scaledToFit()
                .frame(width: 284, height: 274)
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
            Image("OnboardingImage_2")
                .resizable()
                .scaledToFit()
                .frame(width: 284, height: 274)
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
            Image("OnboardingImage_3")
                .resizable()
                .scaledToFit()
                .frame(width: 284, height: 274)
                .cornerRadius(24)
                .padding(.bottom, 27)
            Text("저와 함계 특별한 동행을 시작해볼까요?")
                .font(.createFont(weight: .regular, size: 16))
                .foregroundStyle(CustomColor.grayColor.g500)
            
        }
    }
}
