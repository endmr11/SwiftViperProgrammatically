//
//  ProfileProtocols.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation

protocol ViewToPresenterProfileProtocol{
    var profileInteractor:PresenterToInteractorProfileProtocol?{get set}
    var profileView:PresenterToViewProfileProtocol?{get set}
    func getAllTodos()
}

protocol PresenterToInteractorProfileProtocol{
    var profilePresenter:InteractorToPresenterProfileProtocol?{get set}
    func getTodos()
}


protocol InteractorToPresenterProfileProtocol{
    func sendDataPresenter(todos:Array<TodoModel>?)
}
protocol PresenterToViewProfileProtocol{
    func sendDataView(todos:Array<TodoModel>?)
}


protocol PresenterToRouterProfileProtocol{
    static func createModule(ref:ProfileViewController)
}
