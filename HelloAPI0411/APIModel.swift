//
//  APIModel.swift
//  HelloAPI0411
//
//  Created by 申潤五 on 2020/4/11.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import Alamofire

class APIModel {
    static var share = APIModel()
    private var apiURL = "https://randomuser.me/api/"
    private init(){}
    func queryRandomUserAlamofire(completion:@escaping (_ Data:Any?,_ respError: Error?)->())->(){
        let url = apiURL
        let parameters:Parameters? = nil
        DispatchQueue.global().async {
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: nil).responseJSON(completionHandler: { (response) in
                        DispatchQueue.main.async(execute: {
                            switch response.result{
                            case .success(_):
                                return completion(response.data,nil)
                            case .failure(let error):
                                return completion(nil,error)
                            }
                        })
                       })
            
        }
    }
}
