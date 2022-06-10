//
//  WeeklyReportView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/10.
//

import SwiftUI

struct WeeklyReportView: View {
    var body: some View {
        BarGraph(parentWeeklyReportDatas: parentWeeklyReportDatas, childWeeklyReportDatas: childrenWeeklyReportDatas)
    }
}

struct WeeklyReportView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyReportView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

struct BarGraph: View {
    var parentWeeklyReportDatas: [ParentWeeklyReportData]
    var childWeeklyReportDatas: [ChildrenWeeklyReportData]
    
    var body: some View {
        GraphView()
            .padding(.top, 20)
    }
    
    @ViewBuilder
    func GraphView() -> some View {
        GeometryReader { proxy in
            ZStack {
                VStack(spacing: 0) {
                    ForEach(getGraphLines(), id: \.self) { line in
                        HStack(spacing: 8) {
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height: 20)
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                        }
                        .frame(maxHeight: .infinity, alignment:  .bottom)
                        .offset(y: -15)
                    }
                }
                
                HStack {
                    ForEach(parentWeeklyReportDatas.indices, id: \.self) { index in
                        let parentWeeklyReportData = parentWeeklyReportDatas[index]
                        let childWeeklyReportData = childWeeklyReportDatas[index]

                        VStack(spacing: 0) {
                            HStack(alignment:.bottom) {
                                VStack(spacing: 5) {
                                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                                            .fill(parentWeeklyReportData.color)
                                }
                                .padding(.horizontal, 5)
                                .frame(height: getBarHeight(point: parentWeeklyReportData.value, size: proxy.size))
                                VStack( spacing: 0) {
                                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                                            .fill(childWeeklyReportData.color)
                                }
                                .padding(.horizontal, 5)
                                .frame(height: getBarHeight(point: childWeeklyReportData.value, size: proxy.size))
                                
                            }
                            Text(
                                parentWeeklyReportData.key
                            )
                                .font(.caption)
                                .frame(height: 25, alignment: .bottom)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
                .padding(.leading, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 190)
    }
    
    func getBarHeight(point: CGFloat, size: CGSize) -> CGFloat {
        let max = getMax()
        // 25 Text Height
        // 5 Spacing
        let height = (point / max) * (size.height - 37)
        return height
    }
    
    func getGraphLines() -> [CGFloat] {
        let max = getMax()
        var lines: [CGFloat] = []
        lines.append(max)
        for index in 1...4 {
            // dividing the max by 4 and iterating as index for graph lines...
            let progress = max / 4
            lines.append(max - (progress * CGFloat(index)))
        }
        return lines
    }
    
    func getMax() -> CGFloat {
        let max = parentWeeklyReportDatas.max { first, scnd in
            return scnd.value > first.value
        }?.value ?? 0
        
        return max
    }
}
