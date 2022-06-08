//
//  HeaderView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct HeaderView: View {
//     var isNowSubject: String = "p"
//     var body: some View {
//         Text("HeaderView 영역입니다")
//         TitleView()
//         Text("HeaderView 영역입니다")
//     }
    let HVA = HeaderViewAssets()
    
    var body: some View {
        ZStack{
            Color.gray
            // ZStack과 배경색을 대충 넣은이유는ㄴ
            // TitleView와 RuyhaTestVeiw의 배경색을 작업할때 같은 흰색이면 끔찍해서
            // 구분하기 위해 넣었습니다. 추후 삭제 예정
            
            HStack{
                TitleView()
//                    .cornerRadius(HVA.cornerRadius)
                    .frame(width: 965, height: 180, alignment: .leading)
                    .padding(.trailing,25)
                
                RollingBannerView()
                    .cornerRadius(HVA.cornerRadius)
                    .frame(width: 300, height: 145, alignment: .bottomTrailing)
                    .padding(.top,35)
            }//HStack
            .padding(.top,50)
        }//ZStack
        .frame(minWidth: 0,maxWidth: .infinity, minHeight: 0,maxHeight: 200, alignment: .bottomLeading)
        //손가락 모양이박스 위로 돌출 되는 형태인데 아직 정확한 높이가 나오지 않아서 임시 값을 넣어 놨습니다.

    }//View
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
