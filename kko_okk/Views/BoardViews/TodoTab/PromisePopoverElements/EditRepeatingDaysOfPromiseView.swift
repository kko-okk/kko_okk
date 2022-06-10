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
    let daysOfWeek: [String] = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]
    
    // 날짜가 선택되었을 때 버튼의 색을 결정하기 위해 subject 값을 받아오기
    var subject: Subject
    
    var body: some View {
        VStack {
            // 제목, 내용 수정 타이틀
            HStack {
                Text("반복")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            // 반복 날짜 선택 버튼
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Button(action: {
                        isRepeating[index].toggle()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 40)
                                .foregroundColor(isRepeating[index] ? getPointColor(subject: subject) : Color.Kkookk.unselectedTabGray)
                                .cornerRadius(10, antialiased:  true)
                            Text(daysOfWeek[index])
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
