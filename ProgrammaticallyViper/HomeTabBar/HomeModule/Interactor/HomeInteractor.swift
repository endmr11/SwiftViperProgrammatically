//
//  HomeInteractor.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation
import Alamofire

class HomeInteractor:PresenterToInteractorHomeProtocol{
    
    var homePresenter: InteractorToPresenterHomeProtocol?
    func getPhotos() {
        AF.request("https://jsonplaceholder.typicode.com/photos",method: .get).response { response in
            if let data = response.data{
                do {
                    let response = try JSONDecoder().decode([PhotoModel].self, from: data)
                    self.homePresenter?.sendDataPresenter(photos:response)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
   
    
}
