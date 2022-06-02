//
//  ParentWishView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct ParentWishView: View {
    var body: some View {
        VStack {
            HStack {
                TextField("부모용", text: .constant(""))
                    .padding(.leading, 10)
                
                Button(action: {
                    print("Add button tapped")
                }) {
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.trailing, 10)

            Divider()
            Spacer()
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
