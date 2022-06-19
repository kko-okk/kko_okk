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

                Button {
                    isShowingPopover.toggle()
                } label: {
                    ZStack {
                        Image("childFingerprint")
                            .resizable()
                            .frame(width: 26, height: 30)
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                }
                .popover(isPresented: $isShowingPopover) {
                    AddPromisePopover(subject: .child, isPresented: $isShowingPopover)
                }
            }
            .padding(.trailing, 10)

            Divider()

            Spacer()
                .frame(height: 23)

            Spacer()
            // 약속이 안된 것
            FilteredList(filter: "child", formatter: "promised == FALSE")
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
