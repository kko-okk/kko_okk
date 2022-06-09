//
//  ButtonForContract.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/30.
//

import Foundation
import SwiftUI

struct ButtonForContract: View {
    var contract: Promise
    var nowSubject: String
    
    var body: some View {
        // Stack을 버튼으로 사용하기 위한 UI
        // Button으로 구현했을 때는 탭했을 때 Button 내부 컨텐츠가 깜빡이는 기본 효과가 있어서 Stack으로 구현함.
        // 전체적으로는 Stack을 그린 후 clipShape() 으로 잘라내서 사용하는 방식.
        ZStack {
            // VStack 내부는 크게 두 줄로 나뉨: 첫 줄은 제목 + 점 세 개 짜리 버튼
            // 두 번째 줄은 세부 내용이 들어가는 영역
            VStack {
                HStack {
                    Text(contract.name!)  // contract 중 .name(상단 큰 글씨 내용)을 받아옴
                        .font(.system(size: 23, weight: .black, design: .rounded))
                        .foregroundColor(  // contract.subject 와 nowSubject가 같은 경우 폰트 색을 검은 색(Kkkook.backgroundGray), 아니면 흰 색으로 변경
                            contract.subject == nowSubject ? Color.Kkookk.backgroundGray : Color.white
                        )
                        .padding([.top, .leading, .trailing], 20.0)  // padding 배열 처리
                        .padding(.bottom, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .padding(.top, 10)
                }

                Text(contract.memo!)  // contract의 memo(하단 자세한 내용)을 받아와서 보여줌
                    .font(.system(size: 17, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .bottom], 20)  // padding 배열 처리
                    .padding(.trailing, 30)
                    .padding(.top, 5)
            }
        }
        .background(backGroundColor(for: self.contract, now: self.nowSubject))
        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
        .padding([.leading, .trailing], 14)
    }
    
    // 버튼 색을 반환하는 함수
    private func backGroundColor(for contract: Promise, now nowList: String) -> Color {
        // parameter: contract: Promise(Promise 인스턴스), nowList: String (String 타입, 현재 뷰에서 그리는 리스트)
        // contract: Promise 앞의 for, nowList: String 앞의 now는 각각을 for, now로 사용할 수 있도록 하는 신택스 요소
        var result: Color  // result 변수는 Color 값이 들어감

        if nowList == "parent" {  // nowList 값이 parent와 같은 경우
            result = contract.subject == "parent" ? Color.Kkookk.parentPurple : Color.Kkookk.tabDividerGray  // contract.subject가 parent인 경우 parentPurple, 아니면 tabDividerGray
        } else {  // nowList 값이 parent가 아닌 경우
            result = contract.subject == "child" ? Color.Kkookk.childGreen : Color.Kkookk.tabDividerGray  // contract.subject가 child인 경우 childGreen, 아니면 tabDividerGray
        }
        return result
    }
}
