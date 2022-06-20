//
//  ButtonForContract.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/30.
//

import Foundation
import SwiftUI

struct ButtonForContract: View {
    // CoreData 사용을 위해 viewContext 받아오기
    @Environment(\.managedObjectContext) private var viewContext

    // 약속, Subject(아이 또는 부모) 받아오기
    @ObservedObject var contract: Promise

    // Popover 띄우고 닫을 용도
    @State private var isShowingPopover: Bool = false
    
    @State private var showingAlert = false

    var nowSubject: String
    var subject: Subject {
        switch nowSubject {
        case "parent":
            return .parent
        case "child":
            return .child
        default:
            return .parent
        }
    }

    // TODO: - 부모와 자식의 Promise Gesture 싱크를 맞추기 위한 타이머 (PromisePair 유효 시간)
     let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    // MARK: - isDone Gesture Properties
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    @GestureState var isDetachingParentCheck = false
    @GestureState var isDetachingChildCheck = false

    // MARK: - isDone으로 바꾸기 전, 부모가 약속 이행을 확인하는 Gesture
    var parentCheckGesture: some Gesture {
        let longPressGuesture = LongPressGesture(minimumDuration: 0.5)
            .updating($isDetachingParentCheck) { currentState, gestureState,
                    transaction in
                print("parent tapped")
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 0.3)
            }
            .onEnded { _ in
                if !contract.parentCheck {
                    // Check 상태
                    contract.parentCheck = true
                    // isDone 상태
                    if contract.childCheck { contract.isDone = true }
                } else {
                    // Check 상태
                    contract.parentCheck = false
                    // isDone 상태
                    contract.isDone = false
                }
                
                // CoreData 업데이트
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        return longPressGuesture
    }

    // MARK: - isDone으로 바꾸기 전, 자식이 약속 이행을 확인하는 Gesture
    var childCheckGesture: some Gesture {
        let longPressGuesture = LongPressGesture(minimumDuration: 0.5)
            .updating($isDetachingChildCheck) { currentState, gestureState,
                    transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 0.3)
            }
            .onEnded { _ in
                if !contract.childCheck {
                    // Check 상태
                    contract.childCheck = true
                    // isDone 상태
                    if contract.parentCheck { contract.isDone = true }
                } else {
                    // Check 상태
                    contract.childCheck = false
                    // isDone 상태
                    contract.isDone = false
                }
                
                // CoreData 업데이트
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        return longPressGuesture
    }

    // MARK: - promised 상태로 전환하기 위한 부모, 자식 공통 Gesture
    var commonPromiseGesture: some Gesture {
        let longPressGuesture = LongPressGesture(minimumDuration: 0.5)
                // Updating: 애니메이션 적용 -> 근데 onGesture때문에 이 부분 실행 안됨
                .updating($isDetectingLongPress) { currentState, gestureState,
                                                   transaction in
                    gestureState = currentState
                    transaction.animation = Animation.easeIn(duration: 0.3)
                }
                // Ended: 여기서 매칭 확인
                .onEnded { _ in

                    // id와 subject 확인
                    guard let id = contract.id else {
                        print("id 없음")
                        return
                    }
                    promisePair.appendIDPair(id)
                    promisePair.appendSubject(nowSubject)

                    print(promisePair.promiseIDPair)
                    print(promisePair.promiseSubjectPair)

                    // 2개일 때 비교, 상태 변화, 리셋
                    if promisePair.promiseIDPair.count == 2 {
                        if promisePair.getId(0) == promisePair.getId(1) && promisePair.getSubject(0) != promisePair.getSubject(1) {
                            print(promisePair.getId(0) == promisePair.getId(1))
                            contract.promised = true

//                            CoreData 업데이트
                            do {
                                try viewContext.save()
                            } catch {
                                let nsError = error as NSError
                                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                            }
                            
                        } else {
                                self.showingAlert.toggle()
                        }
                        // reset
                        promisePair.resetIDPair()
                        promisePair.resetSubjectPair()
                    }
                }
        return longPressGuesture
    }

    // MARK: - Cell(Button 기능) UI
    var body: some View {
        // Stack을 버튼으로 사용하기 위한 UI
        // Button으로 구현했을 때는 탭했을 때 Button 내부 컨텐츠가 깜빡이는 기본 효과가 있어서 Stack으로 구현함.
        // 전체적으로는 Stack을 그린 후 clipShape() 으로 잘라내서 사용하는 방식.
        ZStack {
            HStack{ // 약속 제목 및 내용과 Check버튼의 영역을 분리하기 위한 HStack
                if let memo = contract.memo {
                    if memo.isEmpty { // CoreData의 memo 항목이 비어있을 경우: 수정 버튼(ellipsis) 위치 조절 때문에 새로 그림
                        HStack {  // 약속 제목 및 약속 추가 버튼
                            Text(contract.name ?? "")  // contract 중 .name(상단 큰 글씨 내용)을 받아옴
                                .font(.system(size: 23, weight: .black, design: .rounded))
                                .foregroundColor(  // contract.subject == nowSubject -> 폰트 색: Kkkook.backgroundGray, 아니면 흰 색
                                    contract.subject == nowSubject ? Color.Kkookk.backgroundGray : Color.white
                                )
                                .lineLimit(1)
                                .padding([.leading, .trailing], 20.0)  // padding 배열 처리
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(minHeight: 100)
                    } else {  // CoreData의 memo 항목이 존재하는 경우
                        VStack {  // 약속 제목 및 약속 추가 버튼을 상단에, 약속 내용을 하단에 배치하는 VStack
                            HStack {
                                Text(contract.name ?? "")
                                    .font(.system(size: 23, weight: .black, design: .rounded))
                                    .foregroundColor(
                                        contract.subject == nowSubject ? Color.Kkookk.backgroundGray : Color.white
                                    )
                                    .lineLimit(1)
                                    .padding([.top, .leading, .trailing], 20.0)  // padding 배열 처리
                                    .padding(.bottom, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }

                            // contract의 memo(하단 자세한 내용)
                            // CoreData의 memo 항목에 값이 있을 때만 표시한다.
                            // Thanks, Guell!
                            if let memo = contract.memo {
                                if !memo.isEmpty {
                                    Text(contract.memo ?? "")
                                        .font(.system(size: 17, weight: .regular, design: .rounded))
                                        .foregroundColor(.white)
                                        .lineLimit(3)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.leading, .bottom], 20)  // padding 배열 처리
                                        .padding(.trailing, 30)
                                        .padding(.top, 5)
                                }
                            }
                        }
                        .frame(minHeight: 100)
                    }
                }

                // promised List에서 check 버튼활성화
                if contract.promised {
                    VStack{
                        Spacer()
                            ZStack{
                                Circle()
                                    .fill(self.isDetachingParentCheck ?
                                        .yellow : Color.Kkookk.commonWhite)
                                    .frame(width: 35, height: 35, alignment: .center)
                                    .gesture(parentCheckGesture)

                                // 부모 check
                                Path { path in
                                    path.addLines([CGPoint(x: 2, y: 2),
                                                   CGPoint(x: 9, y: 11),
                                                   CGPoint(x: 20, y: -5)])
                                     
                                }
                                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(contract.parentCheck ? 1 : 0))
                                .stroke(style: StrokeStyle(lineWidth: 3.5,
                                                           lineCap: .round,
                                                           lineJoin: .round))
                                .offset(x: 6, y: 15)
                                .animation(Animation.easeInOut(duration: 0.3).delay(0), value: contract.parentCheck ? 1 : 0)
                                .foregroundColor(Color.Kkookk.parentPurple)

                            }.padding(.bottom, 7)

                            ZStack{
                                Circle()
                                    .fill(self.isDetachingChildCheck ?
                                        .yellow : Color.Kkookk.commonWhite)
                                    .frame(width: 35, height: 35, alignment: .center)
                                    .gesture(childCheckGesture)

                                // 자식 check
                                Path { path in
                                    path.addLines([CGPoint(x: 2, y: 2),
                                                   CGPoint(x: 9, y: 11),
                                                   CGPoint(x: 20, y: -5)])
                                }
                                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(contract.childCheck ? 1 : 0))
                                .stroke(style: StrokeStyle(lineWidth: 3.5,
                                                           lineCap: .round,
                                                           lineJoin: .round))
                                .offset(x: 6, y: 15)
                                .animation(Animation.easeInOut(duration: 0.3).delay(0), value: contract.childCheck ? 1 : 0)
                                .foregroundColor(Color.Kkookk.childGreen)
                            }
                        Spacer()
                    }
                    .frame(width: 35,height: 75)
                    .padding(.trailing, 15)
                }
            }

            // MARK: - Gesture Stack
            ZStack {
                if !contract.promised {
                    Rectangle()
                        .fill(self.isDetectingLongPress ?
                              Color.yellow :
                                (self.completedLongPress ? .blue : Color.yellow.opacity(0.001)))
                        // 스크롤뷰 제스처와 셀 제스쳐의 겹치는 현상 막기 위한 제스처 추가
                        // TODO : - onTapGesture 추가시 longpressgesture의 updating이 안되는 문제 해결
//                        .onTapGesture{
//                            print("scrollview touched")
//                        }
                        .gesture(commonPromiseGesture)
                        .onReceive(timer) { _ in
                            promisePair.resetIDPair()
                            promisePair.resetSubjectPair()
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("앗, 다른 약속이에요!"),
                                message: Text("같은 약속끼리 꼬옥 눌러주세요 :)"),
                                dismissButton: .default(Text("확인")))
                        }
                }
                // MARK: - 수정, 삭제 Popover
                HStack{
                    Spacer()
                    if !contract.promised {
                        VStack {
                            Menu {
                                Button {
                                    isShowingPopover.toggle()
                                } label: {
                                    Label("수정하기", systemImage: "pencil")
                                }
                                
                                Button(role: .destructive) {
                                    deletePromise(promise: contract)
                                } label: {
                                    Label("삭제하기", systemImage: "trash")
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                                    .rotationEffect(.degrees(90))
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 40)
                                    .padding(.top, 8)
                            }
                            .popover(isPresented: $isShowingPopover) {
                                EditPromisePopover(
                                    subject: subject, promise: contract, isPresented: $isShowingPopover
                                )
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .background(backGroundColor(for: self.contract, now: self.nowSubject))
        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
        .padding([.leading, .trailing], 14)
    }

    // 버튼 색을 반환하는 함수
    private func backGroundColor(for contract: Promise, now nowList: String) -> Color {
        // parameter: contract: Promise(Promise 인스턴스), nowList: String (String 타입, 현재 뷰에서 그리는 리스트)
        // contract: Promise 앞의 for, nowList: String 앞의 now는 각각을 for, now로 사용할 수 있도록 하는 신택스 컴포넌트
        var result: Color  // result 변수는 Color 값이 들어감
        
        if contract.promised == true {
            result = contract.subject == "parent" ? Color.Kkookk.parentPurple : Color.Kkookk.childGreen
            return result
        }
        else  {
            if nowList == "parent" {  // nowList 값이 parent와 같은 경우
                result = contract.subject == "parent" ? Color.Kkookk.parentPurple : Color.Kkookk.tabDividerGray  // contract.subject가 parent인 경우 parentPurple, 아니면 tabDividerGray
            } else {  // nowList 값이 parent가 아닌 경우
                result = contract.subject == "child" ? Color.Kkookk.childGreen : Color.Kkookk.tabDividerGray  // contract.subject가 child인 경우 childGreen, 아니면 tabDividerGray
            }
        }
        return result
    }

    private func deletePromise(promise: Promise) {
        withAnimation {
            viewContext.delete(promise)
        }
        // 데이터 저장
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
