//
//  HeaderView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct HeaderView: View {
        
    var body: some View {
        ZStack{
            Color.gray
            GeometryReader { geometry in
                HStack{
                    TitleView()
                        .frame(width: geometry.size.width * 0.75, height: HeaderViewConst.shared.fullHeight, alignment: .bottomLeading)
                    Spacer()
                    RollingBannerView()
                        .cornerRadius(HeaderViewConst.shared.cornerRadius)
                        .frame(width: geometry.size.width * 0.23, height: HeaderViewConst.shared.cellHeight, alignment: .bottomTrailing)
                        .padding(.top,HeaderViewConst.shared.fullHeight - HeaderViewConst.shared.cellHeight)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: HeaderViewConst.shared.fullWidth, minHeight: 0, maxHeight: HeaderViewConst.shared.fullHeight, alignment: .bottomLeading)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
