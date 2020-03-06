//
//  WelcomeViewController.swift
//  SimpleChatApp
//
//  Created by Junmo Han on 2020/03/04.
//  Copyright © 2020 Junmo Han. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = K.appName
    }
}
