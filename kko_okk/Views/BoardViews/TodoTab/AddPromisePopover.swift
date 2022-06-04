//
//  AddWishPopover.swift
//  kko_okk
//
//  Created by Seodam on 2022/06/03.
//

import SwiftUI

struct AddPromisePopover: View {
    // Subject enum이 .parent인지 .child인지에 따라 뷰의 기능이 달라짐.
    var subject: Subject
    
    // viewContext 받아오기
    @Environment(\.managedObjectContext) private var viewContext
    
    // popover 띄우고 닫을 변수
    @Binding var isShowingPopover: Bool
    
    //
    @State var name: String = "할 일"
    @State var memo: String = "상세 내용"
    
    // 반복 가능 요일
    let days: [String] = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    isShowingPopover.toggle()
                } label: {
                    Text("취소")
                }
                
                Spacer()
                
                switch subject {
                case .parent:
                    Text("부모의 약속 만들기")
                case .child:
                    Text("아이의 약속 만들기")
                }
                
                Spacer()
                
                Button {
                    addPromise()
                    isShowingPopover.toggle()
                } label: {
                    Text("완료")
                }
            }
            .padding()
            .font(.title3)
            
            HStack {
                Text("할 일 정하기")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: .infinity, height: 200)
                    .foregroundColor(.white)
                
                VStack {
                    TextField("", text: $name)
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.horizontal, 13)
                    
                    Divider()
                        .padding(.horizontal, 8)
                        .foregroundColor(.gray)
                    
                    TextEditor(text: $memo)
                        .frame(width: .infinity, height: 130)
                        .cornerRadius(15)
                        .padding(.horizontal, 8)
                }
            }
            HStack {
                Text("반복")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                ForEach(days, id: \.self) { day in
                    Button(action: {
                        
                    }, label: {
                        Text(day)
                            .foregroundColor(.black)
                    })
                    .buttonStyle(.bordered)
                    .padding(.horizontal)
                }
            }
        }
        .padding()
        .frame(width: 800, height: 500)
        .background(.bar)
    }
    
    private func addPromise() {
        withAnimation {
            let promise = Promise(context: viewContext)
            promise.id = UUID()
            promise.name = name
            promise.memo = memo
            promise.madeTime = Date()
            promise.promised = false
            promise.parentCheck = false
            promise.childCheck = false
            promise.isDone = false
            promise.isRepeat = false
            
            switch subject {
            case .parent:
                promise.subject = "parent"
            case .child:
                promise.subject = "child"
            }

            promise.repeatType = ""
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

//struct AddWishPopover_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPromisePopover()
//            .previewInterfaceOrientation(.landscapeRight)
//    }
//}
