//
//  AnimatedDailyReportView.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/17.
//

import SwiftUI

struct AnimatedDailyReportView: View {
    var dailyReportData: DailyReportData
    var index: Int
    @State var showAnimated: Bool = false
    @Binding var lineWidth : CGFloat
    @Binding var circleHeight : CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray.opacity(0.1), lineWidth: lineWidth)
            
            Circle()
                .trim(from: 0, to: showAnimated ? dailyReportData.progress / 100 : 0)
                .stroke(dailyReportData.keyColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .rotationEffect(.init(degrees: -90))
        }
        //        .padding()
        .padding(CGFloat(index) * lineWidth * 1.5)
        .frame(width: circleHeight,height: circleHeight)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(Double(index) * 0.1)) {
                    showAnimated = true
                }
            }
        }
    }
}
