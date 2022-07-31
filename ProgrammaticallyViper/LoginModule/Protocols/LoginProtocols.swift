//
//  LoginProtocols.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 29.07.2022.
//

import Foundation


//VIEWDAN PRESENTERA ULASIR
protocol ViewToPresenterLoginProtocol{
    var loginInteractor:PresenterToInteractorLoginProtocol?{get set}
    var loginView:PresenterToViewLoginProtocol?{get set}
    func tryLogin(email:String)
}
//PRESENTERDAN INTERACTORA ULASIR
protocol PresenterToInteractorLoginProtocol{
    var loginPresenter:InteractorToPresenterLoginProtocol?{get set}
    func tryLoginPls(email:String)
}


//INTERACTORDAN PRESENTERA TASIR
protocol InteractorToPresenterLoginProtocol{
    func sendDataPresenter(user:UserModel?)
}

//PRESENTERDAN VIEWA TASIR
protocol PresenterToViewLoginProtocol{
    func sendDataView(user:UserModel?)
}


//ROUTER
protocol PresenterToRouterLoginProtocol{
    static func createModule(ref:LoginViewController)
}
