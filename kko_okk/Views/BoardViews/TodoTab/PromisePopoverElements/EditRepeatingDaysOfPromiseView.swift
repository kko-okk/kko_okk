//
//  EditRepeatingDaysOfPromiseView.swift
//  kko_okk
//
//  Created by 임성균 on 2022/06/10.
//

import SwiftUI

struct EditRepeatingDaysOfPromiseView: View {
    // 임시 날짜 데이터 받아오기
    @Binding var isRepeating: [Bool]
    
    // 요일 이름
    let daysOfWeek: [String] = ["Mon".localized, "Tue".localized,
                                "Wed".localized, "Thu".localized,
                                "Fri".localized, "Sat".localized,
                                "Sun".localized]
    
    // 날짜가 선택되었을 때 버튼의 색을 결정하기 위해 subject 값을 받아오기
    var subject: Subject
    
    //
    let popoverAssets = PopoverAssets()
    
    var body: some View {
        VStack {
            // 제목, 내용 수정 타이틀
            HStack {
                Text("Repeat".localized)
                    .font(Font.Kkookk.popoverTitle)
                    .padding(.horizontal, popoverAssets.popoverHorizontalTrailingPadding)
                Spacer()
            }
            
            
            // 반복 날짜 선택 버튼
            HStack(spacing: popoverAssets.popoverHorizontalPaddingBetweenButton) {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Button(action: {
                        isRepeating[index].toggle()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: popoverAssets.popoverDaysButtonWidth, height: popoverAssets.popoverDaysButtonHeight)
                                .foregroundColor(isRepeating[index] ? getPointColor(subject: subject) : Color.Kkookk.commonWhite)
                                .cornerRadius(10, antialiased:  true)
                            Text(daysOfWeek[index])
                                .font(Font.Kkookk.popoverDays)
                                .foregroundColor(isRepeating[index] ? Color.Kkookk.commonWhite : Color.Kkookk.commonBlack)
                        }
                    })
                }
            }
        }
    }
}

//struct EditRepeatingDaysOfPromiseView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditRepeatingDaysOfPromiseView()
//    }
//}
