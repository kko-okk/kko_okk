//
//  checkPromiseView.swift
//  kko_okk
//
//   Created by 이성노 on 2022/06/16.
//

import SwiftUI

struct checkPromiseView: View {
    var clearPromiseCount : Int
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
    
    init(dailyPromises: FetchedResults<Promise>, pickedDate: PickedDate) {
        let date = pickedDate.date
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "ko")

        //여기에 기입하지 않은 날짜는 1로 초기화가 된다
        let components = calendar.dateComponents([.year, .month], from: date)

        //day를 기입하지 않아서 현재 달의 첫번쨰 날짜가 나오게 된다
        let startOfMonth = calendar.date(from: components)!

        //이번 달의 마지막 날짜를 구해주기 위해서 다음달을 구한다 이것도 day를 넣어주지 않았기 때문에 1이 다음달의 1일이 나오게 된다
        let nextMonth = calendar.date(byAdding: .month, value: +1, to: startOfMonth)
        
        let dailyPromisesCount: Int = dailyPromises.filter{ startOfMonth <= $0.madeTime && $0.madeTime <=  nextMonth! }.filter{$0.isDone == true}.count
        
        clearPromiseCount = dailyPromisesCount
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
