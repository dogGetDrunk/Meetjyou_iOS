//
//  ProfileEditView.swift
//  meetjyou
//
//  Created by 박재형 on 3/18/25.
//

import SwiftUI

// MARK: - ChipButtonView

struct ChipButtonView: View {
    let title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Text(title)
                .font(Font.createFont(weight: .medium, size: 14))
                .chipButtonStyle(isSelected: isSelected)
        }
    }
}

struct ProfileEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var nickname: String = ""
    @State private var introduction: String = ""
    
    // 단일 선택 상태
    @State private var selectedGender: String? = nil
    @State private var selectedAge: String? = nil
    // 다중 선택 상태
    @State private var selectedPersonality: Set<String> = []
    @State private var selectedTravelStyle: Set<String> = []
    
    // 옵션 배열
    private let genderOptions = ["남성", "여성", "기타"]
    private let ageOptions = ["10대", "20대", "30대", "40대", "50대 이상"]
    private let personalityOptions = ["내성적인", "외향적인", "사교적인", "신중한",
                                      "낙천적인", "자유로운", "실용적인", "대담한",
                                      "활발한", "유머러스한", "진지한", "독립적인",
                                      "계획적인", "즉흥적인"]
    private let travelStyleOptions = ["액티비티", "힐링/휴식", "문화/역사", "스포츠",
                                      "맛집탐방", "가성비", "럭셔리", "모험",
                                      "자연", "도시", "예술", "쇼핑"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // 프로필 이미지
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 80, height: 80)
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.top, 16)
                
                // 닉네임 영역
                VStack(alignment: .leading, spacing: 4) {
                    Text("닉네임")
                        .font(Font.createFont(weight: .medium, size: 14))
                        .foregroundColor(CustomColor.grayColor.g500)
                    
                    TextField("닉네임", text: $nickname)
                        .padding(.horizontal, 12)
                        .frame(height: 50)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(CustomColor.grayColor.g300, lineWidth: 1 / UIScreen.main.scale)
                        )
                        .cornerRadius(4)
                    
                    HStack {
                        Spacer()
                        Text("(\(nickname.count)/8자)")
                            .font(Font.createFont(weight: .regular, size: 14))
                            .foregroundColor(CustomColor.grayColor.g400)
                    }
                }
                .padding(.top, 24)
                
                // 한 줄 소개 영역
                VStack(alignment: .leading, spacing: 4) {
                    Text("한 줄 소개")
                        .font(Font.createFont(weight: .regular, size: 14))
                        .foregroundColor(CustomColor.grayColor.g400)
                    
                    TextField("소개글", text: $introduction)
                        .padding(.horizontal, 12)
                        .frame(height: 50)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(CustomColor.grayColor.g300, lineWidth: 1 / UIScreen.main.scale)
                        )
                        .cornerRadius(4)
                    
                    HStack {
                        Spacer()
                        Text("(\(introduction.count)/30자)")
                            .font(Font.createFont(weight: .medium, size: 14))
                            .foregroundColor(CustomColor.grayColor.g400)
                    }
                }
                .padding(.top, 12)
                
                // 내 여행스타일 설정 (기존)
                VStack(alignment: .leading, spacing: 8) {
                    Text("내 여행스타일 설정")
                        .font(Font.createFont(weight: .medium, size: 14))
                        .foregroundColor(CustomColor.grayColor.g500)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Rectangle()
                        .fill(CustomColor.grayColor.g75)
                        .frame(height: 1 / UIScreen.main.scale)
                }
                .padding(.top, 8)
                
                // 성별 (단일 선택)
                SingleSelectionCategoryView(title: "성별", options: genderOptions, selectedOption: $selectedGender)
                    .padding(.top, 16)
                
                // 나이 (단일 선택)
                SingleSelectionCategoryView(title: "나이", options: ageOptions, selectedOption: $selectedAge)
                    .padding(.top, 16)
                
                // 성격 (다중 선택)
                MultipleSelectionCategoryView(title: "성격", options: personalityOptions, selectedOptions: $selectedPersonality)
                    .padding(.top, 16)
                
                // 여행 스타일 (다중 선택)
                MultipleSelectionCategoryView(title: "여행 스타일", options: travelStyleOptions, selectedOptions: $selectedTravelStyle)
                    .padding(.top, 16)
                    .padding(.bottom, 20)
                
            }
            .frame(maxWidth: .infinity)  // 내부 VStack이 전체 너비를 사용하도록
            .padding(.horizontal, 20)    // 여기서 좌우 20pt 패딩 적용
        }
        .navigationBarTitle("프로필 수정", displayMode: .inline)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image("arrow-left")
                    .renderingMode(.template)
                    .foregroundColor(CustomColor.grayColor.g900)
            },
            trailing: Button(action: {
                // 저장 액션
            }) {
                Text("저장")
                    .font(Font.createFont(weight: .regular, size: 18))
                    .foregroundColor(CustomColor.grayColor.g900)
            }
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct SingleSelectionCategoryView: View {
    let title: String
    let options: [String]
    @Binding var selectedOption: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(Font.createFont(weight: .medium, size: 16))
                .foregroundColor(CustomColor.grayColor.g700)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 12) {
                ForEach(options, id: \.self) { option in
                    ChipButtonView(title: option, isSelected: Binding(
                        get: { selectedOption == option },
                        set: { newValue in
                            selectedOption = newValue ? option : nil
                        }
                    ))
                }
            }
        }
    }
}

struct MultipleSelectionCategoryView: View {
    let title: String
    let options: [String]
    @Binding var selectedOptions: Set<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(Font.createFont(weight: .medium, size: 16))
                .foregroundColor(CustomColor.grayColor.g700)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(
                // 1) 최소 너비를 80으로 지정해, 버튼이 너무 작아지지 않도록
                columns: [GridItem(.adaptive(minimum: 80), spacing: 8)],
                // 2) 행(줄) 간 간격은 12
                spacing: 12
            ) {
                ForEach(options, id: \.self) { option in
                    ChipButtonView(
                        title: option,
                        isSelected: Binding(
                            get: { selectedOptions.contains(option) },
                            set: { newValue in
                                if newValue {
                                    selectedOptions.insert(option)
                                } else {
                                    selectedOptions.remove(option)
                                }
                            }
                        )
                    )
                }
            }
        }
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Group {
                ProfileEditView()
                    .previewDevice("iPhone SE (3rd generation)")
                
                ProfileEditView()
                    .previewDevice("iPhone 14 Pro")
            }
        }
    }
}
