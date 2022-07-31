//
//  HomePresenter.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation

class HomePresenter:ViewToPresenterHomeProtocol{
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func getAllPhotos() {
        homeInteractor?.getPhotos()
    }
    
    
}
extension HomePresenter:InteractorToPresenterHomeProtocol{
    func sendDataPresenter(photos: Array<PhotoModel>?) {
        homeView?.sendDataView(photos: photos)
    }
}
