//
//  BugMailView.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/20.
//

import SwiftUI
import UIKit
import MessageUI

struct ReportMailView: View {

    @State var result: Result<MFMailComposeResult, Error>? = nil
      @State var isShowingMailView = false

      var body: some View {

          VStack {
              if MFMailComposeViewController.canSendMail() {
                  Button("버그신고") {
                      self.isShowingMailView.toggle()
                  }
              } else {
                  Text("이 기기에서는 메일 발송이 불가능합니다.")
              }
              if result != nil {
                  Text("메일 발송 성공")
                      .lineLimit(nil)
              }
          }
          .sheet(isPresented: $isShowingMailView) {
              MailView(isShowing: self.$isShowingMailView, result: self.$result)
          }

      }
    
}

struct MailView: UIViewControllerRepresentable {

    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(isShowing: Binding<Bool>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing,
                           result: $result)
    }
/*
 compseVC.setToRecipients(["본 메일을 전달받을 이메일주소"])
           compseVC.setSubject("메시지제목")
           compseVC.setMessageBody("메시지컨텐츠", isHTML: false)
 */
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["kkokkreport@gmail.com"])
        vc.setSubject("꼬-옥 앱 버그 신고")
       // vc.setMessageBody("메시지컨텐츠", isHTML: false)
        //이건 아직 확인 못함
        //비번은 추후 공유하겠습니다.
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
