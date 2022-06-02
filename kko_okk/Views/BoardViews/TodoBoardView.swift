//
//  FirstBoardView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct TodoBoardView: View {
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                ParentWishView()
                ContractView()
                ChildWishView()
            }
        }
    }
}


struct FirstBoardView_Previews: PreviewProvider {
    static var previews: some View {
        TodoBoardView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
