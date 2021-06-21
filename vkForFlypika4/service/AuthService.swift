//
//  AuthService.swift
//  vkForFlypika4
//
//  Created by Аида on 21.06.21.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {

    
    
    private let appID = "7884699"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?

    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appID)
        super.init()
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    func wakeUpSession() {
        let scope = ["offline"]
        
        VKSdk.wakeUpSession(scope) { state, error in
            switch state {

            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            case .authorized:
                print("authorized")

             default:
                fatalError(error!.localizedDescription)
            }
        }
    }
    
    //VKSdkDelegate
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        delegate?.authServiceSignIn()
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceDidSignInFail()

    }
    // VKSdkUIDelegate
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(controller)

    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)

    }
}
