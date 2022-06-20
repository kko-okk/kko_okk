//
//  CustomDatePicker.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/14.
//

import SwiftUI

struct CustomDatePicker: View {

    @State var currentMonth: Int = 0
    @EnvironmentObject var pickedDate: PickedDate
    var monthlyReportDataTasks: [MonthlyReportDataTaskMetaData]
    private let days: [String] = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
    
    var body: some View {
        VStack(spacing: 20) {
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
                        .font(.caption)
                        .foregroundColor(Color(hex: "#3A3A3A"))
                        .frame(maxWidth: .infinity)
                }
            }//.frame(maxWidth: geometry.size.width * 0.8)
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color.pink)
                            //                                    .padding(.top,-7)
                                .opacity(isSameDay(date1: value.date, date2: pickedDate.date) ? 1 : 0)
                        )
                        .onTapGesture {
                            pickedDate.date = value.date
                        }
                }
            }//.frame(maxWidth: geometry.size.width * 0.8)
            
            VStack(spacing: 15) {
                Text("우리가 한 약속들을 확인해보세요!")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                
                if let task = monthlyReportDataTasks.first(where: { task in
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
        }
        
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let task = monthlyReportDataTasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    VStack{
                        
                        
                        Text("\(value.day)")
                            .font(.title3.bold())
                            .foregroundColor(isSameDay(date1: task.taskDate, date2: pickedDate.date) ? .white : .primary)
                            .frame(maxWidth: .infinity)
                        
                        
                        Circle()
                            .fill(isSameDay(date1: task.taskDate, date2: pickedDate.date) ? .white : Color.pink)
                            .frame(width: 8, height: 8)
                            .padding(.top,-13)
                    }
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
        //MARK: 달력사이 간격
        .frame(height: 45, alignment: .top)
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
