//
//  CustomDatePicker.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/14.
//

import SwiftUI

struct CustomDatePicker: View {
    @EnvironmentObject var pickedDate: PickedDate
    var monthlyReportDataTasks: [MonthlyReportDataTaskMetaData]
    @State var currentMonth: Int = 0
    
    private let days: [String] = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
    
    var body: some View {
        VStack(spacing: 35) {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.pink)
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.pink)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            // 달력
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color.pink)
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: pickedDate.date) ? 1 : 0)
                        )
                        .onTapGesture {
                            pickedDate.date = value.date
                            print(value.date)
                            print(pickedDate.date)
                        }
                }
            }
            
            VStack(spacing: 15) {
                Text("우리가 지킨 약속을 확인해보세요!")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)
                
                // 여기서 task를 넘겨줘야함
                if let task = monthlyReportDataTasks.first(where: { task in
                    // 선택한 날짜에 맞춰서 아래의 task, 즉 ForEach를 돌릴 task를 바꿈
                    return isSameDay(date1: task.taskDate, date2: pickedDate.date)
                }) {
                    ForEach(task.task) { contract in
                        Text(contract.name ?? "")
                            .font(.title2.bold())
                        .padding(.vertical, 30)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        // 백엔드와 협력하여 부모용, 아이용 셀을 만들 예정입니다.
                        .background(
                            Color(contract.subject == "child" ? "kkookkGreen" : "kkookkPurple")
                                .cornerRadius(15)
                                .frame(height: 80)
                            )
                    }
                } else {
                    Text("오늘 우리 가족은 약속이 없었어요!!")
                }
            }
            .padding()
        }
        .onChange(of: currentMonth) { newValue in
            pickedDate.date = getCurrentMonth()
            print(getCurrentMonth())
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let task = monthlyReportDataTasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: pickedDate.date) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: pickedDate.date) ? .white : Color.pink)
                        .frame(width: 8, height: 8)
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: pickedDate.date) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY M월"
        let date = formatter.string(from: pickedDate.date)
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else { return Date() }
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
