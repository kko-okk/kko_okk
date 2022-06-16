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

    // MARK: - Animation Properties
    var scaleAdjustment = 0.8
    @State private var parentShowCheckmark = 0
    @State private var childShowCheckmark = 0

    // TODO: - 부모와 자식의 Promise Gesture 싱크를 맞추기 위한 타이머입니다.
//   let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    @State var countDownTimer = 2
//    @State var timerRunning = true

    // MARK: - Gesture 프로퍼티
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false

    @GestureState var isDetachingParentCheck = false
    @GestureState var isDetachingChildCheck = false
    @State var completedParentCheck = false
    @State var completedChildCheck = false

    // MARK: - 부모가 약속 이행을 확인하는 Gesture
    var parentCheckGesture: some Gesture {
        let longPressGuesture = LongPressGesture(minimumDuration: 0.5)
            .updating($isDetachingParentCheck) { currentState, gestureState,
                    transaction in
                print("parent tapped")
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 0.3)
            }
            .onEnded { _ in
                if completedParentCheck == false {
                    // Animation
                    parentShowCheckmark = 1
                    // Promise Status
                    self.completedParentCheck = true
                    if completedChildCheck { contract.isDone = true}
                } else {
                    // Animation
                    parentShowCheckmark = 0
                    // Promise Status
                    self.completedParentCheck = false
                }
            }
        return longPressGuesture
    }

    // MARK: - 자식이 약속 이행을 확인하는 Gesture
    var childCheckGesture: some Gesture {
        let longPressGuesture = LongPressGesture(minimumDuration: 0.5)
            .updating($isDetachingChildCheck) { currentState, gestureState,
                    transaction in
                print("child tapped")
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 0.3)
            }
            .onEnded { _ in
                if completedChildCheck == false {
                    // Animation
                    childShowCheckmark = 1
                    // Promise Status
                    self.completedChildCheck = true
                    if completedParentCheck { contract.isDone = true}
                } else {
                    // Animation
                    childShowCheckmark = 0
                    // Promise Status
                    self.completedChildCheck = false
                }
                
            }
        return longPressGuesture
    }

    var promiseGesture: some Gesture {
        let longPressGuesture = LongPressGesture(minimumDuration: 0.5)
            .updating($isDetectingLongPress) { currentState, gestureState,
                    transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 0.3)
            }
            .onEnded { _ in
                contract.isDone = false
                contract.promised = true

            }
        return longPressGuesture
    }

    var body: some View {
        // Stack을 버튼으로 사용하기 위한 UI
        // Button으로 구현했을 때는 탭했을 때 Button 내부 컨텐츠가 깜빡이는 기본 효과가 있어서 Stack으로 구현함.
        // 전체적으로는 Stack을 그린 후 clipShape() 으로 잘라내서 사용하는 방식.
        ZStack {
            HStack{ // 약속 제목 및 내용과 Check버튼의 영역을 분리하기 위한 HStack
                VStack { // 약속 제목, 약속 추가 버튼?을 상단, 약속 내용을 하단에 놓는 VStack
                    HStack { // 약속 제목과 약속 추가 버튼
                        Text(contract.name ?? "")  // contract 중 .name(상단 큰 글씨 내용)을 받아옴
                            .font(.system(size: 23, weight: .black, design: .rounded))
                            .foregroundColor(  // contract.subject 와 nowSubject가 같은 경우 폰트 색을 검은 색(Kkkook.backgroundGray), 아니면 흰 색으로 변경
                                contract.subject == nowSubject ? Color.Kkookk.backgroundGray : Color.white
                            )
                            .padding([.top, .leading, .trailing], 20.0)  // padding 배열 처리
                            .padding(.bottom, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // 수정, 삭제 Popover
                        if !contract.promised {
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
                                    .padding(.top, 10)
                            }
                            .popover(isPresented: $isShowingPopover) {
                                EditPromisePopover(subject: subject, promise: contract, isPresented: $isShowingPopover)
                            }
                        }
                    }

                // contract의 memo(하단 자세한 내용)
                Text(contract.memo ?? "")
                    .font(.system(size: 17, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .bottom], 20)  // padding 배열 처리
                    .padding(.trailing, 30)
                    .padding(.top, 5)
            }
                // promised List에서 check 버튼활성화
                if contract.promised {
                    // TODO: - 중복되는 코드 묶기
                    VStack{
                        Spacer()
//                        GeometryReader { geometry in
                            ZStack{
                                Circle()
                                    .fill(self.isDetachingParentCheck ?
                                        .yellow : Color.Kkookk.commonWhite)
                                    .frame(width: 35, height: 35, alignment: .center)
                                    .gesture(parentCheckGesture)

                                Path { path in
                                    // check 각도 테스트
                                    // origin
                                    /*
                                    path.move(to: CGPoint(x: -1, y: -1))
                                    path.addCurve(
                                        to: CGPoint(x: 21, y: 26),
                                        control1: CGPoint(x: -1, y: -1),
                                        control2: CGPoint(x: 22, y: 26))
                                    path.addCurve(
                                        to: CGPoint(x: 56, y: -28),
                                        control1: CGPoint(x: 20, y: 26),
                                        control2: CGPoint(x: 56, y: -28))
                                    path.move(to: CGPoint(x: -1, y: -1))
                                    */
                                    
                                    path.move(to: CGPoint(x: 7, y: 7)) // origin (-1.-1)
                                    path.addCurve(
                                        to: CGPoint(x: 18, y: 22), // origin (21.26)
                                        control1: CGPoint(x: -1, y: -1), // origin (-1.-1)
                                        control2: CGPoint(x: 18, y: 22)) // origin (22.26)
                                    path.addCurve(
                                        to: CGPoint(x: 40, y: -10), // origin (56.-28)
                                        control1: CGPoint(x: 18, y: 22), // origin (20.26) x: 시작점
                                        control2: CGPoint(x: 40, y: -10)) // origin (56.-28) x: 꼬리 각도
                                    path.move(to: CGPoint(x: -1, y: -1)) // origin (-1.-1)
                                     
                                }
                                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(parentShowCheckmark))
                                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                .offset(x: 0, y: 0)
                                .animation(Animation.easeInOut(duration: 0.5).delay(0), value: parentShowCheckmark)
//                                .frame(width: geometry.size.width, height: geometry.size.height)
                                // TODO: - 제스처 크기 하드코딩 수정
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.Kkookk.parentPurple)

                            }.padding(.bottom, 7)
//                        }
//                        GeometryReader { geometry in
                            ZStack{
                                Circle()
                                    .fill(self.isDetachingChildCheck ?
                                        .yellow : Color.Kkookk.commonWhite)
                                    .frame(width: 35, height: 35, alignment: .center)
                                    .gesture(childCheckGesture)

                                Path { path in
                                    path.move(to: CGPoint(x: 7, y: 7)) // origin (-1.-1)
                                    path.addCurve(
                                        to: CGPoint(x: 18, y: 22), // origin (21.26)
                                        control1: CGPoint(x: -1, y: -1), // origin (-1.-1)
                                        control2: CGPoint(x: 18, y: 22)) // origin (22.26)
                                    path.addCurve(
                                        to: CGPoint(x: 40, y: -10), // origin (56.-28)
                                        control1: CGPoint(x: 18, y: 22), // origin (20.26) x: 시작점
                                        control2: CGPoint(x: 40, y: -10)) // origin (56.-28) x: 꼬리 각도
                                    path.move(to: CGPoint(x: -1, y: -1)) // origin (-1.-1)

                                }
                                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(childShowCheckmark))
                                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                .offset(x: 0, y: 0)
                                .animation(Animation.easeInOut(duration: 0.5).delay(0), value: childShowCheckmark)
//                                .frame(width: geometry.size.width, height: geometry.size.height)
                                // TODO: - 제스처 크기 하드코딩 수정
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.Kkookk.childGreen)
                                }
//                        }
                        Spacer()
                    }
                    .frame(width: 35)
                    .padding([.top, .bottom], 5)
                    .padding(.trailing, 15)
                }
            }

            // Gesture Stack
            ZStack {
                if !contract.promised {
                    Rectangle()
                        .fill(self.isDetectingLongPress ?
                              Color.yellow :
                                (self.completedLongPress ? .blue : Color.yellow.opacity(0.001)))
                        .gesture(promiseGesture)
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
        
        if nowList == "parent" {  // nowList 값이 parent와 같은 경우
            result = contract.subject == "parent" ? Color.Kkookk.parentPurple : Color.Kkookk.tabDividerGray  // contract.subject가 parent인 경우 parentPurple, 아니면 tabDividerGray
        } else {  // nowList 값이 parent가 아닌 경우
            result = contract.subject == "child" ? Color.Kkookk.childGreen : Color.Kkookk.tabDividerGray  // contract.subject가 child인 경우 childGreen, 아니면 tabDividerGray
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
