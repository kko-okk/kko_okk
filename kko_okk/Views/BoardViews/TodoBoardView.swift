//
//  FirstBoardView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct TodoBoardView: View {
    var body: some View {
        VStack {
//            Divider()
            
            HStack {
                ParentWishView()
                    .padding(.leading, 8)  // 왼쪽에 여백 주기

                ContractView()

                ChildWishView()
                    .padding(.trailing, 8)  // 오른쪽에 여백 주기
                // 아이를 추가해서 ChildWishView가 두 개 이상이 될 때 어떻게 처리해야 하는지 약간 고민되는 부분임.
                // 아마 함수로 패딩 값을 조절해야 할 듯
            }
        }
    }
}


struct FirstBoardView_Previews: PreviewProvider {
    static var previews: some View {
        TodoBoardView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
