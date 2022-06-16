//
//  ReportBoardView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/02.
//

import SwiftUI

struct ReportBoardView: View {
    var body: some View {
        ZStack{
            Color.cyan
            GeometryReader { geometry in
                VStack{
                    Spacer(minLength: 20)
                    HStack{
                        VStack{
                            HStack{
                                DailyReportView()
//                                testView1()
                                    .cornerRadius(HeaderViewConst.shared.cornerRadius)
                                Spacer(minLength: 20)
                                testView2()
                                    .cornerRadius(HeaderViewConst.shared.cornerRadius)
                            }
                            Spacer(minLength: 20)
                            WeeklyReportView()
                                .background(Color.white)
                                .cornerRadius(HeaderViewConst.shared.cornerRadius)
                                .frame(height: geometry.size.height * 0.54)
                        }
                        Spacer(minLength: 30)
                        testView4()
                            .cornerRadius(HeaderViewConst.shared.cornerRadius)
                            .frame(width: geometry.size.width * 0.329)
                    }//1246
                    Spacer(minLength: 20)
                }
            }
        }
    }
}
//이 뷰의 전체 높이 670 /366


struct testView1: View {
    var body: some View {
        
        Color.red
    }
}

struct testView2: View {
    var body: some View {
        Color.green
    }
}
struct testView3: View {
    var body: some View {
        Color.black
    }
}
struct testView4: View {
    var body: some View {
        Color.yellow
    }
}



struct ReportBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ReportBoardView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
