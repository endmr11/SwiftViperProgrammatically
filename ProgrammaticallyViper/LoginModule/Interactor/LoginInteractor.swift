//
//  LoginInteractor.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 29.07.2022.
//

import Foundation
import Alamofire

class LoginInteractor:PresenterToInteractorLoginProtocol{

    
    var loginPresenter: InteractorToPresenterLoginProtocol?
    
    func tryLoginPls(email: String) {
        let parameters:Parameters = ["email":email]
        AF.request("https://jsonplaceholder.typicode.com/users",method: .get,parameters: parameters).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode([UserModel].self, from: data)
                    self.loginPresenter?.sendDataPresenter(user: response.first)
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
