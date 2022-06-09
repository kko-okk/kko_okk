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
    
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    
    private var items: FetchedResults<Promise>
    
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
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                }
                .popover(isPresented: $isShowingPopover) {
                    AddPromisePopover(subject: .parent, isShowingPopover: $isShowingPopover)
                }
            }
            .padding(.trailing, 10)

            Divider()
            
            Spacer()
                .frame(height: 23)

            Spacer()
            // 약속이 안된 것
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
