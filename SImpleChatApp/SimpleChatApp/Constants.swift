//
//  Constants.swift
//  SimpleChatApp
//
//  Created by Junmo Han on 2020/03/06.
//  Copyright © 2020 Junmo Han. All rights reserved.
//

struct K {
    static let appName = "🌷SimpleChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
//        static let lightPurple = "BrandLightPurple"
        static let pink = "BrandPink"
        static let lighPink = "BrandLightPink"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct Alert {
        static let tryAgain = "Try Again"
        static let ok = "OK"
    }
}
