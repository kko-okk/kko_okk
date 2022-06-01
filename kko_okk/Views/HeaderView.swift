//
//  HeaderView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            TitleView()
            InformView()
        }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
