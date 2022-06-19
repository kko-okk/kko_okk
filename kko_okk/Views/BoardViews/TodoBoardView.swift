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
            HStack{
                Button("warning") { HapticManager.instance.notification(type: .warning) }
                Button("error") { HapticManager.instance.notification(type: .error) }
                Button("success") { HapticManager.instance.notification(type: .success) }
                Button("heavy") { HapticManager.instance.impact(style: .heavy) }
                Button("light") { HapticManager.instance.impact(style: .light) }
                Button("medium") { HapticManager.instance.impact(style: .medium) }
                Button("rigid") { HapticManager.instance.impact(style: .rigid) }
                Button("soft") { HapticManager.instance.impact(style: .soft) }
            }
            
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
        }
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
