//
//  EditPromisePopover.swift
//  kko_okk
//
//  Created by Seodam on 2022/06/04.
//

import SwiftUI

struct EditPromisePopover: View {
    // PromiseCell로부터 약속 받아오기
    @ObservedObject var promise: Promise
    
    // viewContext 받아오기
    @Environment(\.managedObjectContext) private var viewContext
    
    // popover 띄우고 닫을 변수
    @Binding var isPresented: Bool
    
    // 완료 버튼을 누르기 전까지 임시 값을 저장하는 변수
    @State var name: String = ""
    @State var memo: String = ""
    
    // 반복 가능 요일
    let days: [String] = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    // Popover 열기
                    isPresented.toggle()
                } label: {
                    Text("취소")
                }
                
                Spacer()
                
                Text("약속 수정하기")
                
                Spacer()
                
                Button {
                    // name, memo 변수에 저장되어 있는 임시값을 CoreData에 업데이트
                    updatePromise(promise: promise)
                    
                    // Popover 닫기
                    isPresented.toggle()
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
                // name, memo 텍스트필드를 붙어있는 것처럼 만들기 위한 사각형
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 760, height: 200)
                    .foregroundColor(.white)
                
                VStack {
                    // name 수정하는 영역
                    TextField("", text: $name)
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.horizontal, 13)
                    
                    Divider()
                        .padding(.horizontal, 8)
                        .foregroundColor(.gray)
                    
                    // memo 수정하는 영역
                    TextEditor(text: $memo)
                        .frame(width: 760, height: 130)
                        .cornerRadius(15)
                        .padding(.horizontal, 8)
                }
            }
            
            // 반복 날짜 선택 버튼
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
        .onAppear() {
            // 뷰를 그릴 때, 받아온 약속의 name, memo 값을 임시값에 저장
            name = promise.name ?? ""
            memo = promise.memo ?? ""
        }
        .padding()
        .frame(width: 800, height: 500)
        .background(.bar)
    }
    
    // name, memo 변수에 저장되어 있는 임시값을 CoreData에 업데이트.
    private func updatePromise(promise: Promise) {
        withAnimation {
            promise.name = name
            promise.memo = memo

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
