//
//  ChildWishView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct ChildWishView: View {
    var body: some View {
        VStack {
            HStack {
                TextField("아이용", text: .constant(""))
                    .padding(.leading, 10)
                
                Circle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 20, height: 20)
                    .overlay(
                        // 원 안의 숫자는 state-binding으로 컬럼 내 액티브 버튼 갯수가 저장된 변수에 묶어야 함. 지금은 임시로 넣어 놓은 상태.
                        Text("1")
                            .font(.system(size: 10))
                    )
                
                Spacer()
                    .frame(width: 50, height: 30)
                
                Button(action: {
                    print("Add button tapped")
                }) {
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.trailing, 10)

            Divider()
        }
    }
}

struct ChildWishView_Previews: PreviewProvider {
    static var previews: some View {
        ChildWishView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
