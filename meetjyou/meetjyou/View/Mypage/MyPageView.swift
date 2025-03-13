//
//  s.swift
//  meetjyou
//
//  Created by LJh on 3/6/25.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // MARK: - 프로필 섹션
                VStack(spacing: 0) {
                    Spacer().frame(height: 16) // 네비게이션 타이틀과 프로필 사진 간격
                    
                    // 프로필 이미지 (100x100)
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    
                    Spacer().frame(height: 8) // 프로필 이미지와 닉네임 간격
                    
                    // 닉네임
                    Text("도리")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(CustomColor.grayColor.g900)
                    
                    Spacer().frame(height: 8) // 닉네임과 소개 문구 간격
                    
                    // 소개 문구
                    Text("새로운 사람들을 만나는걸 선호해요!")
                        .font(.subheadline)
                        .foregroundColor(CustomColor.grayColor.g400)
                    
                    Spacer().frame(height: 12) // 소개 문구와 버튼 간격
                    
                    // 프로필 수정 버튼
                    Button(action: {
                        // 프로필 수정 액션
                    }) {
                        Text("프로필 수정")
                            .font(.subheadline)
                            .foregroundColor(CustomColor.primaryColor.p100)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(CustomColor.primaryColor.p100), lineWidth: 1)
                            )
                    }
                }
                Spacer().frame(height: 24)
                
                
                // MARK: - 메뉴
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "doc.text.fill")
                            Text("내가 쓴 모집글")
                        }
                        .foregroundColor(CustomColor.grayColor.g700)

                        Spacer().frame(height: 24)
                    }
                    
                    HStack {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                            Text("환경설정")
                        }
                        .foregroundColor(CustomColor.grayColor.g700)

                        Spacer().frame(height: 24)
                    }
                    
                    HStack {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bell.fill")
                                .foregroundColor(CustomColor.grayColor.g700)
                            Text("공지사항")
                        }
                        .foregroundColor(CustomColor.grayColor.g700)

                        Spacer().frame(height: 24)
                    }
                    
                    HStack {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundColor(CustomColor.grayColor.g700)
                            Text("FAQ")
                        }
                        .foregroundColor(CustomColor.grayColor.g700)
                        
                        Spacer().frame(height: 24)
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("마이페이지", displayMode: .inline)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
