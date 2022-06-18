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
    @Binding var isPressedSettingButton: Bool
    @EnvironmentObject var pickedDate: PickedDate
    
    var body: some View {
        VStack(alignment: .leading){
            
            // Custom Tab Bar 만들기 (ex. 약속 만들기, 약속 리포트(이행률) 보기, 설정)
                HStack{
                    
                    Button(action: {
                        
                        isShowingTodoBoard.toggle()
                        
                        if (isShowingReportBoard) {
                            isShowingReportBoard.toggle()
                        }
                        
                    }, label: {
                        Text("약속 만들기")
                            .foregroundColor(isShowingTodoBoard ? .Kkookk.commonBlack : .Kkookk.unselectedTabGray)
                            .font(Font.Kkookk.boardTabSelected)
                        
                    })
                    .animation(.default, value: isShowingTodoBoard)
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        
                        isShowingReportBoard.toggle()
                        
                        if (isShowingTodoBoard) {
                            isShowingTodoBoard.toggle()
                        }

                    }, label: {
                        Text("이행률 보기")
                            .foregroundColor(isShowingReportBoard ? .Kkookk.commonBlack : .Kkookk.unselectedTabGray)
                            .font(Font.Kkookk.boardTabSelected)
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
                    
                }.padding(15)
            
            // 임시 Divider
            Divider()
            
            // Tab에 따라 보여줄 Board
            if (isShowingTodoBoard) {
                TodoBoardView()
            } else {
                ReportBoardView(startDate: pickedDate.date)
            }
            
        }.padding(26)
        
    }
}

//
//struct BoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SegmentView(isPressedSettingButton: $isPre)
//    }
//}
