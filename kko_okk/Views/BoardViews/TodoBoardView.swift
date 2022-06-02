//
//  TodoBoardView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/02.
//

import SwiftUI

struct TodoBoardView: View {
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                ParentWishView()
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
//                        .foregroundColor(.gray)
//                }
                
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
//                    .foregroundColor(.gray)
//                }
                ContractView()
                
                ChildWishView()
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
//                        .foregroundColor(.gray)
//                }
            }
        }
    }
}

struct TodoBoardView_Previews: PreviewProvider {
    static var previews: some View {
        TodoBoardView()
    }
}
