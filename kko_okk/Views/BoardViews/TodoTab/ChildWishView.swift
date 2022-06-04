//
//  ChildWishView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct ChildWishView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var items: FetchedResults<Promise>
    
    // Popover 띄우고 닫을 용도
    @State private var isShowingPopover: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("아이용", text: .constant(""))
                    .padding(.leading, 10)
                
                Button {
                    isShowingPopover.toggle()
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                }
                .popover(isPresented: $isShowingPopover) {
                    AddPromisePopover(subject: .child, isShowingPopover: $isShowingPopover)
                }
            }
            .padding(.trailing, 10)
            
            Divider()
            
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
