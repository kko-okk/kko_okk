//
//  checkPromiseView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/16.
//

import SwiftUI

struct DailyReportView: View {
    // CoreData에 저장된 Promise 값 불러오기
    private var dailyDatas: [DailyReportData] = []
    var daily: [Promise] = []
    
    @EnvironmentObject var pickedDate: PickedDate
    
    var body: some View {
        GeometryReader { geometry in
            VStack() {
//MARK: 원형그래프 시작
                HStack{
                    HStack{
                        ZStack {
                            ForEach(dailyDatas.indices, id: \.self) { index in
                                AnimatedDailyReportView(dailyReportData: dailyDatas[index], index: index,
                                                        lineWidth: .constant(geometry.size.height * 0.1),
                                                        circleHeight:  .constant(geometry.size.height * 0.5))
                            }.frame(width: geometry.size.height * 0.7, height: geometry.size.height)
                        }
                        Spacer()
                    }
                
//MARK: 공간 분배를 위한 Spacer
                    Spacer()
                    
//MARK: 텍스트문구
                    HStack{
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("DailyReportViewTitle".localized)
                                .font(.Kkookk.dailyReportViewMainCell)
                                .fontWeight(.semibold)
    
                            ForEach(dailyDatas) { dailyData in
                                Label {
                                    HStack{
                                        Text(dailyData.assignment)
                                            .font(.Kkookk.dailyReportViewContentCell)
                                        Spacer()
                                        Text("\(Int(dailyData.progress))%")
                                            .font(.Kkookk.dailyReportViewContentCell)
                                            .foregroundColor(Color.Kkookk.backgroundGray)
                                    }
                                } icon: {
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(dailyData.keyColor)
                                }
                            }
                        }
                        .padding(.trailing,15)
                    }
                }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.Kkookk.commonWhite)
        }
    }
    // 해당 일의 약속을 받아옴
    init(dailyPromises: FetchedResults<Promise>, pickedDate: PickedDate) {
        let dailyPromises = dailyPromises.filter{ Calendar.current.startOfDay(for: pickedDate.date) <= $0.madeTime && $0.madeTime <=  Calendar.current.startOfDay(for: pickedDate.date).dayAfter }
        
        let parentPromises: [Promise] = dailyPromises.filter { $0.subject == "parent"}
        let childPromises: [Promise] = dailyPromises.filter { $0.subject == "child"}
        
        let parentDoneCount: Int = parentPromises.filter { $0.isDone == true }.count
        let childDoneCount: Int = childPromises.filter { $0.isDone == true }.count
        
        let parentProgress: CGFloat = parentPromises.count != 0 ? CGFloat(Double(parentDoneCount) / Double(parentPromises.count) * 100) : 0
        let childProgress: CGFloat = childPromises.count != 0 ? CGFloat(Double(childDoneCount) / Double(childPromises.count) * 100) : 0
 
        dailyDatas = [
            DailyReportData(progress: parentProgress, assignment: "LocalizingParent".localized, keyColor: Color("kkookkPurple")),
            DailyReportData(progress: childProgress, assignment: "LocalizingChild".localized, keyColor: Color("kkookkGreen"))
        ]
    }
}
