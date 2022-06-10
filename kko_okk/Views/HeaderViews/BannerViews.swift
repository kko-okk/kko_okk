//
//  BannerViews.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/07.
//

import SwiftUI


enum BannerViews : CaseIterable{
    case view1
    case view2
    case view3  
}

class RollingBannerController{
    @ViewBuilder
    func pageing(view:BannerViews) -> some View{
        switch view{
        case .view1:
            BannerView_1()
        case .view2:
            BannerView_2()
        case .view3:
            BannerView_3()
        }
    }
}


//롤링배너에 들어갈 View들 입니다.
//아직 정해진것이 없어서 가데이터로 넣어 놨습니다.
struct BannerView_1: View {
    var body: some View {
        ZStack{
            Color.blue
            Text("1")
        }
    }
}


struct BannerView_2: View {
    var body: some View {
        ZStack{
            Color.red
            Text("2")
        }
    }
}


struct BannerView_3: View {
    var body: some View {
        ZStack{
            Color.green
            Text("3")
        }    }
}





//struct BannerViews_Previews: PreviewProvider {
//    static var previews: some View {
//        BannerViews()
//    }
//}
