//
//  TodoModel.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation


class TodoModel: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let completed: Bool?
    
    init(userId:Int?,id:Int?,title:String?,completed: Bool?) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
    
    func toJson() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
