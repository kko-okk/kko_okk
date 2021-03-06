//
//  checkPromiseView.swift
//  kko_okk
//
//   Created by μ΄μ±λΈ on 2022/06/16.
//
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
                    Text("checkPromiseViewBody1".localized)
                        .font(.Kkookk.promiseUltraLight)
                    HStack(alignment:.center){
                        Text("checkPromiseViewBody2".localized)
                            .font(.Kkookk.promiseUltraLight)
                        
                        ZStack(alignment:.bottom){
                            Text("\(clearPromiseCount)")
                                .font(.largeTitle.bold())
                                .background(
                                    underlineView()
                                )
                        } 
                        Text("checkPromiseViewBody3".localized+" π")
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
        //TODO: κ΅­κ°μ λ°λΌ λ€λ₯΄κ² μ²λ¦¬ νμ 22/06/30μμ± μλ£μ μ κ±° λ°λ
        
        //μ¬κΈ°μ κΈ°μνμ§ μμ λ μ§λ 1λ‘ μ΄κΈ°νκ° λλ€
        let components = calendar.dateComponents([.year, .month], from: date)

        //dayλ₯Ό κΈ°μνμ§ μμμ νμ¬ λ¬μ μ²«λ²μ¨° λ μ§κ° λμ€κ² λλ€
        let startOfMonth = calendar.date(from: components)!

        //μ΄λ² λ¬μ λ§μ§λ§ λ μ§λ₯Ό κ΅¬ν΄μ£ΌκΈ° μν΄μ λ€μλ¬μ κ΅¬νλ€ μ΄κ²λ dayλ₯Ό λ£μ΄μ£Όμ§ μμκΈ° λλ¬Έμ 1μ΄ λ€μλ¬μ 1μΌμ΄ λμ€κ² λλ€
        let nextMonth = calendar.date(byAdding: .month, value: +1, to: startOfMonth)
        
        let dailyPromisesCount: Int = dailyPromises.filter{ startOfMonth <= $0.madeTime && $0.madeTime <=  nextMonth! }.filter{$0.isDone == true}.count
        
        clearPromiseCount = dailyPromisesCount
    }
}

//MARK: μΈλλΌμΈμ μ»€μ€νν΄μ λ§λ€μμ΅λλ€.
// λ³Έλ¬Έμ Veiwμ½λμμ

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
