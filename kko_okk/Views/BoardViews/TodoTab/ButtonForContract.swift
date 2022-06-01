//
//  ButtonForContract.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/30.
//

import Foundation
import SwiftUI

struct ButtonForContract: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)

            VStack {
                TextField("Title", text: .constant(""))
                    .padding()

                TextField("Contract Context", text: .constant(""))
                    .padding()
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.orange, lineWidth: 2)
        )
    }
}

struct ButtonForContract_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForContract()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
