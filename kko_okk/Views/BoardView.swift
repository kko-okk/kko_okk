//
//  BoardView.swift
//  kko_okk
//
//  Created by Yeni Hwang on 2022/06/01.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        VStack{
            // Custom Tab Bar 만들기 (ex. 약속 만들기, 약속 리포트(이행률) 보기, 설정)
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("약속 만들기")
                })
                
                Button(action: {
                    
                }, label: {
                    Text("이행률 보기")
                })
                Button(action: {
                    
                }, label: {
                    Text("설정")
                })
            }.padding(10)
            
            // Tab에 따라 보여줄 Board
            TodoBoardView()
        }.padding(10)
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
