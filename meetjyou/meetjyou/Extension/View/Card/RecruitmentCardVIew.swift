//
//  RecruitmentCardVIew.swift
//  meetjyou
//
//  Created by 박재형 on 3/28/25.
//

import SwiftUI

/// 내가 쓴 모집글 카드 UI
struct RecruitmentCardView: View {
    let imageName: String
    let title: String
    let subTitle: String
    let timeInfo: String

    var body: some View {
        HStack(spacing: 8) {
            // 왼쪽 이미지 (상하 15pt 여백을 고려하여 높이 90pt)
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipped()
                .cornerRadius(4)
            
            // 오른쪽 텍스트 영역
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(Font.createFont(weight: .medium, size: 16))
                    .foregroundColor(CustomColor.grayColor.g900)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Spacer().frame(height: 12) // 첫번째와 두번째 텍스트 사이 12pt
                
                Text(subTitle)
                    .font(Font.createFont(weight: .regular, size: 14))
                    .foregroundColor(CustomColor.grayColor.g700)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer().frame(height: 16) // 두번째와 세번째 텍스트 사이 16pt
                
                Text(timeInfo)
                    .font(Font.createFont(weight: .regular, size: 14))
                    .foregroundColor(CustomColor.grayColor.g400)
                    .lineLimit(1)
            }
            .padding(.vertical, 15) // 텍스트 영역 상하 15pt
            .frame(maxWidth: 250, alignment: .leading)
        }
        .frame(height: 120) // 카드 전체 높이 120pt
        .padding(.horizontal, 8) // 카드 내부 좌우 여백
        .frame(maxWidth: .infinity) // 카드 컨테이너가 가능한 전체 너비를 사용하도록 함
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1 / UIScreen.main.scale)
        )
        .cornerRadius(8)
        .padding(.horizontal, 20) // 좌우 SafeArea 기준 20pt 여백
    }
}
