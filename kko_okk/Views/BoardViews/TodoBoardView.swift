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
    let todoBoardCornerRadius : CGFloat = 20
    var body: some View {
        HStack {
                ParentWishView()
                    .modifier(TodoBoardListView(cornerRadius: todoBoardCornerRadius))

                ContractView()
                    .modifier(TodoBoardListView(cornerRadius: todoBoardCornerRadius))

                ChildWishView()
                    .modifier(TodoBoardListView(cornerRadius: todoBoardCornerRadius))
        }
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

//MARK: ViewModifier를 사용하면 깔끔하게 ㅆㄱㄴ
struct TodoBoardListView: ViewModifier {
    var cornerRadius : CGFloat

    func body(content: Content) -> some View {
        content
            .background(Color.Kkookk.commonWhite)
            .cornerRadius(cornerRadius, corners: .topRight)
            .cornerRadius(cornerRadius, corners: .topLeft)
            .shadow(color: Color(hex: "#D9D9D9"), radius: 5, x: 3, y: 3)
    }
}
