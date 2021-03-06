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
                  Button("BugReport".localized) {
                      self.isShowingMailView.toggle()
                  }
              } else {
                  Text("ReportMailViewErrorTxt".localized)
              }
              if result != nil {
                  Text("ReportMailViewClearTxt".localized)
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
 compseVC.setToRecipients(["??? ????????? ???????????? ???????????????"])
           compseVC.setSubject("???????????????")
           compseVC.setMessageBody("??????????????????", isHTML: false)
 */
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["kkookkreport@gmail.com"])
        vc.setSubject("ReportMailSubject".localized)
       // vc.setMessageBody("??????????????????", isHTML: false)
        //?????? ?????? ?????? ??????
        //????????? ?????? ?????????????????????.
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
