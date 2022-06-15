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

struct HeaderViewConst{
    static let shared = HeaderViewConst()
    
    let cornerRadius: CGFloat = 15
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
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy년 MM월 dd일 EEEE"
        return formatter.string(from: date)
    }
    // 원본코드 출처: https://hururuek-chapchap.tistory.com/156
}
