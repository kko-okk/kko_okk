//
//  EditRepeatingDaysOfPromiseView.swift
//  kko_okk
//
//  Created by 임성균 on 2022/06/10.
//

import SwiftUI

struct EditRepeatingDaysOfPromiseView: View {
    @Binding var repeatedDaysOfWeekDict: [String: Bool]
    
    var subject: Subject
    
    var body: some View {
        VStack {
            HStack {
                Text("반복")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
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
