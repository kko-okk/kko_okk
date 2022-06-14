//
//  WeeklyReportView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/10.
//

import SwiftUI

struct DailyReportView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("오늘의 약속률")
                .font(.Kkookk.dailyReportViewMainCell)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.leading, -265)
            HStack {
                // 원형 그래프를 그립니다.
                ZStack {
                    ForEach(dailyReportDatas.indices, id: \.self) { index in
                        AnimatedDailyReportView(dailyReportData: dailyReportDatas[index], index: index)
                    }
                }
                .frame(width: 170, height: 170)
                
                // 그래프 옆 수치를 보여줍니다.
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(dailyReportDatas) { dailyReportData in
                        Label {
                            HStack(alignment: .bottom, spacing: 20) {
                                Text(dailyReportData.assignment)
                                    .font(.Kkookk.dailyReportViewContentCell)

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
                .padding(.leading, 50)
                .padding(.top, -15)
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
        }
    }
}

struct DailyReportView_Previews: PreviewProvider {
    static var previews: some View {
        DailyReportView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

struct AnimatedDailyReportView: View {
    var dailyReportData: DailyReportData
    var index: Int
    @State var showAnimated: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray.opacity(0.1), lineWidth: 30)
            
            Circle()
                .trim(from: 0, to: showAnimated ? dailyReportDatas[index].progress / 100 : 0)
                .stroke(dailyReportDatas[index].keyColor, style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                .rotationEffect(.init(degrees: -90))
        }
        .padding(CGFloat(index) * 37)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(Double(index) * 0.1)) {
                    showAnimated = true
                }
            }
        }
    }
}
