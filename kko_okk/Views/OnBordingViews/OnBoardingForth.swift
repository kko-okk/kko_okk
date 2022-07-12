//
//  OnBoardingForth.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/11.
//

import SwiftUI

struct OnBoardingForth: View {
    @State private var animationAmount: CGFloat = 1
    @Binding var selectedTag: Int
    @Binding var isFirstLaunching: Bool
    
    // MARK: - Animation Properties
    var scaleAdjustment = 0.8
    @State private var parentShowCheckmark = 0
    @State private var childShowCheckmark = 0

    // TODO: - 부모와 자식의 Promise Gesture 싱크를 맞추기 위한 타이머입니다.
    // let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // @State var countDownTimer = 2
    // @State var timerRunning = true
    
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
                } else {
                    // Animation
                    childShowCheckmark = 0
                    // Promise Status
                    self.completedChildCheck = false
                }
            }
        return longPressGuesture
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("약속을 지켰는지 확인하기")
                    .font(.system(size: 30, weight: .semibold))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("약속을 지켰는지 확인합니다.")
                    .font(.system(size: 20, weight: .light))
                Text("약속을 지킨 사람이 체크하면 상대방이 확인해 주세요!")
                    .font(.system(size: 20, weight: .light))
                Text("지금 한 번 동그라미를 꼬옥 눌러 보세요!")
                    .font(.system(size: 20, weight: .light))
            }
            .padding(.bottom, 20)
            
            ZStack(alignment: .leading) {
                HStack{ // 약속 제목 및 내용과 Check버튼의 영역을 분리하기 위한 HStack
                    
                    HStack {  // 약속 제목 및 약속 추가 버튼
                        Text("우리 이 약속은 꼭 지켜요 !")  // contract 중 .name(상단 큰 글씨 내용)을 받아옴
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .padding([.leading, .trailing], 20.0)  // padding 배열 처리
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(minHeight: 100)

                    VStack {
                        Spacer()
                            ZStack{
                                Circle()
                                        .fill(self.isDetachingParentCheck ?
                                            .yellow : Color.Kkookk.commonWhite)
//                                    .fill(Color.Kkookk.commonWhite)
                                    .frame(width: 35, height: 35, alignment: .center)
                                        .gesture(parentCheckGesture)

                                Path { path in
                                    path.addLines([CGPoint(x: 2, y: 2),
                                                   CGPoint(x: 9, y: 11),
                                                   CGPoint(x: 20, y: -5)])
                                     
                                }
                                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(parentShowCheckmark))
                                .stroke(style: StrokeStyle(lineWidth: 3.5,
                                                           lineCap: .round,
                                                           lineJoin: .round))
                                .offset(x: 6, y: 15)
                                    .animation(Animation.easeInOut(duration: 0.3).delay(0), value: parentShowCheckmark)
                                .foregroundColor(Color.Kkookk.parentPurple)
                            }
                            .padding(.bottom, 7)

                            ZStack {
                                Circle()
                                        .fill(self.isDetachingChildCheck ?
                                            .yellow : Color.Kkookk.commonWhite)
//                                    .fill(Color.Kkookk.commonWhite)
                                    .frame(width: 35, height: 35, alignment: .center)
                                        .gesture(childCheckGesture)

                                Path { path in
                                    path.addLines([CGPoint(x: 2, y: 2),
                                                   CGPoint(x: 9, y: 11),
                                                   CGPoint(x: 20, y: -5)])
                                }
                                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(childShowCheckmark))
                                .stroke(style: StrokeStyle(lineWidth: 3.5,
                                                           lineCap: .round,
                                                           lineJoin: .round))
                                .offset(x: 6, y: 15)
                                    .animation(Animation.easeInOut(duration: 0.3).delay(0), value: childShowCheckmark)
                                .foregroundColor(Color.Kkookk.childGreen)
                            }
                        Spacer()
                    } // V
                    .frame(width: 35)
                    .padding([.top, .bottom], 5)
                    .padding(.trailing, 15)
                }// H
            }//Z
            .background(Color.Kkookk.parentPurple)
            .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
            .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 17)
            .padding(.top, 20)
            .padding(.bottom, 40)
            VStack {
                Text("약속하러가기")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.vertical, 10)
                    .frame(width: KkookkSize.fullWidth / 2.17, height: KkookkSize.fullHeight / 18)
                    .foregroundColor(.white)
                    .background(completedChildCheck == true && completedParentCheck == true ? .blue : Color.Kkookk.onBoardingGray)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            isFirstLaunching.toggle()
                        }
                    }
            }
            .disabled(completedChildCheck == false || completedParentCheck == false)
        }
    }
}
