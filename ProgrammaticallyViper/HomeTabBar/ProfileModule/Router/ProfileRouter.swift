//
//  ProfileRouter.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation

class ProfileRouter:PresenterToRouterProfileProtocol{
    static func createModule(ref: ProfileViewController) {
        let presenter = ProfilePresenter()
        ref.profilePresenterNesnesi = presenter
        
        ref.profilePresenterNesnesi?.profileInteractor = ProfileInteractor()
        ref.profilePresenterNesnesi?.profileView = ref
        
        ref.profilePresenterNesnesi?.profileInteractor?.profilePresenter = presenter
    }
    
    
}
