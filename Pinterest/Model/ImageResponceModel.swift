//
//  ImageResponceModel.swift
//  Pinterest
//
//  Created by Arman Myrzakanurov on 05.06.2022.
//

import Foundation

struct ImageResponceModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "download_url"
        case id
    }
    
    let imageUrl: String
    let id: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.id = try container.decode(String.self, forKey: .id)
    }
}
