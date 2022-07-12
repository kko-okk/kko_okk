//
//  Size.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//
import UIKit

// 사용 예시 :
//Rectangle()
//    .frame(width: KkookkSize.titleWidth, height: KkookkSize.titleHeight)

enum KkookkSize {
    
    static var fullWidth: CGFloat{ UIScreen.main.bounds.width }
    static var fullHeight: CGFloat{ UIScreen.main.bounds.height }
    
    // Header
    static var titleWidth: CGFloat{ KkookkSize.fullWidth }
    static var titleHeight: CGFloat{ KkookkSize.fullHeight / 8 }
    
    // Board

    // Padding

    // OnBoard
    static var onBoardingWidth: CGFloat{ KkookkSize.fullWidth / 5}
    static var onBoardingHeight: CGFloat{ KkookkSize.fullHeight / 18}
}
