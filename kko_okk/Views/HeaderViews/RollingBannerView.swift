//
//  RollingBannerView.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/07.
//

import SwiftUI

struct RollingBannerView: View {
    @State var selectedItem = 0
    let tips: [TipModel] = TipModel.tips
    var rollingController = RollingBannerController()
    let time: Double = 8
    let viewCount: Int = TipModel.tips.count - 1
    
    //TODO: 팁 설정하는 부분 혼자 결정하기 뭐해서 남겨 놓은 주석들입니다.
    //TODO: 다들 별 문제 없다고 생각하면 6/19일 이후 삭제 예정
    var body: some View {
        TabView(selection: $selectedItem){
            ForEach((0...viewCount),id:\.self){ gz in
                rollingController.tipViewMaker(text: //"\(tips[HeaderViewConst.shared.randomTipMaker()].contents)")
//                "\(tips[11].contents)")
                                               "\(tips[gz].contents)")

            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
        //        .tabViewStyle(.page(indexDisplayMode: .never)) 인디케이더 증발코드
        .onAppear{
            playRollingBanner()
            setupAppearance()
        }
    }
    
}

// View에는 View에 해당하는 코드만 깔끔하게 들어가길 바라며
// 사용되는 extension을 사용했습니다.
extension RollingBannerView{
    func playRollingBanner(){
        Timer.scheduledTimer(withTimeInterval: time, repeats: true){(Timer) in
            withAnimation(.easeInOut(duration: 1)){
                // 하단 주석 1참고
                guard selectedItem == viewCount else {
                    selectedItem = selectedItem + 1
                    return
                }
                selectedItem = 0
            }
        }
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color(hex: "#7C7C7C"))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color(hex: "#D9D9D9"))
        //TODO: 확인바람
        //#주석1
        //해당 코드는 현제 페이지 뿐 아니라 모든 인디케이터의 색상을 바꾸는 문제가 있습니다.
        //하지만 이렇게 하지않으면 불가능해서..
    }
    
}

struct RollingBannerView_Previews: PreviewProvider {
    static var previews: some View {
        RollingBannerView()
    }
}


/*
 코드 출처
 #주석1
 https://stackoverflow.com/questions/62864221/change-tabview-indicator-swiftui
 */
