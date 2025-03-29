//
//  s.swift
//  meetjyou
//
//  Created by LJh on 3/6/25.
//

import SwiftUI

struct MyPageView: View {
    let menuItems = ["내가 쓴 모집글", "환경설정", "공지사항", "FAQ"]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 0) {
                        // 프로필 이미지
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding(.top, 16)
                        
                        // 닉네임 + 소개문구
                        VStack(spacing: 8) {
                            Text("도리")
                                .foregroundColor(CustomColor.grayColor.g900)
                                .font(Font.createFont(weight: .semiBold, size: 16))
                                .frame(width: 350, height: 22)
                            
                            Text("새로운 사람들을 만나는걸 선호해요!")
                                .foregroundColor(CustomColor.grayColor.g400)
                                .font(Font.createFont(weight: .regular, size: 14))
                                .frame(width: 347, height: 21)
                        }
                        .padding(.top, 8)
                        
                        // 프로필 수정 버튼
                        NavigationLink(destination: ProfileEditView()) {
                            Text("프로필 수정")
                                .font(Font.createFont(weight: .medium, size: 14))
                                .frame(width: 167, height: 42)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(CustomColor.primaryColor.p100, lineWidth: 1)
                                )
                        }
                        .padding(.top, 12)
                        
                        // 메뉴 버튼 리스트
                        VStack(spacing: 24) {
                            let menuIcons = ["pencil", "settings", "loud speaker", "help"]
                            ForEach(0..<menuItems.count, id: \.self) { index in
                                if menuItems[index] == "내가 쓴 모집글" {
                                    // 내가 쓴 모집글로 이동
                                    NavigationLink(destination: MyPostsView()) {
                                        HStack(spacing: 18) {
                                            Image(menuIcons[index])
                                                .foregroundColor(CustomColor.grayColor.g500)
                                                .frame(width: 20)
                                            Text(menuItems[index])
                                                .foregroundColor(CustomColor.grayColor.g700)
                                                .font(Font.createFont(weight: .regular, size: 16))
                                                .frame(height: 24)
                                            Spacer()
                                        }
                                        .padding(.horizontal, 10)
                                    }
                                }
                                else {
                                    Button(action: {
                                        // 각 메뉴 버튼의 액션 구현
                                    }) {
                                        HStack(spacing: 18) {
                                            Image(menuIcons[index])
                                                .foregroundColor(CustomColor.grayColor.g500)
                                                .frame(width: 20)
                                            Text(menuItems[index])
                                                .foregroundColor(CustomColor.grayColor.g700)
                                                .font(Font.createFont(weight: .regular, size: 16))
                                                .frame(height: 24)
                                            Spacer()
                                        }
                                        .padding(.horizontal, 10)
                                    }
                                }
                            }
                        }
                        .padding(.top, 24)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity) // 내부 VStack 전체 너비 사용
                }
            }
            .padding(.horizontal, 20) // 상위 컨테이너에 좌우 20pt padding 적용
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("마이페이지")
                        .font(.headline)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MyPageView()
                .previewDevice("iPhone SE (3rd generation)")
            MyPageView()
                .previewDevice("iPhone 16 Pro")
        }
    }
}
