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
    func tipViewMaker(text:String) -> some View{
        tipView(txt: text)
    }
    
}

struct tipView: View {
    @State var txt = ""
    var body: some View {
        ZStack{
            Color.white
            GeometryReader{ geo in
                VStack{
                    Spacer()
                    Text("\(txt)")
                        .lineLimit(3)
                        .fitSystemFont()
                        .padding(.horizontal,geo.size.width * 0.1)
                        .frame(height: geo.size.height * 0.45, alignment: .center)
                    Spacer()
                }
            }
        }
    }
}
