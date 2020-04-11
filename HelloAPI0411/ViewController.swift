//
//  ViewController.swift
//  HelloAPI0411
//
//  Created by 申潤五 on 2020/4/11.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let model = APIModel.share

        model.queryRandomUserAlamofire { (res, error) in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            print(res as? Data)
            
            
        }
    }


}

