//
//  APIManger.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/9/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import Foundation
import Alamofire

class APIManger {
    
    static func loadMedia(mediaType: String, keyWord: String, completion: @escaping (_ error: Error?, _ media: [Media]?) -> Void) {
        let params = [Parmameters.media: mediaType,
                      Parmameters.term: keyWord]
        Alamofire.request(Urls.baseUrl, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: nil).response { (response) in
            guard  response.error == nil else {
                print(response.error!)
                completion(response.error, nil)
                return
            }
            guard let data = response.data else {
                
                print("didn't get any data from API")
                return
            }
            do {
                let mediaArr = try JSONDecoder().decode(MediaResult.self, from: data).results
                completion(nil, mediaArr)
             
            } catch let error {
                print(error)
                
            }
        }
        
    }
}
