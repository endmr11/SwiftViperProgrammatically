//
//  LoginPresenter.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 29.07.2022.
//

import Foundation

class LoginPresenter: ViewToPresenterLoginProtocol{

    
    var loginInteractor: PresenterToInteractorLoginProtocol?
    
    var loginView: PresenterToViewLoginProtocol?
    
    func tryLogin(email: String) {
        loginInteractor?.tryLoginPls(email: email)
    }
}



//VIEWA VERI TASIR
extension LoginPresenter:InteractorToPresenterLoginProtocol{
    func sendDataPresenter(user: UserModel?) {
        loginView?.sendDataView(user: user)
    }
    
}
