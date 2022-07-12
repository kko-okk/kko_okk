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
                .shadow(color: Color(hex: "#D9D9D9"), radius: 5, x: 3, y: 3)
            
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
    //MARK: 이부분이 데이터 피커에서 선택된 날짜값을 가지고 있습니다.
    //코어 용사 구엘 화이팅!!
    @State var date = Date()
    @EnvironmentObject var pickedDate: PickedDate
    //let tips: [TipModel] = TipModel.tips
    // 구엘이 미리 만들어 놓은 팁 모델에서 팁을 가져오는 것 입니다.
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            
            ZStack{
                HStack{
                    Text("\(HeaderViewConst.shared.dateToString(date: pickedDate.date))")
                        .font(Font.Kkookk.headerDate)
                        .foregroundColor(Color.Kkookk.commonBlack)
                    Spacer()
                }
                
                HStack{
                    DatePickerView()
                        .frame(width: 20, height: 20, alignment: .leading)
                        .padding(.leading,220)
                    Spacer()
                }
            }
            
            Spacer()
            
            HStack(spacing: 0){
                Text("TitleViewTitle1".localized)
                    .font(Font.Kkookk.headerDefaultTitle)
                    .foregroundColor(Color.Kkookk.commonBlack)
                Image("Ruyha_KKooKK")
                    .resizable()
                    .frame(width: HeaderViewConst.shared.titleImageWidth, height:HeaderViewConst.shared.titleImageHeight,alignment: .trailing)
                    .foregroundColor(Color.Kkookk.commonBlack)
                //꼬-옥 부분이 이미지로 들어감 영어 처리 할꺼면
                //영문 이미지를 추가 하거나 자간 수정해서 텍스트 처리 필요
                Text("TitleViewTitle3".localized)
                    .font(Font.Kkookk.headerDefaultTitle)
                    .foregroundColor(Color.Kkookk.commonBlack)
            }
            
            Spacer()
            
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
