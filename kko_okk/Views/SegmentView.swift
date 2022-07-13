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
    @EnvironmentObject var pickedDate: PickedDate
    
    var body: some View {
        VStack(alignment: .leading){
            // MARK: - Custom Tab Bar
            ZStack{
                VStack{
                    Spacer()
                    Rectangle()
                        .foregroundColor(Color(hex: "DDDDDD"))
                        .frame(height: 2)
                        .padding(.top, -17)
                    //TODO: 기존 디바이더를 삭제하고 선택 되었을 때사용된 커스텀 디바이더 (Rectangle사용)
                }
                .frame(height: tabBarSize.height)
                
                HStack{
                    //MARK: 리팩토링 시 참고사항
                    //약속만들기 버튼과 이행률 보기 버튼은 기본적으로 동일한 구조를 가지고 있다.
                    //에셋을 처럼 사용하면 코드를 줄일 수 있을 것 같습니다.
                    
                    Button(
                        action: {
                            if (!isShowingTodoBoard) {
                                isShowingTodoBoard.toggle()
                                isShowingReportBoard.toggle()
                            }
                        },
                        label: {
                            VStack{
                                Text("SegmentMakePromise".localized)
                                    .foregroundColor(isShowingTodoBoard ? .Kkookk.commonBlack : .Kkookk.unselectedTabGray)
                                    .font(Font.Kkookk.boardTabSelected)
                                    .readSize { textSize in
                                        todoTabTextSize = textSize
                                    }
                                Rectangle()
                                    .foregroundColor(isShowingTodoBoard ? .Kkookk.commonBlack : .clear)
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
                            Text("SegmentFulfillmentRateView".localized)
                                .foregroundColor(isShowingReportBoard ? .Kkookk.commonBlack : .Kkookk.unselectedTabGray)
                                .font(Font.Kkookk.boardTabSelected)
                                .readSize { textSize in
                                    reportTabTextSize = textSize
                                }
                            Rectangle()
                                .foregroundColor(isShowingReportBoard ? .Kkookk.commonBlack : .clear)
                                .frame(width: reportTabTextSize.width, height: 2)
                        }
                    })
                    .animation(.default, value: isShowingReportBoard)
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
//  TODO: Setting Button 설정버튼 주석 7.13일 -Ruyha-
//                    Button(action: { isPressedSettingButton.toggle() },
//                           label: {
//                        HStack(alignment:.bottom,spacing: 1){
//                            Image(systemName: "gearshape.fill")
//                                .foregroundColor(.Kkookk.commonBlack)
//                                .font(Font.Kkookk.boardSettingButtonIcon)
//                            Text("Setting".localized)
//                                .foregroundColor(.Kkookk.commonBlack)
//                                .font(Font.Kkookk.boardSettingButton)
//                        }
//                    })
                }
                .padding(.vertical,15)
                .readSize { tabSize in
                    tabBarSize = tabSize
                }
//                .background(Color.red)
            }
            
            Spacer()
            // Tab에 따라 보여줄 Board
            if (isShowingTodoBoard) {
                TodoBoardView()
            } else {
                ReportBoardView(startDate: pickedDate.date)
            }
        }.padding(.horizontal,HeaderViewConst.shared.kkookkPading)
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
