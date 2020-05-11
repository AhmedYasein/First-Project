//
//  DataOFUser.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/6/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import Foundation
import UIKit

class DataOfUser: NSObject, NSCoding {
    var name: String!
    var email: String!
    var password: String!
    var confirmPassword: String!
    var phoneNumber: String!
    var image: UIImage!
    
    init(name: String, email: String, password: String, confirmPassword: String, phoneNumber: String, image: UIImage){
        
        self.name = name
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.phoneNumber = phoneNumber
        self.image = image
    }
    
    init(name: String, password: String, confirmPassword: String, phoneNumber: String, image: UIImage) {
        
        self.name = name
        self.password = password
        self.confirmPassword = confirmPassword
        self.phoneNumber = phoneNumber
        self.image = image
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: Keys.nameKey)
        aCoder.encode(self.email, forKey: Keys.emailKey)
        aCoder.encode(self.password, forKey: Keys.passwordKey)
        aCoder.encode(self.confirmPassword, forKey: Keys.confirmPassordKey)
        aCoder.encode(self.phoneNumber, forKey: Keys.phoneNumber)
        aCoder.encode(self.image, forKey: Keys.imageKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: Keys.nameKey) as! String
        let email = aDecoder.decodeObject(forKey: Keys.emailKey) as! String
        let password = aDecoder.decodeObject(forKey: Keys.passwordKey) as! String
        let confirmPassword = aDecoder.decodeObject(forKey: Keys.confirmPassordKey) as! String
        let phoneNumber = aDecoder.decodeObject(forKey: Keys.phoneNumber) as! String
        let image = aDecoder.decodeObject(forKey: Keys.imageKey) as! UIImage
        
        self.init(name: name, email: email, password: password, confirmPassword: confirmPassword, phoneNumber: phoneNumber, image: image)
   }
    
    
}
