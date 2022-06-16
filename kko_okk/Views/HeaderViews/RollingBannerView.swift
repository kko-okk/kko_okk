//
//  RollingBannerView.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/07.
//

import SwiftUI

struct RollingBannerView: View {
    @State var selectedItem = 0
    var RBC = RollingBannerController()
    let RBTime : Double = 5
    // RollingBanner Time 롤링베너가 몇 초에 한번씩 변경할지 정합니다.
    
    var body: some View {
        TabView(selection: $selectedItem){
            ForEach((0...BannerViews.allCases.count - 1),id: \.self) {
                RBC.pageing(view: BannerViews.allCases[$0])
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
        .onAppear{
            playRollingBanner()
        }
        
        
    }
    
}

// View에는 View에 해당하는 코드만 깔끔하게 들어가길 바라며
// 사용되는 extension을 사용했습니다.
extension RollingBannerView{
    func playRollingBanner(){
        Timer.scheduledTimer(withTimeInterval: RBTime, repeats: true){(Timer) in
            withAnimation(.easeInOut(duration: 1)){
                // 하단 주석 1참고
                guard selectedItem == BannerViews.allCases.count - 1 else {
                    selectedItem = selectedItem + 1
                    return
                }
                selectedItem = 0
            }
        }
    }
    
}

struct RollingBannerView_Previews: PreviewProvider {
    static var previews: some View {
        RollingBannerView()
    }
}

/*
 주석1
 if selectedItem == BannerViews.allCases.count - 1{
 selectedItem = 0
 }else{
 selectedItem = selectedItem + 1
 }
 이 코드와
 
 guard selectedItem == BannerViews.allCases.count - 1 else {
 selectedItem = selectedItem + 1
 return
 }
 selectedItem = 0
 이 코드는 동일하게 동작합니다.
 
 스위프트에서는 guard (거짓일떄 먼저 실행)을 많이 사용해 넣어 봤습니다.
 
 */

