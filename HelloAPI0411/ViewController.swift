//
//  ViewController.swift
//  HelloAPI0411
//
//  Created by 申潤五 on 2020/4/11.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var can: UIView!
    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func update(_ sender: Any) {
        let model = APIModel.share

        model.queryRandomUserAlamofire { (res, error) in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            if let data = res as? Data{
                let json = JSON(data)
                print(json)
                self.email.text = json["results"][0]["email"].stringValue
                self.name.text = json["results"][0]["name"]["title"].stringValue
                + "."
                + json["results"][0]["name"]["first"].stringValue
                + " "
                + json["results"][0]["name"]["last"].stringValue
                
                let urlString = json["results"][0]["picture"]["medium"].stringValue
                
                do {
                    let url = URL(string: urlString)
                    let imageData = try Data(contentsOf: url!)
                    self.header.image = UIImage(data: imageData)
                } catch  {
                    print(error)
                }
                
                
               
            }
            
            
        }
    }
    
}

