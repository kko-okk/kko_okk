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
   
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            TitleBackgroundView()
                .frame(height: HeaderViewConst.shared.cellHeight, alignment: .bottomLeading)
                .cornerRadius(HeaderViewConst.shared.cornerRadius)
            
            TitleLeadingView()
                .frame(height: HeaderViewConst.shared.cellHeight, alignment: .bottomLeading)
                .clipped()
            
            TiltleHandsView()
                .frame(height: HeaderViewConst.shared.fullHeight, alignment: .bottomTrailing)
        }
    }
}


struct TitleBackgroundView: View {
    var body: some View {
        Color.white
    }
}


struct TitleLeadingView: View {
    @State var date = Date()
    let tips: [TipModel] = TipModel.tips
    // 구엘이 미리 만들어 놓은 팁 모델에서 팁을 가져오는 것 입니다.
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            
            ZStack{
                HStack{
                    Text("\(HeaderViewConst.shared.dateToString(date: date))")
                        .font(Font.Kkookk.headerDate)
                        .foregroundColor(Color.Kkookk.commonBlack)
                    Spacer()
                }
                
                HStack{
                    DatePickerView(date: $date)
                        .frame(width: 20, height: 20, alignment: .leading)
                        .padding(.leading,220)
                    Spacer()
                }
            }
            
            Spacer()
            
            HStack(spacing: 0){
                Text("오늘 가족과의 약속은 ")
                    .font(Font.Kkookk.headerDefaultTitle)
                    .foregroundColor(Color.Kkookk.commonBlack)
                Image("Ruyha_KKooKK")
                    .resizable()
                    .frame(width: HeaderViewConst.shared.titleImageWidth, height:HeaderViewConst.shared.titleImageHeight,alignment: .trailing)
                    .foregroundColor(Color.Kkookk.commonBlack)
                
                Text(" 지키셔야 돼요!")
                    .font(Font.Kkookk.headerDefaultTitle)
                    .foregroundColor(Color.Kkookk.commonBlack)
            }
            
            Spacer()
            
            HStack(spacing: 0){
                Text(" TIP ")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(hex:"#474747"))
                            .frame(width: 38, height: 23)
                    ).padding(.trailing,5)
                
                Text(tips[HeaderViewConst.shared.randomTipMaker()].contents)  // conent -> contents로 변경
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color.Kkookk.commonBlack)
            }
            
            Spacer()
            
        }.padding(.leading,HeaderViewConst.shared.fullWidth * 0.02)
    }
}

struct TiltleHandsView : View{
    var body: some View{
        HStack{
            Spacer()
            Image("TitleHands")
                .resizable()
                .frame(width: HeaderViewConst.shared.fullHeight * 1.57, height:HeaderViewConst.shared.fullHeight, alignment: .trailing)
                .padding(.trailing,HeaderViewConst.shared.fullWidth * 0.053)
        }
    }
}


struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
