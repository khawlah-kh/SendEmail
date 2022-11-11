//
//  ContentView.swift
//  SendEmail
//
//  Created by Khawlah Khalid on 08/11/2022.
//
import MessageUI
import SwiftUI

struct ContentView: View {
    @StateObject var viewmodel = ViewModel()
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false

    var body: some View {

        VStack {
            
            Button("Open Mail App") {
                viewmodel.oppenMailApp()
            }
            .padding(24)
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
