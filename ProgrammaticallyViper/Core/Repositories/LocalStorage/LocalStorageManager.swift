//
//  LocalStorageManager.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation

 class ILocalStorageManager{
     func saveUser(user:UserModel){}
     func getUser() -> UserModel?{return nil}
     func clear(){}
}

final class LocaleStorageManager:ILocalStorageManager{
    var localStorage:UserDefaults?
    let userKey = "USER_KEY"
    override init() {
        localStorage  = UserDefaults.standard
    }
    
    override func saveUser(user: UserModel) {
        let jsonData = try? user.toJson()
        guard let jsonData = jsonData else { return }
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            return
        }
        print(jsonString)
        localStorage?.set(jsonString, forKey: userKey)
    }
    override func getUser() -> UserModel? {
        let user = localStorage?.string(forKey: userKey)
        if let user = user {
            do {
                let response = try JSONDecoder().decode(UserModel.self, from: user.data(using: .utf8)!)
                return response
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    override func clear() {
        localStorage?.removeObject(forKey: userKey)
        print(localStorage?.string(forKey: userKey) as Any)
        print("Clear")
    }
}
