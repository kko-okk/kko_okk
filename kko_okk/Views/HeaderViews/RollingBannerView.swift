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
    var RBC = RollingBannerController()
    let RBTime : Double = 8
    // RollingBanner Time 롤링베너가 몇 초에 한번씩 변경할지 정합니다.
    
    //TODO: 팁 설정하는 부분 혼자 결정하기 뭐해서 남겨 놓은 주석들입니다.
    //TODO: 다들 별 문제 없다고 생각하면 6/19일 이후 삭제 예정
    var body: some View {
        TabView(selection: $selectedItem){
            ForEach((0...tips.count - 1),id:\.self){ gz in
                // RBC.tipViewMaker(text:"\(tips[$0].conent)" )
                // 팁을 순서대로 넣어 주는 코드 단점 : 앱을 사용하는 내내 앞에 있는 팁만 잘보임
                RBC.tipViewMaker(text: "\(tips[HeaderViewConst.shared.randomTipMaker()].contents)")
                //팁을 랜덤으로 보내줌
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        //  기존설정이 맘에든다면 하단의 주석을 사용하세요.
        //        .tabViewStyle(PageTabViewStyle())
        //        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
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
                guard selectedItem == tips.count - 1 else {
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

