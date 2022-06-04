//
//  TitleView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        ZStack{
            
            Rectangle()
                .frame(width: KkookkSize.titleWidth, height: KkookkSize.titleHeight)
                .foregroundColor(.Kkookk.backgroundGray)
            
            ZStack{
                Text("TitleView 영역입니다.")
                    .font(.Kkookk.headerDefaultTitle)
                    .foregroundColor(.Kkookk.commonBlack)
            }
        }

    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
