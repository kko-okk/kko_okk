//
//  WeeklyReportView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/10.
//

import SwiftUI

struct WeeklyReportView: View {
    @EnvironmentObject var pickedDate: PickedDate
    var parentDatas: [ParentWeeklyReportData] = []
    var childrenDatas: [ChildrenWeeklyReportData] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("WeeklyReportViewTitle".localized)
                    .font(.Kkookk.dailyReportViewMainCell)
                Spacer()
                ForEach(commonWeeklyReportDatas) { commonWeeklyReportData in
                    Label {
                        HStack(alignment: .bottom) {
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
            BarGraph(parentWeeklyReportDatas: parentDatas, childrenWeeklyReportDatas: childrenDatas)
        }
        .padding(15)
    }
    
    init(dailyPromises: FetchedResults<Promise>, pickedDate: PickedDate) {
        parentDatas = [
            ParentWeeklyReportData(value: calcParentProgress(dailyPromises: dailyPromises, now: pickedDate.date.daySixDayBefore),
                                   monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                   dayData: DailyDate.monthformat.string(from: pickedDate.date.daySixDayBefore)),
            
            ParentWeeklyReportData(value: calcParentProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayFiveDayBefore),
                                   monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                   dayData: DailyDate.monthformat.string(from: pickedDate.date.dayFiveDayBefore)),
            
            ParentWeeklyReportData(value: calcParentProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayFourDayBefore),
                                   monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                   dayData: DailyDate.monthformat.string(from: pickedDate.date.dayFourDayBefore)),
            
            ParentWeeklyReportData(value: calcParentProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayThreeDayBefore),
                                   monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                   dayData: DailyDate.monthformat.string(from: pickedDate.date.dayThreeDayBefore)),
            
            ParentWeeklyReportData(value: calcParentProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayTwoDayBefore),
                                   monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                   dayData: DailyDate.monthformat.string(from: pickedDate.date.dayTwoDayBefore)),
            
            ParentWeeklyReportData(value: calcParentProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayOneDayBefore),
                                   monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                   dayData: DailyDate.monthformat.string(from: pickedDate.date.dayOneDayBefore)),
            
            ParentWeeklyReportData(value: calcParentProgress(dailyPromises: dailyPromises, now: pickedDate.date),
                                   monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                   dayData: DailyDate.monthformat.string(from: pickedDate.date)),
        ]
        
        childrenDatas = [
            ChildrenWeeklyReportData(value: calcChildProgress(dailyPromises: dailyPromises, now: pickedDate.date.daySixDayBefore),
                                     monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                     dayData: DailyDate.monthformat.string(from: pickedDate.date.daySixDayBefore)),
            
            ChildrenWeeklyReportData(value: calcChildProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayFiveDayBefore),
                                     monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                     dayData: DailyDate.monthformat.string(from: pickedDate.date.dayFiveDayBefore)),
            
            ChildrenWeeklyReportData(value: calcChildProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayFourDayBefore),
                                     monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                     dayData: DailyDate.monthformat.string(from: pickedDate.date.dayFourDayBefore)),
            
            ChildrenWeeklyReportData(value: calcChildProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayThreeDayBefore),
                                     monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                     dayData: DailyDate.monthformat.string(from: pickedDate.date.dayThreeDayBefore)),
            
            ChildrenWeeklyReportData(value: calcChildProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayTwoDayBefore),
                                     monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                     dayData: DailyDate.monthformat.string(from: pickedDate.date.dayTwoDayBefore)),
            
            ChildrenWeeklyReportData(value: calcChildProgress(dailyPromises: dailyPromises, now: pickedDate.date.dayOneDayBefore),
                                     monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                     dayData: DailyDate.monthformat.string(from: pickedDate.date.dayOneDayBefore)),
            
            ChildrenWeeklyReportData(value: calcChildProgress(dailyPromises: dailyPromises, now: pickedDate.date),
                                     monthData: WeeklyDate.monthformat.string(from: pickedDate.date),
                                     dayData: DailyDate.monthformat.string(from: pickedDate.date)),
        ]
    }
    
    func calcParentProgress(dailyPromises: FetchedResults<Promise>, now: Date) -> CGFloat {
        let dailyPromises = dailyPromises.filter{ Calendar.current.startOfDay(for: now) <= $0.madeTime && $0.madeTime <  Calendar.current.startOfDay(for: now).dayAfter }
        
        let parentPromises: [Promise] = dailyPromises.filter { $0.subject == "parent" && $0.isDone}
        
        let parentDoneCount: Int = parentPromises.filter { $0.isDone == true }.count
        
        let parentProgress: CGFloat = parentPromises.count != 0 ? CGFloat(Double(parentDoneCount) / Double(parentPromises.count) * 100) : 0
        
        return parentProgress == 0 ? 3 : parentProgress
    }
    
    func calcChildProgress(dailyPromises: FetchedResults<Promise>, now: Date) -> CGFloat {
        let dailyPromises = dailyPromises.filter{ Calendar.current.startOfDay(for: now) <= $0.madeTime && $0.madeTime < Calendar.current.startOfDay(for: now).dayAfter }
        
        let childPromises: [Promise] = dailyPromises.filter { $0.subject == "child" && $0.isDone}
        
        let childDoneCount: Int = childPromises.filter { $0.isDone == true }.count
        
        let childProgress: CGFloat = childPromises.count != 0 ? CGFloat(Double(childDoneCount) / Double(childPromises.count) * 100) : 0
        
        return childProgress == 0 ? 3 : childProgress
    }
}

