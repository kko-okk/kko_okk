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
            HStack {
                Text("한 주간 약속률")
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
            BarGraph(parentWeeklyReportDatas: parentWeeklyReportDatas, childWeeklyReportDatas: childrenWeeklyReportDatas)
        }
        .padding(15)
    }
}

struct WeeklyReportView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyReportView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

struct BarGraph: View {
    var parentWeeklyReportDatas: [ParentWeeklyReportData]
    var childWeeklyReportDatas: [ChildrenWeeklyReportData]
    
    var body: some View {
        GraphView()
    }
    
}

extension BarGraph {
    
    @ViewBuilder
    func GraphView() -> some View {
        GeometryReader { proxy in
            ZStack {
                VStack{
                    VStack{
                        ForEach(getGraphLines(), id: \.self) { line in
                            HStack{
                                Text("\(Int(line))")
                                    .font(.caption)
                                    .foregroundColor(.black)
                                Rectangle()
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(height: 1)
                            }
                            .frame(maxHeight: .infinity, alignment:  .bottom)
                            .offset(y: 7)
                        }
                        Spacer(minLength: 30)
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.7 ,alignment: .top)
                    .padding(.bottom,30)
                   // .padding(.bottom,proxy.size.height)
                 }
                
//                 데이터에 따른 막대그래프의 값을 표현해줍니다.
                HStack(alignment: .bottom){
                                    ForEach(parentWeeklyReportDatas.indices, id: \.self) { index in
                                        let parentWeeklyReportData = parentWeeklyReportDatas[index]
                                        let childWeeklyReportData = childWeeklyReportDatas[index]
                
                                        VStack{
                                            Spacer()

                                            // 부모님과 아이의 막대 그래프 사이의 간격을 spacing을 조절합니다
                                            HStack(alignment: .bottom) {
                                                VStack{
                                                        ParentAnimatedBarGraph(parentWeeklyReportData: parentWeeklyReportDatas[index], index: index)
                                                }
                
                                                // 부모님의 막대 그래프의 넓이를 조절합니다.
                                                .frame(width: 15,
                                                       height: proxy.size.height * 0.515 * getBarHeight(point: parentWeeklyReportData.value))
                                                //* getBarHeight(point: parentWeeklyReportData.value)
                                                VStack{
                                                        ChildrenAnimateBarGraph(childrenWeeklyReportData: childrenWeeklyReportDatas[index], index: index)
                                                }
                
                                                // 아이의 막대 그래프의 넓이를 조절합니다.
                                                .frame(width: 15,
                                                       height: proxy.size.height * 0.515 * getBarHeight(point: childWeeklyReportData.value) )
                                            }
                                            .frame(height: proxy.size.height * 0.5  ,alignment: .bottom)
//                                            .padding(.bottom,proxy.size.height * 0.176)
                                            Spacer()
//
//                                             x축(월,일)을 표현합니다.
                                            VStack(alignment: .center) {
                                                //일
                                                Text("\(parentWeeklyReportData.dayData)")
                                                    .font(.Kkookk.weeklyReportViewMainCell)
                                                //월
                                                Text("\(parentWeeklyReportData.monthData)")
                                                    .font(.Kkookk.weeklyReportViewContentCell)
                                                    .foregroundColor(.Kkookk.unselectedTabGray)
                                            
                                            }.frame(height:30)
//                                            .frame(height: proxy.size.height ,alignment: .bottom)
//                                            .offset(y: 10)
//                                                    .padding(.bottom,10)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: proxy.size.height, alignment: .bottom)
//                                        .offset(y: 7)

                                    }
                                }

            }

            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }
    }
    
    // 막대 그래프 바의 높이를 나타냅니다.
    func getBarHeight(point: CGFloat) -> CGFloat {
        let max: CGFloat = 100
        let height = (point / CGFloat(max))
        print("max:\(max)")
        print("height:\(height)")
        return height
    }
    // 그래프의 y축을 그립니다.
    func getGraphLines() -> [CGFloat] {
        let max: CGFloat = 100
        var lines: [CGFloat] = []
        lines.append(max)
        for index in 1...4 {
            let progress = max / 4
            lines.append(max - (CGFloat(progress) * CGFloat(index)))
        }
        return lines
    }
}


// 부모님 막대 그래프의 애니메이션을 담당합니다.
struct ParentAnimatedBarGraph: View {
    var parentWeeklyReportData: ParentWeeklyReportData
    var index: Int
    
    @State var showBar: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(parentWeeklyReportData.color)
                .frame(height: showBar ? nil : 0, alignment: .bottom)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8).delay(Double(index) * 0.1)) {
                    showBar = true
                }
            }
        }
    }
}
// 아이 막대 그래프의 애니메이션을 담당합니다.
struct ChildrenAnimateBarGraph: View {
    var childrenWeeklyReportData: ChildrenWeeklyReportData
    var index: Int
    
    @State var showBar: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(childrenWeeklyReportData.color)
                .frame(height: showBar ? nil : 0, alignment: .bottom)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8).delay(Double(index) * 0.1)) {
                    showBar = true
                }
            }
        }
    }
}
