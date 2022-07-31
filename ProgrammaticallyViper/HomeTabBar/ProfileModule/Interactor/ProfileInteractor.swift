//
//  ProfileInteractor.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation
import Alamofire

class ProfileInteractor:PresenterToInteractorProfileProtocol{
    var profilePresenter: InteractorToPresenterProfileProtocol?
    
    func getTodos() {
        AF.request("https://jsonplaceholder.typicode.com/todos",method: .get).response { response in
            if let data = response.data{
                do {
                    let response = try JSONDecoder().decode([TodoModel].self, from: data)
                    self.profilePresenter?.sendDataPresenter(todos:response)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
