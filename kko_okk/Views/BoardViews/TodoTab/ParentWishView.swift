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
            // 아직 합의에 도달하지 못한 약속
            FilteredList(filter: "parent", formatter: "promised == FALSE")
    }
}

struct ParentWishView_Previews: PreviewProvider {
    static var previews: some View {
        ParentWishView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
