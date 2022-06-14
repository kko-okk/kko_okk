//
//  BannerViews.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/07.
//

import SwiftUI


enum BannerViews: CaseIterable{
    case view1
    case view2
    case view3
}

class RollingBannerController{
    @ViewBuilder
    func pageing(view: BannerViews) -> some View{
        switch view{
        case .view1:
            BannerView1()
        case .view2:
            BannerView2()
        case .view3:
            BannerView3()
        }
    }
}


//TODO: BannerView1~3은 롤링배너를 안에 들어갈 임시 view들 입니다.
//TODO: 사용된 색상또한 임시값입니다.
struct BannerView1: View {
    @State var promise: Int = 6
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color(hex: "#F5F0F6")
                VStack{
                    HStack{
                        Text("이번주에 ")
                            .font(Font.Kkookk.headerDate)
                        Text("\(promise)개")
                            .font(Font.Kkookk.headerDefaultTitle)
                            .foregroundColor(Color.green)
                        Text("의")
                            .font(Font.Kkookk.headerDate)
                    }
                    Text("약속을 지켰어요")
                        .font(Font.Kkookk.headerDate)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:  HeaderViewConst.shared.fullHeight, alignment: .bottomLeading)
    }
}


struct BannerView2: View {
    var body: some View {
        ZStack{
            Color.red
            Text("2")
        }
    }
}


struct BannerView3: View {
    var body: some View {
        ZStack{
            Color.green
            Text("3")
        }
    }
}


struct BannerViews_Previews: PreviewProvider {
    static var previews: some View {
        BannerView1()
    }
}
