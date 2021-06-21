//
//  ViewController.swift
//  vkForFlypika4
//
//  Created by Аида on 21.06.21.
//

import UIKit



class AuthViewController: UIViewController {

    private var authService : AuthService!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = AppDelegate.shared().authService
    }

    @IBAction func signInButtonAction(_ sender: Any) {
        authService.wakeUpSession()
        
    }
    
}

