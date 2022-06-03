//
//  Style.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//
import UIKit

enum Style {
    
    // UIColor 타입으로 사용시 Style.Color.Purple
    // Color 타입으로 사용시 Color(Style.Color.Purple)
    
    enum Color {
        static var parentPurple: UIColor {
            guard let color = UIColor(named: "kkookkPurple") else { return UIColor.purple }
            return color
        }
        
        static var childGreen: UIColor{
            guard let color = UIColor(named: "kkookkPurple") else { return UIColor.green }
            return color
        }
        
        static var commonTintBlack: UIColor {
            guard let color = UIColor(named: "kkookkPurple") else { return UIColor.black }
            return color
        }

        static var commonWhite: UIColor {
            guard let color = UIColor(named: "kkookkPurple") else { return UIColor.white }
            return color
        }
        
        static var unselectedTabGray: UIColor {
            guard let color = UIColor(named: "gray1") else { return UIColor.gray }
            return color
        }
        
        static var tabDividerGray: UIColor {
            guard let color = UIColor(named: "gray2") else { return UIColor.gray }
            return color
        }
        
        static var countBadgeGray: UIColor {
            guard let color = UIColor(named: "gray2") else { return UIColor.gray }
            return color
        }
        
        static var tableDividerGray: UIColor {
            guard let color = UIColor(named: "gray3") else { return UIColor.gray }
            return color
        }
        
        static var backgorundGray: UIColor {
            guard let color = UIColor(named: "gray5") else { return UIColor.gray }
            return color
        }
        
    }
    
    enum Font {
        static var selectedTabStyle: Font {
//            .font(.custom("AppleSDGothicNeoB00", size: 20))
        }
        
//        static var unselectedTabStyle: UIFont {
////            .font(.custom("AppleSDGothicNeoB00", size: 19))
//        }
        
        static var cellTitle: UIFont {
            .systemFont(ofSize: 23)
        }
        
        static var cellContent: UIFont {
            .systemFont(ofSize: 17)
        }
    }
    
    enum ViewSize{
        
        static var fullWidth: CGFloat{
            return UIScreen.main.bounds.width
        }
        
        static var fullHeight: CGFloat{
            return UIScreen.main.bounds.height
        }
        
        enum HeaderSize{
            static var width: CGFloat {
                Style.ViewSize.fullWidth
            }
            
            static var height: CGFloat {
                Style.ViewSize.fullHeight / 8
            }
        }
    }
    
//    enum PaddingSize{
//
//    }
    
    
    
    
}
