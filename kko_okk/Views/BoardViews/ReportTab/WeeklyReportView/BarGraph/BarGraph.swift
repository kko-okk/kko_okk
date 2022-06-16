//
//  BarGraph.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/14.
//

import SwiftUI

struct BarGraph: View {
    var parentWeeklyReportDatas: [ParentWeeklyReportData]
    var childWeeklyReportDatas: [ChildrenWeeklyReportData]
    
    var body: some View {
        GraphView()
    }
    
    @ViewBuilder
    func GraphView() -> some View {
        GeometryReader { proxy in
            ZStack {
//                Color.blue
                VStack(spacing: 0) {
                    // 그래프의 y축을 그립니다.
                    ForEach(getGraphLines(), id: \.self) { line in
                        HStack() {
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
//                                .frame(height: 20)
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(height: 1)
                        }
                        .frame(maxHeight: .infinity, alignment:  .bottom)
                        .offset(y: 7)
                    }
                }//.padding(.bottom,35)
                .frame(width: proxy.size.width, height: proxy.size.height * 0.75 ,alignment: .top)
                .padding(.bottom,proxy.size.height * 0.25)
                // 데이터에 따른 막대그래프의 값을 표현해줍니다.
                HStack(spacing:0) {
                    ForEach(parentWeeklyReportDatas.indices, id: \.self) { index in
                        let parentWeeklyReportData = parentWeeklyReportDatas[index]
                        let childWeeklyReportData = childWeeklyReportDatas[index]

                        VStack(spacing: 0) {
                            // 부모님과 아이의 막대 그래프 사이의 간격을 spacing을 조절합니다
                            HStack(alignment: .bottom, spacing: 4) {
                                VStack(spacing: 0) {
                                        ParentAnimatedBarGraph(parentWeeklyReportData: parentWeeklyReportDatas[index], index: index)
                                }
                                
                                // 부모님의 막대 그래프의 넓이를 조절합니다.
                                .frame(width: 15)
                                .frame(height: getBarHeight(point: parentWeeklyReportData.value, size: proxy.size) * 0.75)
                                VStack(spacing: 0) {
                                        ChildrenAnimateBarGraph(childrenWeeklyReportData: childrenWeeklyReportDatas[index], index: index)
                                }
                                // 아이의 막대 그래프의 넓이를 조절합니다.
                                .frame(width: 15)
                                .frame(height: getBarHeight(point: childWeeklyReportData.value, size: proxy.size) * 0.75)
                            }
                            .frame(height: proxy.size.height * 0.75 ,alignment: .bottom)

                            // x축(월,일)을 표현합니다.
                            VStack(alignment: .center) {
                                Spacer()
                                //일
                                Text(
                                    "\(parentWeeklyReportData.dayData)"
                                )
                                    .font(.Kkookk.weeklyReportViewMainCell)
                                //월
                                Text(
                                    "\(parentWeeklyReportData.monthData)"
                                )
                                    .font(.Kkookk.weeklyReportViewContentCell)
                                    .foregroundColor(.Kkookk.unselectedTabGray)
                            }
                            .frame(height: proxy.size.height * 0.25 ,alignment: .bottom)
                            .offset(y: 10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 190)
    }
    // 막대 그래프 바의 높이를 나타냅니다.
    func getBarHeight(point: CGFloat, size: CGSize) -> CGFloat {
        let max: CGFloat = 100
        let height = (point / CGFloat(max)) * (size.height - 37)
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

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyReportView()
    }
}
