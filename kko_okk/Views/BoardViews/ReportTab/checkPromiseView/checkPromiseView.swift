//
//  checkPromiseView.swift
//  kko_okk
//
//   Created by 이성노 on 2022/06/16.
//

import SwiftUI

struct checkPromiseView: View {
    @State var clearPromiseCount : Int = 2222
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Color.white
                VStack{
                    Spacer()
                    HStack(alignment:.center){
                        Text("총")
                            .font(.Kkookk.promiseUltraLight)
                        
                        ZStack(alignment:.bottom){
                            Text("\(clearPromiseCount)")
                                .font(.title.bold())
                                .background(
                                    underlineView()
                                )
                        } 
                        Text("개의 약속을 지켰어요! 😆")
                            .font(.Kkookk.promiseUltraLight)
                    }
                    Image("OneHand")
                        .resizable()
                        .frame(width: geometry.size.height * 0.4 * 0.8, height: geometry.size.height * 0.4, alignment: .center)
                }
            }
        }
    }
}

//MARK: 언더라인을 커스텀해서 만들었습니다.
// 본문의 Veiw코드에서

struct underlineView: View {
    var body: some View {
        VStack{
            Spacer()
            Rectangle()
                .fill(Color(hex: "#FC77D3"))
                .frame(height: 6)
                .padding(.bottom,6)
        }
    }
}
