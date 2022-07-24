//
//  OnBoardingMainView.swift
//  kko_okk_test
//
//  Created by 김제필 on 7/23/22.
//

import Foundation
import SwiftUI
import UIKit

struct OnBoardingMainView: View {
    var body: some View {
        VStack {
            OnBoardingSegmentView()

            HStack {
                OnBoardingParentButton()
                OnBoardingContractButton()
                OnBoardingChildButton()
            }
        }
        .frame(width: KkookkSize.fullWidth / 1.3)
    }
}


//struct OnBoardingMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingMainView()
//                .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
