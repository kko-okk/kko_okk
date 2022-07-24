//
//  OnBoardingSegmentView.swift
//  kko_okk
//
//  Created by 김제필 on 7/24/22.
//

import Foundation
import SwiftUI

struct OnBoardingSegmentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack {
                    Text("SegmentMakePromise".localized).foregroundColor(.Kkookk.commonBlack)
                        .font(Font.Kkookk.boardTabSelected)

                    Rectangle()
                        .foregroundColor(Color(hex: "DDDDDD"))
                        .frame(height: 2)
                        .padding(.top, -15)
                }

                VStack {
                    Text("SegmentFulfillmentRateView".localized)
                        .foregroundColor(.Kkookk.unselectedTabGray)
                        .font(Font.Kkookk.boardTabSelected)

                    Rectangle()
                        .foregroundColor(Color(hex: "FFFFFF"))
                        .frame(height: 2)
                        .padding(.top, -15)
                }
            }
//            .frame(width: KkookkSize.fullWidth / 1.3)
        }
    }
}


//struct OnBoardingSegmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingSegmentView()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}


//VStack{
//    Spacer()
//    Rectangle()
//        .foregroundColor(Color(hex: "DDDDDD"))
//        .frame(height: 2)
//        .padding(.top, -17)
//    // TODO: 기존 디바이더 삭제 + 선택되었을 때 사용할 커스텀 디바이더 (Rectangle사용)
//}
//.frame(height: tabBarSize.height)
