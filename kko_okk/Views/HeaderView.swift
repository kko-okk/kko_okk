//
//  HeaderView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct HeaderView: View {
    var isNowSubject: String = "p"
    var body: some View {
        Text("HeaderView 영역입니다")
        TitleView()
        Text("HeaderView 영역입니다")
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
