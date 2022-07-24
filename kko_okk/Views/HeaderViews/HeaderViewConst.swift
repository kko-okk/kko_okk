//
//  HeaderViewAssets.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/03.
//
//  값을 고정하고 사용할것 같은 친구들을 담아 놓은 파일 입니다.
//  싱글톤으로 쓰면 편한데 메모리 상에 항상 올려 놓기는 가슴 아플 것 같아서 간단히 만들어 봤습니다.
//
//  HeaderView에서 공통적으로 사용 될 것 같은 변수(상수),함수를 모아놓은 클래스입니다.
//  혹은 View안에 함수를 만들면 코드가 길어져 가독성을 해치기에 뺴놓은 것도 있습니다.


import SwiftUI

struct HeaderViewConst{
    static let shared = HeaderViewConst()
    
    let cornerRadius: CGFloat = 15
    let kkookkPading: CGFloat = 40
    let fullWidth = KkookkSize.fullWidth - 80 //헤더뷰 전체 길이 - 좌우 패딩 40씩
    let fullHeight = KkookkSize.fullHeight * 0.172
    let cellHeight = KkookkSize.fullHeight * 0.141
    
    var titleImageHeight: Double { KkookkSize.fullHeight > 1000 ? 40 : 30 }
    var titleImageWidth: Double { KkookkSize.fullHeight > 1000 ? 100 : 75 }
    //삼항연산자 사용
    
    func randomTipMaker() -> Int{
        let tipsCount =  TipModel.tips.count - 1
        return Int.random(in: 0...tipsCount)
    }
    
    //문자열 안의 특정 문자열만 색상 바꾸는 함수
    func changeColorString(entireSentence: String, entireColor: Color, partialSentence: String, partialColor: Color ) -> AttributedString {
        var string = AttributedString(entireSentence)
        string.foregroundColor = entireColor
        if let range = string.range(of: partialSentence) {
            string[range].foregroundColor = partialColor
        }
        return string
    }
    
    
    
    //문자열 안의 특정 문자열만 폰트 바꾸는 함수
    func changeFontString(entireSentence: String,entireFont: Font, partialSentence: String, partialFont: Font) -> AttributedString {
        var string = AttributedString(entireSentence)
        string.font = entireFont
        
        if let range = string.range(of: partialSentence) {
            string[range].font = partialFont
        }
        return string
    }

    func dateToString(date: Date) -> String{
        let formatter = DateStruct.shared.kkookkDate()
        formatter.dateFormat = "HeaderViewDateFormat".localized
        return formatter.string(from: date)
    }
    // 원본코드 출처: https://hururuek-chapchap.tistory.com/156
}

//MARK: 색상을 헥사 코드를 사용가능 하게 만드는 코드
extension Color{
    init(hex:String){
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red:r , green: g , blue: b)
    }
    //원본 코드 출처 : https://seons-dev.tistory.com/174
}

//MARK: 폰트의 사이즈를 유동적으로 변경 시켜주는 extension
extension View {
    func fitSystemFont(lineLimit: Int = 1, minimumScaleFactor: CGFloat = 0.01, percentage: CGFloat = 1) -> ModifiedContent<Self, FitSystemFont> {
        return modifier(FitSystemFont(lineLimit: lineLimit, minimumScaleFactor: minimumScaleFactor, percentage: percentage))
    }
    //원본 코드 출처 : https://stackoverflow.com/questions/57035746/how-to-scale-text-to-fit-parent-view-with-swiftui
}

//MARK: 폰트의 사이즈를 유동적으로 변경 시켜주는 ViewModiFier
struct FitSystemFont: ViewModifier {
    var lineLimit: Int
    var minimumScaleFactor: CGFloat
    var percentage: CGFloat
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .font(.system(size: min(geometry.size.width, geometry.size.height) * percentage))
                .lineLimit(self.lineLimit)
                .minimumScaleFactor(self.minimumScaleFactor)
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
        }
    }
    //원본 코드 출처 : https://stackoverflow.com/questions/57035746/how-to-scale-text-to-fit-parent-view-with-swiftui
}

//MARK: View의 특정 모서리만 코너를 주는 것
//배열로 값을 받아오게 수정하고 싶은데 안되서 슬픔...
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
            clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    //원본 코드 출처 : https://iamcho2.github.io/2020/11/19/swiftui-round-specific-coners
}

