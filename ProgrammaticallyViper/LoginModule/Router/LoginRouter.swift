//
//  LoginRouter.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 29.07.2022.
//

import Foundation

class LoginRouter:PresenterToRouterLoginProtocol{
    static func createModule(ref: LoginViewController) {
        let presenter = LoginPresenter()
        ref.loginPresenterNesnesi = presenter
        
        ref.loginPresenterNesnesi?.loginInteractor = LoginInteractor()
        ref.loginPresenterNesnesi?.loginView = ref
        
        ref.loginPresenterNesnesi?.loginInteractor?.loginPresenter = presenter
    }
    
    
}
