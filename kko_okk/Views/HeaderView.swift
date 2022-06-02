//
//  HeaderView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {

        Rectangle().frame(width: Style.ViewSize.HeaderSize.width, height: Style.ViewSize.HeaderSize.height)
        
        TitleView()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
