//
//  PromisePopoverElements.swift
//  kko_okk
//
//  Created by 임성균 on 2022/06/10.
//

import SwiftUI

struct EditContentsOfPromiseView: View {
    @Binding var name: String
    @Binding var memo: String
    
    var body: some View {
        VStack {
            HStack {
                Text("할 일 정하기")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            ZStack {
                // name, memo 텍스트필드를 붙어있는 것처럼 만들기 위한 사각형
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 760, height: 200)
                    .foregroundColor(.white)
                
                VStack {
                    // name 수정하는 영역
                    TextField("할 일", text: $name)
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.horizontal, 13)
                    
                    Divider()
                        .padding(.horizontal, 8)
                        .foregroundColor(.gray)
                    
                    // memo 수정하는 영역
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $memo)
                            .frame(width: 760, height: 130)
                            .cornerRadius(15)
                            .padding(.horizontal, 8)
                        
                        // placeholder
                        if memo.isEmpty {
                            Text("메모 추가하기")
                                .cornerRadius(15)
                                .padding(.horizontal, 15)
                                .padding(.top, 10)
                                .foregroundColor(Color.Kkookk.unselectedTabGray)
                        }
                    }
                }
            }
        }
    }
}

//struct EditNameAndMemoOfPromiseView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditNameAndMemoOfPromiseView()
//    }
//}
