//
//  s.swift
//  meetjyou
//
//  Created by LJh on 3/6/25.
//

import SwiftUI

struct MyPageView: View {
    // 메뉴 항목 배열 (모든 버튼은 동일 스타일 적용)
    let menuItems = ["내가 쓴 모집글", "환경설정", "공지사항", "FAQ"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) { // 기본 spacing 0으로 설정
                Spacer().frame(height: 16) // 네비게이션 타이틀과 프로필 이미지 사이 16 포인트
                
                // 프로필 이미지
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Spacer().frame(height: 8) // 프로필 이미지와 "도리" 텍스트 사이 8 포인트
                
                // 닉네임(도리)와 소개 문구
                VStack(spacing: 0) {
                    Text("도리")
                        .foregroundColor(CustomColor.grayColor.g900)
                        .font(Font.createFont(weight: .semiBold, size: 16))
                        .frame(width: 350, height: 22)
                    
                    Text("새로운 사람들을 만나는걸 선호해요!")
                        .foregroundColor(CustomColor.grayColor.g400)
                        .font(Font.createFont(weight: .regular, size: 14))
                        .frame(width: 347, height: 21)
                }
                
                Spacer().frame(height: 12) // 소개 문구와 프로필 수정 버튼 사이 12 포인트
                
                // 프로필 수정 버튼
                NavigationLink(destination: ProfileEditView()) {
                    Text("프로필 수정")
                        .font(Font.createFont(weight: .medium, size: 14))
                        .frame(width: 167, height: 42)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(CustomColor.primaryColor.p100, lineWidth: 1)
                        )
                }
                
                Spacer().frame(height: 24) // 프로필 수정 버튼과 메뉴 리스트 사이 24 포인트
                
                // 메뉴 버튼 리스트
                VStack(spacing: 24) {
                    ForEach(menuItems, id: \.self) { item in
                        Button(action: {
                            // 각 메뉴 버튼의 액션 구현
                        }) {
                            HStack(spacing: 18) {
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(CustomColor.grayColor.g500)
                                    .frame(width: 20)
                                Text(item)
                                    .foregroundColor(CustomColor.grayColor.g700)
                                    .font(Font.createFont(weight: .regular, size: 16))
                                    .frame(height: 24)
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
                
                Spacer() // 전체 VStack이 화면 중앙에 정렬되도록 아래쪽 Spacer 추가
            }
            .padding(.horizontal, 20) // 좌우 Safe Area 적용
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("마이페이지")
                        .font(.headline)
                }
            }
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
