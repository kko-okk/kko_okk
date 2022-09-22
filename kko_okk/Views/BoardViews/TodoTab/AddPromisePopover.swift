//
//  AddPromisePopover.swift
//  kko_okk
//
//  Created by Seodam on 2022/06/03.
//

import SwiftUI


struct AddPromisePopover: View {
    // Subject enum이 .parent인지 .child인지에 따라 뷰의 포인트 컬러와 subject attribute 기능이 달라짐.
    var subject: Subject

    // viewContext 받아오기
    @Environment(\.managedObjectContext) private var viewContext

    // popover 띄우고 닫을 변수
    @Binding var isPresented: Bool

    // 완료 버튼을 누르기 전까지 임시 값을 저장하는 변수
    @State var name: String = ""
    @State var memo: String = ""

    // 반복 요일
    @State var isRepeating: [Bool] = [false, false, false, false, false, false, false]

    @EnvironmentObject var pickedDate: PickedDate

    let popoverAssets = PopoverAssets()

    var body: some View {
        VStack {
            // 팝오버 네비게이션 바
            // 취소, 타이틀, 완료 버튼(약속 생성 및 CoreData 업데이트)으로 구성.
            HStack {
                // Popover 닫기
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Cancel".localized)
                        .font(Font.Kkookk.popoverNavigationButton)
                }

                Spacer()

                // 입력받은 enum 값에 따라 popover 네비게이션 바의 제목을 바꿔주기.
                switch subject {
                case .parent:
                    Text("PromisePopoverParents".localized)
                        .font(Font.Kkookk.popoverNavigationTitle)
                case .child:
                    Text("PromisePopoverChildren".localized)
                        .font(Font.Kkookk.popoverNavigationTitle)
                }

                Spacer()

                Button {
                    // name, memo 변수에 저장되어 있는 임시값으로 CoreData에 새로운 Promise를 생성, 저장.
                    addWish()

                    // Popover 닫기
                    isPresented.toggle()
                } label: {
                    Text("Done".localized)
                        .font(Font.Kkookk.popoverNavigationButton)
                }
                .disabled(name.isEmpty ? true : false)
            }
            .frame(width: popoverAssets.popoverEditingBoxWidth * 0.98)

            // 약속 제목과 메모를 수정하는 부분
            EditContentsOfPromiseView(name: $name, memo: $memo)
                .padding(.top, popoverAssets.popoverVerticalPadding)

            //TODO: 동작이 구현되지 않아 주석 처리함 반복 날짜 선택 버튼
//            EditRepeatingDaysOfPromiseView(isRepeating: $isRepeating, subject: subject)
//                .padding(.top, popoverAssets.popoverVerticalPadding)
            Spacer()
        }
        .frame(width: popoverAssets.popoverFullWidth,
               height: popoverAssets.popoverFullHeight)
        .padding(.top, 25)
        .background(Color.Kkookk.backgroundGray)
    }
}

extension AddPromisePopover {
    // name, memo 변수에 저장되어 있는 임시값으로 CoreData에 새로운 Promise를 생성, 저장.
    private func addWish() {
        withAnimation {
            let promise = Promise(context: viewContext)

            promise.id = UUID()
            promise.name = name
            promise.memo = memo
            promise.madeTime = pickedDate.date
            promise.promised = false
            promise.parentCheck = false
            promise.childCheck = false
            promise.isDone = false
            promise.isRepeat = false
            promise.repeatType = ""

            // AddPromisePopover가 입력받은 subject enum 값에 따라 promise.subject 값을 다르게 설정.
            switch subject {
            case .parent:
                promise.subject = "parent"
            case .child:
                promise.subject = "child"
            }

            // 반복 요일 입력. 초기값은 전부 false.
            promise.isRepeatedOnMonday = isRepeating[0]
            promise.isRepeatedOnTuesday = isRepeating[1]
            promise.isRepeatedOnWednesday = isRepeating[2]
            promise.isRepeatedOnThursday = isRepeating[3]
            promise.isRepeatedOnFriday = isRepeating[4]
            promise.isRepeatedOnSaturday = isRepeating[5]
            promise.isRepeatedOnSunday = isRepeating[6]

            // 데이터 저장
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
