//
//  ProfilePresenter.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation

class ProfilePresenter:ViewToPresenterProfileProtocol{
    var profileInteractor: PresenterToInteractorProfileProtocol?
    
    var profileView: PresenterToViewProfileProtocol?
    
    func getAllTodos() {
        profileInteractor?.getTodos()
    }
}

extension ProfilePresenter:InteractorToPresenterProfileProtocol{
    func sendDataPresenter(todos: Array<TodoModel>?) {
        profileView?.sendDataView(todos: todos)
    }
}
