//
//  ViewController.swift
//  HelloAPI0411
//
//  Created by 申潤五 on 2020/4/11.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var can: UIView!
    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var timer:Timer!
    
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        can.backgroundColor = UIColor.clear
        can.clipsToBounds = false
        can.layer.shadowRadius = 20         //陰影
        can.layer.shadowOpacity = 0.6;
        can.layer.shadowColor = UIColor.gray.cgColor
        can.layer.shadowOffset = CGSize(width: 10, height: 10)

        
        header.clipsToBounds = true
        header.layer.cornerRadius = header.frame.width / 2
        header.layer.borderColor = UIColor.red.cgColor
        header.layer.borderWidth = 2
        
        update(self)
        
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(updateS(sender:)), userInfo: nil, repeats: true)
        
    }

    @objc func updateS(sender:Any?){
        update(self)
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
                
                self.header.kf.setImage(with: URL(string: urlString))
                
            }
            
            
        }
    }
    
}

