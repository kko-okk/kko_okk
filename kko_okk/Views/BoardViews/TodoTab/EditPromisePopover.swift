//
//  EditPromisePopover.swift
//  kko_okk
//
//  Created by Seodam on 2022/06/04.
//

import SwiftUI

struct EditPromisePopover: View {
    // Subject enum이 .parent인지 .child인지에 따라 뷰의 포인트 컬러와 subject attribute 기능이 달라짐.
    var subject: Subject
    
    // PromiseCell로부터 약속 받아오기
    @ObservedObject var promise: Promise
    
    // viewContext 받아오기
    @Environment(\.managedObjectContext) private var viewContext
    
    // popover 띄우고 닫을 변수
    @Binding var isPresented: Bool
    
    // 완료 버튼을 누르기 전까지 임시 값을 저장하는 변수
    @State var name: String = ""
    @State var memo: String = ""
    
    // 반복 요일
    @State var isRepeating: [Bool] = [false, false, false, false, false, false, false]
    
    //
    let popoverAssets = PopoverAssets()
    
    var body: some View {
        VStack {
            // 팝오버 네비게이션 바
            // 취소, 타이틀, 완료 버튼(기존 약속 내용 수정 및 CoreData 업데이트)으로 구성.
            HStack {
                // Popover 닫기
                Button {
                    isPresented.toggle()
                } label: {
                    Text("취소")
                        .font(Font.Kkookk.popoverNavigationButton)
                }
                
                Spacer()
                
                // 입력받은 enum 값에 따라 popover 네비게이션 바의 제목을 바꿔주기.
                switch subject {
                case .parent:
                    Text("부모의 약속 만들기")
                        .font(Font.Kkookk.popoverNavigationTitle)
                case .child:
                    Text("아이의 약속 만들기")
                        .font(Font.Kkookk.popoverNavigationTitle)
                }
                
                Spacer()
                
                Button {
                    // name, memo 변수에 저장되어 있는 임시값으로 CoreData에 새로운 Promise를 생성, 저장.
                    updatePromise(promise: promise)
                    
                    // Popover 닫기
                    isPresented.toggle()
                } label: {
                    Text("완료")
                        .font(Font.Kkookk.popoverNavigationButton)
                }
            }
            .frame(width: popoverAssets.popoverEditingBoxWidth * 0.98)
            
            // 약속 제목과 메모를 수정하는 부분
            EditContentsOfPromiseView(name: $name, memo: $memo)
                .padding(.top, popoverAssets.popoverVerticalPadding)
            
            // 반복 날짜 선택 버튼
            EditRepeatingDaysOfPromiseView(isRepeating: $isRepeating, subject: subject)
                .padding(.top, popoverAssets.popoverVerticalPadding)
            
            Spacer()
        }
        .onAppear() {
            // 뷰를 그릴 때, 받아온 약속의 name, memo 값을 임시값에 저장
            name = promise.name ?? ""
            memo = promise.memo ?? ""
            
            // CoreData의 요일값 불러오기.
            isRepeating[0] = promise.isRepeatedOnMonday
            isRepeating[1] = promise.isRepeatedOnTuesday
            isRepeating[2] = promise.isRepeatedOnWednesday
            isRepeating[3] = promise.isRepeatedOnThursday
            isRepeating[4] = promise.isRepeatedOnFriday
            isRepeating[5] = promise.isRepeatedOnSaturday
            isRepeating[6] = promise.isRepeatedOnSunday
        }
        .frame(width: popoverAssets.popoverFullWidth,
               height: popoverAssets.popoverFullHeight)
        .padding(.top, 25)
        .background(Color.Kkookk.backgroundGray)
    }
}

extension EditPromisePopover {
    
    // name, memo 변수에 저장되어 있는 임시값을 CoreData에 업데이트.
    private func updatePromise(promise: Promise) {
        withAnimation {
            promise.name = name
            promise.memo = memo
            
            // 반복 요일 변경.
            promise.isRepeatedOnMonday = isRepeating[0]
            promise.isRepeatedOnTuesday = isRepeating[1]
            promise.isRepeatedOnWednesday = isRepeating[2]
            promise.isRepeatedOnThursday = isRepeating[3]
            promise.isRepeatedOnFriday = isRepeating[4]
            promise.isRepeatedOnSaturday = isRepeating[5]
            promise.isRepeatedOnSunday = isRepeating[6]

            // CoreData에 저장하기
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
 
