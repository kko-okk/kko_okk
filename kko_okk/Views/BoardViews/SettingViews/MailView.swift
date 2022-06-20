//
//  BugMailView.swift
//  kko_okk
//
//  Created by Ruyha on 2022/06/20.
//

import SwiftUI
import UIKit
import MessageUI

struct ppapMailView: View {

    @State var result: Result<MFMailComposeResult, Error>? = nil
      @State var isShowingMailView = false

      var body: some View {

          VStack {
              if MFMailComposeViewController.canSendMail() {
                  Button("Show mail view") {
                      self.isShowingMailView.toggle()
                  }
              } else {
                  Text("Can't send emails from this device")
              }
              if result != nil {
                  Text("Result: \(String(describing: result))")
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
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
