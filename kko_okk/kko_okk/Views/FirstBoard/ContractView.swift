//
//  ContractView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

// ContractView
struct ContractView: View {
    var body: some View {
        VStack {
            HStack {
                TextField("엄빠-아이 계약!", text: .constant(""))
                    .padding(.leading, 10)
                }

            Divider()
        }
    }
}

struct ContractView_Previews: PreviewProvider {
    static var previews: some View {
        ContractView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
