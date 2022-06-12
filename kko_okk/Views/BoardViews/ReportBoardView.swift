//
//  ReportBoardView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/02.
//

import SwiftUI

struct ReportBoardView: View {
    var body: some View {
        VStack {
            DailyReportView()
            WeeklyReportView()
        }
    }
}

struct ReportBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ReportBoardView()
    }
}
