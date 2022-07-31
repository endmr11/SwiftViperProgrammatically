//
//  HomeRouter.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation

class HomeRouter:PresenterToRouterHomeProtocol{
    static func createModule(ref: HomeViewController) {
        let presenter = HomePresenter()
        ref.homePresenterNesnesi = presenter
        
        ref.homePresenterNesnesi?.homeInteractor = HomeInteractor()
        ref.homePresenterNesnesi?.homeView = ref
        
        ref.homePresenterNesnesi?.homeInteractor?.homePresenter = presenter
    }
    
    
}
