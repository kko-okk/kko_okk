//
//  ButtonForContract.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/30.
//

import Foundation
import SwiftUI

// btnColor는 임의로 purple 색으로 넣어 놨음.
// 함수에 isParent, isChild 같은 함수가 있으면 true일 때 그 값에 해당하는 색을 받아와서 바꿔주는 식으로 코딩할까 생각 중
// 그런 함수가 없으면 뭔가 받아올 수 있는 값이 있겠죵?
var btnColor = Color.purple

struct ButtonForContract: View {
    var body: some View {
        // Stack을 버튼으로 사용하기 위한 UI
        // Button으로 구현했을 때는 탭했을 때 Button 내부 컨텐츠가 깜빡이는 기본 효과가 있어서 Stack으로 구현함.
        // 전체적으로는 Stack을 그린 후 clipShape() 으로 잘라내서 사용하는 방식.
        ZStack {
            // Vstack 내부는 크게 두 줄로 나뉨: 첫 줄은 제목 + 점 세 개 짜리 버튼
            // 두 번째 줄은 세부 내용이 들어가는 영역
            VStack {
                HStack {
                    // Padding 값은 나름 고심해서 정하기는 했는데, 바뀔 수 있음.
                    Text("아이와 놀이공원 가기!")
                        .font(.system(size: 23, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 5)
                    
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .padding(.top, 10)
                }
                
                Text("아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! 아이와 놀이공원 가기! ")
                    .font(.system(size: 17, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .padding(.trailing, 30)
                    .padding(.top, 5)
                    .padding(.bottom, 20)
            }
        }
        .background(btnColor)
        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
    }
}

struct ButtonForContract_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForContract()
                .previewInterfaceOrientation(.landscapeLeft)
                .previewDevice("iPad Air (5th generation)")
    }
}
