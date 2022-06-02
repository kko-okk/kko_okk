//
//  Color.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import Foundation
import UIKit

enum Style {
    enum Color {
        static var white: UIColor {
            return .white
        }
        
        static var black: UIColor{
            return .black
        }
    }
    
    
    enum FontSize {
        static var Title: UIFont {
            .systemFont(ofSize: 22)
        }
        
        static var Title1: UIFont {
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
}
