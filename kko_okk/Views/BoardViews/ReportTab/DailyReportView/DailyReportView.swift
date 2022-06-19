//
//  checkPromiseView.swift
//  kko_okk
//
//  Created by 이성노 on 2022/06/16.
//

import SwiftUI

struct DailyReportView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack() {
            
//MARK: 원형그래프 시작
                HStack{
                    HStack{
                        ZStack {
                            ForEach(dailyReportDatas.indices, id: \.self) { index in
                                AnimatedDailyReportView(dailyReportData: dailyReportDatas[index], index: index,
                                                        lineWidth: .constant(geometry.size.height * 0.1),
                                                        circleHeight:  .constant(geometry.size.height * 0.5))
                            }.frame(width: geometry.size.height * 0.7, height: geometry.size.height)
                        }
                        Spacer()
                    }
                
//MARK: 공간 분배를 위한 Spacer
                    Spacer()
                    
//MARK: 텍스트문구
                    HStack{
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("오늘의 약속률")
                                .font(.Kkookk.dailyReportViewMainCell)
                                .fontWeight(.semibold)
    
                            ForEach(dailyReportDatas) { dailyReportData in
                                Label {
                                    HStack{
                                        Text(dailyReportData.assignment)
                                            .font(.Kkookk.dailyReportViewContentCell)
                                        Spacer()
                                        Text("\(Int(dailyReportData.progress))%")
                                            .font(.Kkookk.dailyReportViewContentCell)
                                            .foregroundColor(.gray)
                                    }
                                } icon: {
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(dailyReportData.keyColor)
                                }
                            }
                        }
                        .padding(.trailing,15)
                    }
                    
                }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
        }
    }
}

struct DailyReportView_Previews: PreviewProvider {
    static var previews: some View {
        DailyReportView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

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
                .trim(from: 0, to: showAnimated ? dailyReportDatas[index].progress / 100 : 0)
                .stroke(dailyReportDatas[index].keyColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
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





