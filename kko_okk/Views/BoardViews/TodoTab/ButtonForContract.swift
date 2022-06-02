//
//  ButtonForContract.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/30.
//

import Foundation
import SwiftUI

var parentColor = Color.orange

struct ButtonForContract: View {
    var body: some View {
        ZStack {
            Button(action: {
                print("Button tapped")
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(parentColor)
                        .frame(height: 150)
                    
                    HStack {
                        VStack {
                            Text("Contract Title")
                                .font(.system(size: 20))
                                .foregroundColor(.white)

                            Text("Contract Detail")
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                        }
                        .padding(.leading)
                        
                        Spacer()
                    }
                }
            }
            
            Button(action: {
                print("Edit button tapped")
            }) {
                VStack {
                    ZStack {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: 30, height: 6)
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.white)

                        Rectangle()
                            .fill(parentColor.opacity(0.0))
                            .frame(width: 40, height: 40)
                    }

                    Spacer()
                        .frame(width: 30, height: 80)
                }
            }
        }
    }
}

struct ButtonForContract_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForContract()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
