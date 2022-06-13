//
//  HeaderView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct HeaderView: View {
    
    let HVA = HeaderViewAssets()
    
    var body: some View {
        ZStack{
            Color.gray
            GeometryReader { geometry in
                HStack{
                    TitleView()
                        .frame(width: geometry.size.width * 0.75, height: HVA.headerViewfullheight, alignment: .bottomLeading)
                    Spacer()
                    RollingBannerView()
                        .cornerRadius(HVA.cornerRadius)
                        .frame(width: geometry.size.width * 0.23, height: HVA.headerViewCellheight, alignment: .bottomTrailing)
                        .padding(.top,HVA.headerViewfullheight - HVA.headerViewCellheight)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: HVA.headerViewfullWidth, minHeight: 0, maxHeight: HVA.headerViewfullheight, alignment: .bottomLeading)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
