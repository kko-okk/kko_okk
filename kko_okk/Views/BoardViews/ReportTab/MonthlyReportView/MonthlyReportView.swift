//
//  MonthlyReportView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/13.
//

import SwiftUI

struct MonthlyReportView: View {
    @EnvironmentObject var pickedDate: PickedDate
    var monthlyDataTasks: [MonthlyReportDataTaskMetaData]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                CustomDatePicker(monthlyReportDataTasks: monthlyDataTasks)
            }
            .padding(.vertical)
        }
    }
    
    init(dailyPromises: FetchedResults<Promise>, pickedDate: PickedDate) {
        let todayDate: Int = Int(DailyDate.monthformat.string(from: Date()))!
        
        let endDateOftheMonth: Date = Calendar.current.startOfDay(for: pickedDate.date).endOftheMonth(now: pickedDate.date)
        
        let endDayOftheMonth: Int = Int(DailyDate.monthformat.string(from: endDateOftheMonth.dayOneDayBefore))!
        
        var montlyPromises: [[Promise]] = Array(repeating: [], count: endDayOftheMonth)
        
        var monthlyReportDataTasks: [MonthlyReportDataTaskMetaData] = []
        
        for i in (0..<dailyPromises.count) {
            let indexOfDate: Int = Int(DailyDate.monthformat.string(from: dailyPromises[i].madeTime))!
            montlyPromises[indexOfDate].append(dailyPromises[i])
        }
        
        for i in (0..<montlyPromises.count) {
            if !montlyPromises[i].isEmpty {
                let data: MonthlyReportDataTaskMetaData = MonthlyReportDataTaskMetaData(task: montlyPromises[i], taskDate: getSampleDate(offset: i-todayDate))
                monthlyReportDataTasks.append(data)
            }
        }
        
        monthlyDataTasks = monthlyReportDataTasks
    }
}

//struct MonthlyReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        MonthlyReportView()
//    }
//}
