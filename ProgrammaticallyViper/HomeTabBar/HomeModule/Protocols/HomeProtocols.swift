//
//  HomeProtocols.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation

protocol ViewToPresenterHomeProtocol{
    var homeInteractor:PresenterToInteractorHomeProtocol?{get set}
    var homeView:PresenterToViewHomeProtocol?{get set}
    func getAllPhotos()
}

protocol PresenterToInteractorHomeProtocol{
    var homePresenter:InteractorToPresenterHomeProtocol?{get set}
    func getPhotos()
}


protocol InteractorToPresenterHomeProtocol{
    func sendDataPresenter(photos:Array<PhotoModel>?)
}

protocol PresenterToViewHomeProtocol{
    func sendDataView(photos:Array<PhotoModel>?)
}

protocol PresenterToRouterHomeProtocol{
    static func createModule(ref:HomeViewController)
}

