//
//  DailyReportData.swift
//  kko_okk
//
//  Created by ian on 2022/06/09.
//

import SwiftUI

struct DailyReportData: Identifiable {
    var id = UUID()
    var progress: CGFloat
    var assignment: String
    var keyColor: Color
}
