//
//  FirstBoardView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct TodoBoardView: View {
    @ObservedObject var pickedDate = PickedDate()
    var body: some View {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10).foregroundColor(Color.Kkookk.commonWhite)
                    ParentWishView()
                }

                ZStack{
                    RoundedRectangle(cornerRadius: 10).foregroundColor(Color.Kkookk.commonWhite)
                    ContractView()
                }

                ZStack{
                    RoundedRectangle(cornerRadius: 10).foregroundColor(Color.Kkookk.commonWhite)
                    ChildWishView()
                }
                
            }
            .padding([.leading, .trailing], 8)
            .padding(.top, 5)
        .background(Color.Kkookk.backgroundGray)
    }
}


struct FirstBoardView_Previews: PreviewProvider {
    static var previews: some View {
        TodoBoardView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
