//
//  PinterestManager.swift
//  Pinterest
//
//  Created by Arman Myrzakanurov on 05.06.2022.
//

import Foundation
import Alamofire

protocol PinterestManagerDelegate: AnyObject {
    func onImageModelsDidUpdate(with models: [ImageResponceModel])
}

struct PinterestManager {
    
    weak var delegate: PinterestManagerDelegate?
    
    func fetchImages() {
        let urlString = "https://picsum.photos/v2/list?limit=15"
        
        AF.request(urlString).responseDecodable(of: [ImageResponceModel].self) { response in
            switch response.result {
            case .success(let models):
                delegate?.onImageModelsDidUpdate(with: models)
            case .failure(let error):
                print(error)
            }
        }
    }
}
