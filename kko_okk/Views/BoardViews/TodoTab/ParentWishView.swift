//
//  ParentWishView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct ParentWishView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // Popover 띄우고 닫을 용도
    @State private var isShowingPopover: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("부모용", text: .constant(""))
                    .padding(.leading, 10)

                Button {
                    isShowingPopover.toggle()
                } label: {
                    ZStack {
                        Image("parentFingerprint")
                            .resizable()
                            .frame(width: 26, height: 30)

                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                }
                .popover(isPresented: $isShowingPopover) {
                    AddPromisePopover(subject: .parent, isPresented: $isShowingPopover)
                }
            }
            .padding(.trailing, 10)

            Divider()

            Spacer()
                .frame(height: 23)

            Spacer()

            // 아직 합의에 도달하지 못한 약속
            FilteredList(filter: "parent", formatter: "promised == FALSE")
        }
    }
}

struct ParentWishView_Previews: PreviewProvider {
    static var previews: some View {
        ParentWishView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
