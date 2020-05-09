//
//  ProfileVC.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/7/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var imageOfProfile: UIImageView!
    @IBOutlet weak var nameOfProfile: UILabel!
    @IBOutlet weak var emailOfProfile: UILabel!
    @IBOutlet weak var phoneNumberOfProfile: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
  UserDefaults.standard.set(true, forKey: Keys.isLogedIn)
        UserDefaults.standard.set(true, forKey: "isLogedIn")
        let user = UserDefaults.standard.object(forKey: "userLogData") as! Data
        let decodedUserData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(user) as! DataOfUser
        
        imageOfProfile.image = decodedUserData.image
        nameOfProfile.text = decodedUserData.name
        emailOfProfile.text = decodedUserData.email
        phoneNumberOfProfile.text = decodedUserData.phoneNumber
        
        
    }
    

    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        
UserDefaults.standard.set(false, forKey: Keys.isLogedIn)
        
        let signOut = UIStoryboard(name: VCs.main, bundle: nil).instantiateViewController(withIdentifier: VCs.signInVC) as! SignInVC
        self.present(signOut, animated: true, completion: nil)
    }
    

}
