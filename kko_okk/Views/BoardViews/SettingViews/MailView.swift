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

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["kkokkreport@gmail.com"])
        //비번은 추후 공유하겠습니다.
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
