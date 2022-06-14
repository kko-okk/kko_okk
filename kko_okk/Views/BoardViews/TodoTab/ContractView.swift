//
//  ContractView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct ContractView: View {
    var body: some View {
        VStack {
            HStack {
                TextField("우리가 만든 약속", text: .constant(""))
                    .padding(.leading, 10)
                
                // 만든 약속의 갯수
                Circle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 20, height: 20)
                    .overlay(
                        Text("10")
                            .font(.system(size: 10))
                    )
                
                
                Spacer()
                    .frame(width: 10, height: 30)
                
                
                /*
                Button(action: {
                    print("No-function rectangle tapped")
                }) {
                    // 원 안에 숫자 들어 있는 오브젝트 위치 조절이 어려워서 + 기호 있던 곳 위에 그냥 사각형 덮었음.
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 30, height: 30)
                }
                 */
            }
            .padding(.trailing, 10)

            Divider()
            
            Spacer()
                .frame(height: 23)
            
            Spacer()
            // 약속은 만들어졌지만 완료는 안된 것.
            FilteredList(filter: "promised", formatter: "promised == TRUE AND isDone == FALSE")
        }
    }
}

struct ContractView_Previews: PreviewProvider {
    static var previews: some View {
        ContractView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
