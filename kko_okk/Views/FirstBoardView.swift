//
//  FirstBoardView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct FirstBoardView: View {
    var body: some View {
        VStack {
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("Hello, World!")
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            
            Divider()
            
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
            }
        }
    }
}


struct FirstBoardView_Previews: PreviewProvider {
    static var previews: some View {
        FirstBoardView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
