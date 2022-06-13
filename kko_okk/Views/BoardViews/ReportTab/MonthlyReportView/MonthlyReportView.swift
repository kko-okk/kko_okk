//
//  MonthlyReportView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/13.
//

import SwiftUI

struct MonthlyReportView: View {
    @State var currentDate: Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
    }
}

struct MonthlyReportView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyReportView()
    }
}
