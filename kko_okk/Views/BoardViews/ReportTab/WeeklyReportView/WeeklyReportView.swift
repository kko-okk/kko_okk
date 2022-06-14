//
//  WeeklyReportView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/10.
//

import SwiftUI

struct WeeklyReportView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("한 주간 약속률")
                    .font(.Kkookk.weeklyReportViewMainCell)
                Spacer()
                ForEach(commonWeeklyReportDatas) { commonWeeklyReportData in
                    Label {
                        HStack(alignment: .bottom, spacing: 20) {
                            Text(commonWeeklyReportData.assignment)
                                .font(.Kkookk.dailyReportViewContentCell)
                        }
                    } icon: {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(commonWeeklyReportData.keyColor)
                    }
                }
            }
            BarGraph(parentWeeklyReportDatas: parentWeeklyReportDatas, childWeeklyReportDatas: childrenWeeklyReportDatas)
        }
    }
}

struct WeeklyReportView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyReportView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
