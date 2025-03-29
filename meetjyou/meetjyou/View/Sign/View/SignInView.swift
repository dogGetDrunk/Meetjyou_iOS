//
//  SignInView.swift
//  meetjyou
//
//  Created by LJh on 3/29/25.
//

import SwiftUI

struct SignInView: View {
    @State var nickName: String = ""
    var body: some View {
        VStack(spacing: 0) {
            Image("empty_profile_1x")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "camera.fill")
                        .frame(width: 16, height: 16)
                        .padding(6)
                        .background(Circle().fill(Color.white))
                        .shadow(radius: 2)
                }
                .padding(.bottom, 24)
                
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("닉네임")
                        .font(.createFont(weight: .medium, size: 14))
                        .foregroundStyle(CustomColor.grayColor.g500)
                        .padding(.trailing, 4)
                    
                    Text("*")
                        .font(.createFont(weight: .medium, size: 14))
                        .foregroundStyle(CustomColor.primaryColor.p100)
                        .padding(.bottom, 4)
                    Spacer()
                }
                .padding(.bottom, 4)
                
                HStack(spacing: 0) {
                    TextField("닉네임을 입력하세요", text: $nickName)
                        .frame(height: 48)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(CustomColor.grayColor.g300, lineWidth: 1)
                        )
                        .cornerRadius(5)
                    Button {
                        
                    } label: {
                        Text("중복확인")
                            .font(.createFont(weight: .semiBold, size: 14))
                            .foregroundStyle(CustomColor.primaryColor.p100)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(width: 75, height: 56)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(CustomColor.primaryColor.p100, lineWidth: 1)
                    )
                    .cornerRadius(4)
                    .padding(.leading, 8)
                }
                
                HStack(spacing: 0) {
                    Text("공백 없이 최대 8자까지 입력 가능합니다.")
                        .font(.createFont(weight: .medium, size: 14))
                        .foregroundStyle(CustomColor.grayColor.g400)
                    Spacer()
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 0) {
                    Text("한 줄 소개")
                        .font(.createFont(weight: .medium, size: 14))
                        .foregroundStyle(CustomColor.grayColor.g500)
                        .padding(.trailing, 4)
                    
                    Spacer()
                }
                .padding(.bottom, 4)
                
                TextField("자신을 간단히 소개해주세요.", text: $nickName)
                    .frame(height: 48)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(CustomColor.grayColor.g300, lineWidth: 1)
                    )
                    .cornerRadius(5)
                    
                HStack(spacing: 0) {
                    Spacer()
                    Text("0/30") // 추후 변경해야함
                        .font(.createFont(weight: .regular, size: 14))
                        .foregroundStyle(CustomColor.grayColor.g400)
                        .padding(.top, 4)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("다음")
                        .font(.createFont(weight: .regular, size: 14))
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(CustomColor.primaryColor.p100)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                }
                .padding(.leading, 8)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    SignInView(nickName: "")
}
