//
//  DatePickerView.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/05.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var date: Date
    
    let imageSize : CGFloat = 20
    var body: some View {
        
        ZStack{
            DatePicker("", selection: $date, displayedComponents: .date)
                .labelsHidden()                             //1
                .datePickerStyle(.compact)                  //2
                .frame(width: imageSize, height: imageSize) //3
                .clipped()                                  //4
            //1 label을 숨겨주는 코드
            //  https://developer.apple.com/documentation/swiftui/form/labelshidden()
            //2 데이트피커의 스타일을 정해주는코드
            //3 데이트피커의 프레임을 정하는코드
            //4 정해진 프레임으로 잘라버리는코드
            //  https://developer.apple.com/documentation/swiftui/path/clipped(antialiased:)
 
            SwiftUIWrapper {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: imageSize, height: imageSize, alignment: .topLeading)
            }.allowsHitTesting(false)
            
        }//ZStack
        
    }
    
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(date: .constant(Date()))
    }
}


/*
 SwiftUIWrapper가 정확히 어떻게 동작 하는지 설명할 수 없지만
 대충 기존의 무언가를 가려주고 그 위에 원하는 이미지를 얹어주는것 같습니다.
 */
struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
    let content: () -> T
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: content())
    }
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
}


/*
 해당 코드의 출처는 다음과 같습니다.
 SwiftUIWrapper
 https://stackoverflow.com/questions/65797437/how-to-make-a-button-or-any-other-element-show-swiftuis-datepicker-popup-on-t
 */
