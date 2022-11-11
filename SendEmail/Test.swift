//
//  Test.swift
//  SendEmail
//
//  Created by Khawlah Khalid on 08/11/2022.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject{
     func oppenMailApp(){
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
        }
    }
}
