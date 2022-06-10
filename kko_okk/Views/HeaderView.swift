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
            
            GeometryReader { geometry in
                HStack{
//                    TitleView()
//                        .frame(width: geometry.size.width * 0.7, height: 180,alignment: .bottomLeading)
//                        .padding(.trailing,25)
//                    
//                    RollingBannerView()
//                        .cornerRadius(HVA.cornerRadius)
//                        .frame(width:  geometry.size.width * 0.25, height: 145, alignment: .bottomTrailing)
//                        .padding(.top,35)
                    
                    TitleView()
//                    BannerView_1()
                        .frame(width: geometry.size.width * 0.75, height: HVA.headerViewfullheight,alignment: .bottomLeading)
                    Spacer()//View 사이의 간격은 유동적으로 하기로 합의봄(이안과..)
                    RollingBannerView()
                        .cornerRadius(HVA.cornerRadius)
                        .frame(width: geometry.size.width * 0.23, height: HVA.headerViewCellheight,alignment: .bottomTrailing)
                        .padding(.top,HVA.headerViewfullheight - HVA.headerViewCellheight)
                }//HStack
            }//GeometryReader
        }//ZStack
        .frame(minWidth: 0,maxWidth: HVA.headerViewfullWidth, minHeight: 0,maxHeight:  HVA.headerViewfullheight, alignment: .bottomLeading)
        //손가락 모양이박스 위로 돌출 되는 형태인데 아직 정확한 높이가 나오지 않아서 임시 값을 넣어 놨습니다.
        
    }//View
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
