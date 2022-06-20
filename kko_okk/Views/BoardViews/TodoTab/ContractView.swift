//
//  ContractView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct ContractView: View {
    @EnvironmentObject var pickedDate: PickedDate
    var body: some View {
        
        // 약속은 만들어졌지만 완료는 안된 것.
        FilteredList(filter: "promised", formatter: "promised == TRUE AND %@ <= madeTime AND madeTime <= %@", startDate: pickedDate.date)
        
    }
}

struct ContractView_Previews: PreviewProvider {
    static var previews: some View {
        ContractView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
