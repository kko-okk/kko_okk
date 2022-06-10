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
}

class HeaderViewAssets{
    let cornerRadius      : CGFloat = 15
    let RTitleWidth       : CGFloat = 965
    let RTitleHeight      : CGFloat = 145
    let RTitleHandHeight  : CGFloat = 180
    // ZStack으로 View를 쌓는 방식으로 디자인했는데
    // 추후 수정시 모두 동일한 값으로 수정해야 하는 값을들
    // 할당해 놨습니다.
    
    let headerViewfullWidth = KkookkSize.fullWidth - 80 //헤더뷰 전체 길이 - 좌우 패딩 40씩
    let headerViewfullheight = KkookkSize.fullHeight * 0.172
    let headerViewCellheight = KkookkSize.fullHeight * 0.141
    
    
    
    
    //대충 팁의 갯수를 파악해서 랜덤 값을 뽑아서 던저주는 함수입니다.
    //view 안에 만들어 놓으면 코드가 더러워질것 같아서 여기에 넣어 봤어요.
    func RandomTipInt() -> Int{
        let tipsCount =  TipModel.tips.count - 1
        return Int.random(in: 0...tipsCount)
    }
    
    //대충 문자열 안의 특정 문자열만 색상 바꾸는 함수
    func partialColorString(allString: String,allStringColor: Color ,partialString: String, partialStringColor: Color ) -> AttributedString {
        var string = AttributedString(allString)
        string.foregroundColor = allStringColor
        
        if let range = string.range(of: partialString) {
            string[range].foregroundColor = partialStringColor
        }
        return string
        
    }
    
    
    
    //대충 문자열 안의 특정 문자열만 폰트 바꾸는 함수
    func changeFont(allString: String,allStringFont:Font, partialString: String, partialStringFont:Font) -> AttributedString {
        var string = AttributedString(allString)
        string.font = allStringFont
        
        if let range = string.range(of: partialString) {
            string[range].font = partialStringFont
        }
        return string
    }
    
    func DateType2String() -> String{
        let current = Date()
        
        let formatter = DateFormatter()
        //한국 시간으로 표시
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        //형태 변환
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.string(from: current)
    }
    
    func kkookkDate(date:Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy년 MM월 dd일 EEEE"
        return formatter.string(from: date)
    }
    // 원본코드 출처 https://hururuek-chapchap.tistory.com/156
    
    
    
    var headerImageHeight:Double {
        if KkookkSize.fullHeight > 1000{
           return 40
        }else{
            return 30
        }
    }

    
    var headerImageWidth:Double {
        if KkookkSize.fullHeight > 1000{
           return 100
        }else{
            return 75
        }
    }
    
}


/*
 미니가 2048 ~ 2266 2360 / 
 */
