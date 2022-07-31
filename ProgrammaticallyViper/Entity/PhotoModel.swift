//
//  PhotoModel.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import Foundation


class PhotoModel:Codable{
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
    
    init(albumId: Int?,id:Int?,title:String?,url: String?,thumbnailUrl: String?) {
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
    
    func toJson() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
