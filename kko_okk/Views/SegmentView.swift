//
//  BoardView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct SegmentView: View {
    @State private var isShowingTodoBoard = true
    @State private var isShowingReportBoard = false
    @State private var tabBarSize = CGSize()
    @State private var todoTabTextSize = CGSize()
    @State private var reportTabTextSize = CGSize()
    @Binding var isPressedSettingButton: Bool

    var body: some View {
        VStack(alignment: .leading){
            // MARK: - Custom Tab Bar
            ZStack{
                VStack{
                    Spacer()
                    // TODO: - 디바이더의 패딩 부분은 하드코딩 했습니다...
                    Divider()
                        .padding(.top, -16)
                        .padding([.leading, .trailing], 12)
                }
                .frame(height: tabBarSize.height)

                HStack{
                    Button(
                        action: {
                            if (!isShowingTodoBoard) {
                                isShowingTodoBoard.toggle()
                                isShowingReportBoard.toggle()
                            }
                        },
                        label: {
                            VStack{
                                Text("약속 만들기")
                                    .foregroundColor(isShowingTodoBoard ? .Kkookk.commonBlack : .Kkookk.unselectedTabGray)
                                    .font(Font.Kkookk.boardTabSelected)
                                    .readSize { textSize in
                                                    todoTabTextSize = textSize
                                                }
                                Rectangle()
                                    .foregroundColor(isShowingTodoBoard ? .Kkookk.commonBlack : .Kkookk.unselectedTabGray)
                                    .frame(width: todoTabTextSize.width, height: 2)
                            }
                        }
                    )
                    .animation(.default, value: isShowingTodoBoard)
                    .buttonStyle(.plain)

                    Button(action: {
                        if (!isShowingReportBoard) {
                            isShowingReportBoard.toggle()
                            isShowingTodoBoard.toggle()
                        }
                    }, label: {
                        VStack{
                            Text("이행률 보기")
                                .foregroundColor(isShowingReportBoard ? .Kkookk.commonBlack : .Kkookk.unselectedTabGray)
                                .font(Font.Kkookk.boardTabSelected)
                                .readSize { textSize in
                                                reportTabTextSize = textSize
                                            }
                            Rectangle()
                                .foregroundColor(isShowingReportBoard ? .Kkookk.commonBlack : .Kkookk.unselectedTabGray)
                                .frame(width: reportTabTextSize.width, height: 2)
                        }
                    })
                    .animation(.default, value: isShowingReportBoard)
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button(action: {
                        isPressedSettingButton.toggle()
                    }, label: {
                        Text("설정")
                            .foregroundColor(.Kkookk.commonBlack)
                            .font(Font.Kkookk.boardSettingButton)
                    })
                    
                }
                .padding(15)
                .readSize { tabSize in
                    tabBarSize = tabSize
                }
            }

            Spacer()
            // Tab에 따라 보여줄 Board
            if (isShowingTodoBoard) {
                TodoBoardView()
            } else {
                ReportBoardView()
            }
            
        }.padding(26)
     
            .background(Color.Kkookk.backgroundGray)
    }
}

extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
