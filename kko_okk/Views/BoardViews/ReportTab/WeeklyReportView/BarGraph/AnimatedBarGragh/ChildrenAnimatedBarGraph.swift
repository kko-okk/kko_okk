//
//  ChildrenAnimatedBarGraph.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/14.
//

import SwiftUI

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
