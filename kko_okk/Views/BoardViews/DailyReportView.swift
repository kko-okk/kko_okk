//
//  DailyReportView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/02.
//

import SwiftUI

struct DailyReportView: View {
    var body: some View {
        ZStack {
            ForEach(dailyReportDatas.indices, id: \.self) { index in
                ZStack {
                    Circle()
                        .stroke(.gray.opacity(0.3), lineWidth: 30)
                    Circle()
                        .trim(from: 0, to: dailyReportDatas[index].progress / 100)
                        .stroke(dailyReportDatas[index].keyColor, style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.init(degrees: -90))
                }
                .padding(CGFloat(index) * 37)
            }
        }
        .frame(width: 170, height: 170)
    }
}

struct DailyReportView_Previews: PreviewProvider {
    static var previews: some View {
        DailyReportView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
