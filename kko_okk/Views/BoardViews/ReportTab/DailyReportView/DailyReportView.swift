//
//  checkPromiseView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/16.
//

import SwiftUI

struct DailyReportView: View {
    // CoreData에 저장된 Promise 값 불러오기
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var fetchRequest: FetchedResults<Promise>
    
    var body: some View {
        GeometryReader { geometry in
            VStack() {
//MARK: 원형그래프 시작
                HStack{
                    HStack{
                        ZStack {
                            ForEach(fetchRequest[0].dailyDatas.indices, id: \.self) { index in
                                AnimatedDailyReportView(dailyReportData: dailyReportDatas[index], index: index,
                                                        lineWidth: .constant(geometry.size.height * 0.1),
                                                        circleHeight:  .constant(geometry.size.height * 0.7))
                            }.frame(width: geometry.size.height, height: geometry.size.height)
                        }
                        Spacer()
                    }
                
//MARK: 공간 분배를 위한 Spacer
                    Spacer()
                    
//MARK: 텍스트문구
                    HStack{
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("오늘의 약속률")
                                .font(.Kkookk.dailyReportViewMainCell)
                                .fontWeight(.semibold)
    
                            ForEach(dailyReportDatas) { dailyReportData in
                                Label {
                                    HStack{
                                        Text(dailyReportData.assignment)
                                            .font(.Kkookk.dailyReportViewContentCell)
                                        Spacer()
                                        Text("\(Int(dailyReportData.progress))%")
                                            .font(.Kkookk.dailyReportViewContentCell)
                                            .foregroundColor(.gray)
                                    }
                                } icon: {
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(dailyReportData.keyColor)
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
                .fill(.white)
        }
    }
}




