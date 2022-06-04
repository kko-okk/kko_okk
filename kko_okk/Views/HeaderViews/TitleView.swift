//
//  TitleView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//
//  Codeing by Ruyha
//  중간중간 주석 처리 되어 있는 백그라운드 컬러 값은
//  배경의 영역확인을 위해 만들어 놓은 코드이니 삭제하지 말아주세요.
//  추후 완벽하게 View 사이즈 디자인이 끝나면 제거 하겠습니다.


import SwiftUI

struct TitleView: View {
    let HVA = HeaderViewAssets()
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
//            Color.brown
            TitleBackGroundView()
                .frame(width: HVA.RTitleWidth, height: HVA.RTitleHeight, alignment: .bottomLeading)
                .cornerRadius(HVA.cornerRadius)
            
            TitleLeadingView()
                .frame(width: HVA.RTitleWidth, height: HVA.RTitleHeight, alignment: .bottomLeading)
            
            TiltleHandsView()
                .frame(width: HVA.RTitleWidth, height: HVA.RTitleHandHeight, alignment: .bottomLeading)
            
        }//ZStack
    }
}


struct TitleBackGroundView: View {
    let HVA = HeaderViewAssets()
    var body: some View {
        //        Color.red
        Color.white
    }
}


struct TitleLeadingView: View {
    let HVA = HeaderViewAssets()
    // 미리 만들어 놓은 HeaderViewAssets 클래스를 상수에 할당해 사용하는것입니다.
    
    
    let tips: [TipModel] = TipModel.tips
    // 구엘이 미리 만들어 놓은 팁 모델에서 팁을 가져오는 것 입니다.
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            
            Text("2022년 5월 31일 화요일")
                .font(.system(size:20 ,weight:.light))
                .padding(.top,15)
            Spacer()
            
            HStack{
                Text("오늘 가족과의 약속은")
                    .font(.system(size:30 ,weight:.regular))
                Image("Ruyha_KKooKK")
                    .resizable()
                    .frame(width: 100, height:40,alignment: .trailing)
                // 이미지를 받지 못해 대충 캡쳐해서 넣어서 Ruyha를 붙여 이름을 넣어 사용했습니다.
                // 이미지의 프레임을 조절 하려면 반드시 .resizable()를 사용해야 합니다.
                
                Text("지키셔야 돼요!")
                    .font(.system(size:30 ,weight:.regular))
            }
            Spacer()
            
            Text(tips[HVA.RandomTipInt()].conent)
                .font(.system(size:15 ,weight:.light))
                .padding(.bottom,15)
            //  Text(tips[HVA.RandomTipInt()].conent)
            //  Text(tips[0].conent) 이런식으로 사용해도 되지만
            //  랜덤으로 값을 출력하고 싶어 미리 만들어 놓은 함수를 호출해 리턴값으로
            //  랜던값을 받게 만들어 놨습니다.

            Spacer()
            
        }.padding(.leading,32)
    }
}

struct TiltleHandsView : View{
    let HVA = HeaderViewAssets()

    var body: some View{
        HStack{
            Spacer()
            Image("RuyhaHands")
                .resizable()
                .frame(width: 320, height:HVA.RTitleHandHeight,alignment: .trailing)
                .padding(.trailing,60)
            //아직 이미지 파일을 받지 못함...
        }
        
        
    }
}


struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
