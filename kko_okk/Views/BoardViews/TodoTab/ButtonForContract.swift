//
//  ButtonForContract.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/30.
//

import Foundation
import SwiftUI

struct ButtonForContract: View {
    var nowSubject: String
    
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
                        .padding([.top, .leading, .trailing], 20.0)  // padding 배열 처리
                        .padding(.bottom, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
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
                    .padding([.leading, .bottom], 20)  // padding 배열 처리
                    .padding(.trailing, 30)
                    .padding(.top, 5)
            }
        }
        // 삼항연산자로 isParent가 true일 때는 버튼 색이 Color.Kkookk.parentPurple로, false일 때는 Color.Kkookk.childGreen으로 변경
        .background((nowSubject == "parent") ? Color.Kkookk.parentPurple : Color.Kkookk.childGreen)
        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
    }
}

struct ButtonForContract_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ButtonForContract(nowSubject: "parent")
                .previewInterfaceOrientation(.landscapeLeft)
                .previewDevice("iPad Air (5th generation)")
            
            ButtonForContract(nowSubject: "child")
                .previewInterfaceOrientation(.landscapeLeft)
                .previewDevice("iPad Air (5th generation)")
        }
    }
}
