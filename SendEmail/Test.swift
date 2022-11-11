//
//  Test.swift
//  SendEmail
//
//  Created by Khawlah Khalid on 08/11/2022.
//

import Foundation
import MessageUI


struct Script{
    static func sendEmail(){
        let address = "yourAddress@test.com"
        let subject = "Send Email App"

        // Example email body with useful info for bug reports
        let body = "Default body"

        // Build the URL from its components
        var components = URLComponents()
        components.scheme = "mailto"
        components.path = address
        components.queryItems = [
              URLQueryItem(name: "subject", value: subject),
              URLQueryItem(name: "body", value: body)
        ]

        guard let url = components.url else {
            NSLog("Failed to create mailto URL")
            fatalError("Failed to create mailto URL")
        }
        UIApplication.shared.open(url) { success in
          // handle success or failure
            switch success {
            case true:
                print("It is working 😍")
            case false:
                print("It is not working 😔")
            }
        }
    }
}

//class SendEmail: NSObject {
//    static func send() {
//        let service = NSSharingService(named: NSSharingService.Name.composeEmail)!
//        service.recipients = ["email@yourEmail.eu"]
//        service.subject = "Email Subject"
//
//        service.perform(withItems: ["Email Content"])
//    }
//}


class SendEmail: NSObject , MFMailComposeViewControllerDelegate{
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["khawlah1920@hotmail.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
//            mail.send
            
           // present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
}
