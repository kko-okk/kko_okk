//
//  PromisePopoverElements.swift
//  kko_okk
//
//  Created by 임성균 on 2022/06/10.
//

import SwiftUI

struct EditContentsOfPromiseView: View {
    // 약속 제목과 이름을 받아오는 부분.
    @Binding var name: String
    @Binding var memo: String
    
    //
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case name
        case memo
    }
    
    //
    let popoverAssets = PopoverAssets()
    
    var body: some View {
        VStack {
            // 제목, 내용 수정 타이틀
            HStack {
                Text("할 일 정하기")
                    .font(Font.Kkookk.popoverTitle)
                    .padding(.horizontal, popoverAssets.popoverHorizontalTrailingPadding)
                Spacer()
            }
            
            ZStack {
                // name, memo 텍스트필드를 붙어있는 것처럼 만들기 위한 사각형
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: popoverAssets.popoverEditingBoxWidth,
                           height: popoverAssets.popoverEditingBoxHeight)
                    .foregroundColor(Color.Kkookk.commonWhite)
                
                VStack {
                    // name 수정하는 영역
                    TextField("할 일", text: $name)
                        .frame(width: popoverAssets.popoverEditingBoxWidth * 0.95,
                               height: popoverAssets.popoverNameFieldHeight)
                        .font(Font.Kkookk.popoverName)
                        .background(Color.Kkookk.commonWhite)
                        .cornerRadius(15)
                        .focused($focusedField, equals: .name)
                    
                    Divider()
                        .frame(width: popoverAssets.popoverEditingBoxWidth)
                        .foregroundColor(Color.Kkookk.backgroundGray)
                    
                    // memo 수정하는 영역
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $memo)
                            .frame(width: popoverAssets.popoverEditingBoxWidth * 0.97,
                                   height: popoverAssets.popoverMemoFieldHeight)
                            .font(Font.Kkookk.popoverMemo)
                            .cornerRadius(15)
                            .background(.clear.opacity(0))
                            .focused($focusedField, equals: .memo)
                        
                        // placeholder
                        if memo.isEmpty {
                            Text("메모 추가하기")
                                .font(Font.Kkookk.popoverMemo)
                                .cornerRadius(15)
                                .padding(.horizontal, 6)
                                .padding(.top, 8)
                                .foregroundColor(Color.Kkookk.unselectedTabGray)
                                .onTapGesture {
                                    focusedField = .memo
                                }
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
