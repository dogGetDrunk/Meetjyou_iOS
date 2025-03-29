import SwiftUI

enum MyPostsViewState {
    case `default`         // 기본 상태 (모집글 있음)
    case empty             // 모집글이 없을 때
    case selectionMode     // 선택 모드 (여러 항목 선택 가능)
    case deletionCompleted // 모집글 삭제 작업 완료 후
}

struct MyPostsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isSelectionMode: Bool = false
    @State private var selectedPostIDs: Set<Int> = []
    @State private var showDeletePopup: Bool = false
    
    @State private var posts: [RecruitmentPost] = [
        RecruitmentPost(
            id: 1,
            imageName: "sampleImage",
            title: "제주도 여행 멤버 모집! 함께 떠나요",
            subTitle: "안녕하세요! 제주도에서 여유롭고 힐링되는 여행을 함께해요",
            timeInfo: "3일 전 · 조회수 24"
        ),
        RecruitmentPost(
            id: 2,
            imageName: "sampleImage",
            title: "서울 번개 모임",
            subTitle: "급하게 사람 모집합니다",
            timeInfo: "1일 전 · 조회수 42"
        )
    ]
    
    var body: some View {
        ZStack {
            if posts.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "tray")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .foregroundColor(.gray)
                    Text("작성한 모집글이 없어요")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom, 80)
                
                VStack {
                    Spacer()
                    Button(action: {
                        showDeletePopup = true
                    }) {
                        Text(posts.isEmpty ? "모집 글 작성하러 가기" : "삭제")
                            .font(Font.createFont(weight: .semiBold, size: 16))
                            .frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(CustomColor.primaryColor.p100)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                            .padding(.horizontal, 20)
                            .safeAreaInset(edge: .bottom) {
                                Color.clear.frame(height: 16)
                            }
                    }
                }
            } else {
                VStack(alignment: .leading, spacing: 1) {
                    HStack {
                        Text("총 \(posts.count)건")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        if isSelectionMode {
                            Spacer()
                            Button(action: {
                                if selectedPostIDs.count == posts.count {
                                    selectedPostIDs.removeAll()
                                } else {
                                    selectedPostIDs = Set(posts.map { $0.id })
                                }
                            }) {
                                Text("전체 선택")
                                    .font(Font.createFont(weight: .regular, size: 14))
                                    .foregroundColor(CustomColor.grayColor.g500)
                            }
                        }
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 20)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(posts, id: \.id) { post in
                                Group {
                                    if isSelectionMode {
                                        Button(action: {
                                            if selectedPostIDs.contains(post.id) {
                                                selectedPostIDs.remove(post.id)
                                            } else {
                                                selectedPostIDs.insert(post.id)
                                            }
                                        }) {
                                            RecruitmentCardView(
                                                imageName: post.imageName,
                                                title: post.title,
                                                subTitle: post.subTitle,
                                                timeInfo: post.timeInfo
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(selectedPostIDs.contains(post.id) ? Color.blue : Color.clear, lineWidth: 2)
                                            )
                                        }
                                    } else {
                                        RecruitmentCardView(
                                            imageName: post.imageName,
                                            title: post.title,
                                            subTitle: post.subTitle,
                                            timeInfo: post.timeInfo
                                        )
                                    }
                                }
                            }
                        }
                        .padding(.top, 12)
                        .padding(.bottom, 8)
                    }
                    
                    if isSelectionMode {
                        Button(action: {
                            showDeletePopup = true
                        }) {
                            Text(posts.isEmpty ? "모집 글 작성하러 가기" : "삭제")
                                .font(Font.createFont(weight: .semiBold, size: 16))
                                .frame(height: 48)
                                .frame(maxWidth: .infinity)
                                .background(CustomColor.primaryColor.p100)
                                .foregroundColor(.white)
                                .cornerRadius(4)
                                .padding(.horizontal, 20)
                                .safeAreaInset(edge: .bottom) {
                                    Color.clear.frame(height: 16)
                                }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(isSelectionMode ? "내가 쓴 모집글 선택모드" : "내가 쓴 모집글", displayMode: .inline)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image("arrow-left")
                    .renderingMode(.template)
                    .foregroundColor(CustomColor.grayColor.g900)
            },
            trailing: Button(action: {
                if isSelectionMode {
                    isSelectionMode = false
                    selectedPostIDs.removeAll()
                } else {
                    isSelectionMode = true
                }
            }) {
                Text(isSelectionMode ? "취소" : "선택")
                    .font(Font.createFont(weight: .regular, size: 18))
                    .foregroundColor(CustomColor.grayColor.g900)
            }
        )
        .navigationBarBackButtonHidden(true)
        .showDeleteConfirmPopup(
            isPresented: $showDeletePopup,
            onConfirm: {
                posts.removeAll { selectedPostIDs.contains($0.id) }
                selectedPostIDs.removeAll()
                isSelectionMode = false
            },
            onCancel: {
                showDeletePopup = false
            }
        )
    }
}

/// 간단한 데이터 모델 예시
struct RecruitmentPost: Identifiable {
    let id: Int
    let imageName: String
    let title: String
    let subTitle: String
    let timeInfo: String
}

struct MyPostsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyPostsView()
        }
    }
}
