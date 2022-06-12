//
//  EditRepeatingDaysOfPromiseView.swift
//  kko_okk
//
//  Created by 임성균 on 2022/06/10.
//

import SwiftUI

struct EditRepeatingDaysOfPromiseView: View {
    // 임시 날짜 데이터 받아오기
    @Binding var repeatedDaysOfWeekDict: [String: Bool]
    
    // 날짜가 선택되었을 때 버튼의 색을 결정하기 위해 subject 값을 받아오기
    var subject: Subject
    
    var body: some View {
        VStack {
            // 제목, 내용 수정 타이틀
            HStack {
                Text("반복")
                    .font(Font.Kkookk.popoverTitle)
                Spacer()
            }
            
            // 반복 날짜 선택 버튼
            HStack {
                ForEach(Array(repeatedDaysOfWeekDict.keys), id: \.self) { key in
                    Button(action: {
                        repeatedDaysOfWeekDict[key]?.toggle()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 40)
                                .foregroundColor(repeatedDaysOfWeekDict[key] ?? false ? getPointColor(subject: subject) : Color.Kkookk.unselectedTabGray)
                                .cornerRadius(10, antialiased:  true)
                            Text(key)
                                .font(Font.Kkookk.popoverDays)
                                .foregroundColor(repeatedDaysOfWeekDict[key] ?? false ? Color.Kkookk.commonWhite : Color.Kkookk.commonBlack)
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
