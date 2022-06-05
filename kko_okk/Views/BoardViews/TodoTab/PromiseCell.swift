//
//  PromiseCell.swift
//  kko_okk
//
//  Created by 임성균 on 2022/06/05.
//

import SwiftUI

struct PromiseCell: View {
    // FilteredList로부터 약속(Promise) 전달받기
    @ObservedObject var promise: Promise
    
    // Popover 띄우고 닫는 용도
    @State private var isShowingPopover: Bool = false
    
    var body: some View {
        HStack {
            Text(promise.name ?? "Unknown")
            
            Spacer()
            
            // 약속 수정하기 버튼
            ZStack {
                // 버튼 아이콘
                Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 30, height: 6)
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.black)
                
                // 버튼 아이콘의 사이즈가 작아서, 위에 투명한 사각형을 덧댐.
                Rectangle()
                    .fill(parentColor.opacity(0.0))
                    .frame(width: 40, height: 40)
            }
            .onTapGesture {
                // 약속 수정하는 Popover 띄우기
                isShowingPopover.toggle()
            }
            .popover(isPresented: $isShowingPopover) {
                // EditPromisePopover에 약속 전달.
                EditPromisePopover(promise: promise, isPresented: $isShowingPopover)
            }
        }
    }
}

//struct PromiseCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PromiseCell()
//    }
//}
